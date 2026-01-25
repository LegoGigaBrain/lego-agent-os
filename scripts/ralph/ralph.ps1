# Ralph Wiggum - Canonical Loop for LEGO Agent OS
# Each iteration spawns a NEW Claude Code instance with fresh context.
# Memory persists ONLY through files: PRD.md, progress.txt, git commits.

param(
    [int]$MaxIterations = 0,  # 0 = use config default or 10
    [int]$SleepSeconds = 0,   # 0 = use config default or 2
    [switch]$Parallel,        # Enable parallel execution
    [int]$Workers = 0,        # Number of parallel workers (0 = use config)
    [string]$Task = "",       # Specific task ID to run (for parallel)
    [switch]$SkipWebhooks,    # Disable webhook notifications
    [switch]$Verbose
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# =============================================================================
# CONFIG LOADING
# =============================================================================

function Load-Config {
    $configPaths = @(
        ".ralph/config.yaml",
        ".ralph/config.yml",
        "ralph.config.yaml"
    )

    foreach ($path in $configPaths) {
        if (Test-Path $path) {
            if ($Verbose) { Write-Host "Loading config from: $path" }
            # Simple YAML parsing for key settings
            $content = Get-Content $path -Raw
            return @{
                Path = $path
                Content = $content
                Iterations = if ($content -match 'default:\s*(\d+)') { [int]$Matches[1] } else { 10 }
                Sleep = if ($content -match 'sleep:\s*(\d+)') { [int]$Matches[1] } else { 2 }
                ParallelEnabled = $content -match 'parallel:\s*\n\s*enabled:\s*true'
                MaxWorkers = if ($content -match 'max_workers:\s*(\d+)') { [int]$Matches[1] } else { 3 }
                DiscordUrl = if ($content -match 'discord:\s*\n\s*enabled:\s*true\s*\n\s*url:\s*"([^"]+)"') { $Matches[1] } else { "" }
                SlackUrl = if ($content -match 'slack:\s*\n\s*enabled:\s*true\s*\n\s*url:\s*"([^"]+)"') { $Matches[1] } else { "" }
                PlaywrightEnabled = $content -match 'playwright:\s*\n\s*enabled:\s*true'
                PlaywrightCommand = if ($content -match 'playwright:.*?command:\s*(.+)') { $Matches[1].Trim() } else { "npx playwright test" }
                PromptAdditions = if ($content -match 'additions:\s*\|(.+?)(?=\n\w|\z)') { $Matches[1] } else { "" }
            }
        }
    }

    # Return defaults if no config found
    return @{
        Path = $null
        Iterations = 10
        Sleep = 2
        ParallelEnabled = $false
        MaxWorkers = 3
        DiscordUrl = ""
        SlackUrl = ""
        PlaywrightEnabled = $false
        PlaywrightCommand = "npx playwright test"
        PromptAdditions = ""
    }
}

$config = Load-Config

# Apply config defaults if params not specified
if ($MaxIterations -eq 0) { $MaxIterations = $config.Iterations }
if ($SleepSeconds -eq 0) { $SleepSeconds = $config.Sleep }
if ($Workers -eq 0) { $Workers = $config.MaxWorkers }

# =============================================================================
# WEBHOOK FUNCTIONS
# =============================================================================

function Send-Webhook {
    param(
        [string]$Event,
        [string]$Message,
        [string]$Details = ""
    )

    if ($SkipWebhooks) { return }

    $payload = @{
        content = "**Ralph Wiggum** [$Event]`n$Message"
        embeds = @()
    }

    if ($Details) {
        $payload.embeds += @{
            description = $Details
            color = switch ($Event) {
                "complete" { 65280 }      # Green
                "max_reached" { 16776960 } # Yellow
                "task_done" { 3447003 }    # Blue
                "task_failed" { 15158332 } # Red
                default { 9807270 }        # Gray
            }
        }
    }

    # Discord
    if ($config.DiscordUrl) {
        try {
            Invoke-RestMethod -Uri $config.DiscordUrl -Method Post -ContentType "application/json" -Body ($payload | ConvertTo-Json -Depth 5) -ErrorAction SilentlyContinue | Out-Null
        } catch {
            if ($Verbose) { Write-Warning "Discord webhook failed: $_" }
        }
    }

    # Slack
    if ($config.SlackUrl) {
        $slackPayload = @{ text = "$Message`n$Details" }
        try {
            Invoke-RestMethod -Uri $config.SlackUrl -Method Post -ContentType "application/json" -Body ($slackPayload | ConvertTo-Json) -ErrorAction SilentlyContinue | Out-Null
        } catch {
            if ($Verbose) { Write-Warning "Slack webhook failed: $_" }
        }
    }
}

# =============================================================================
# PARALLEL EXECUTION (Git Worktrees)
# =============================================================================

function Start-ParallelExecution {
    Write-Host ""
    Write-Host "==========================================="
    Write-Host "  Ralph Wiggum - PARALLEL MODE"
    Write-Host "  Workers: $Workers"
    Write-Host "==========================================="
    Write-Host ""

    # Create worktree directory
    $worktreeDir = ".ralph-worktrees"
    if (-not (Test-Path $worktreeDir)) {
        New-Item -ItemType Directory -Path $worktreeDir | Out-Null
    }

    # Read PRD to get tasks
    if (-not (Test-Path "PRD.md")) {
        Write-Error "PRD.md not found. Run /ralph-plan first."
        exit 1
    }

    $prdContent = Get-Content "PRD.md" -Raw
    $incompleteTasks = [regex]::Matches($prdContent, '### (US-\d+):[^\n]+\n[\s\S]*?(?=###|\z)') |
        Where-Object { $_.Value -match '\[ \]' } |
        ForEach-Object { ($_.Groups[1].Value) }

    if ($incompleteTasks.Count -eq 0) {
        Write-Host "All tasks already complete!"
        exit 0
    }

    Write-Host "Found $($incompleteTasks.Count) incomplete tasks"
    Write-Host "Starting $Workers parallel workers..."
    Write-Host ""

    # Create worktrees and start workers
    $jobs = @()
    $currentBranch = git rev-parse --abbrev-ref HEAD

    for ($w = 0; $w -lt [Math]::Min($Workers, $incompleteTasks.Count); $w++) {
        $taskId = $incompleteTasks[$w]
        $worktreePath = "$worktreeDir/worker-$w"
        $branchName = "ralph/$taskId"

        Write-Host "Worker ${w}: Setting up for ${taskId}..."

        # Create branch and worktree
        git branch $branchName $currentBranch 2>$null
        if (Test-Path $worktreePath) {
            git worktree remove $worktreePath --force 2>$null
        }
        git worktree add $worktreePath $branchName 2>$null

        # Start worker job
        $job = Start-Job -ScriptBlock {
            param($path, $task, $maxIter, $sleep)
            Set-Location $path
            & "./scripts/ralph/ralph.ps1" -MaxIterations $maxIter -SleepSeconds $sleep -Task $task -SkipWebhooks
        } -ArgumentList (Resolve-Path $worktreePath), $taskId, $MaxIterations, $SleepSeconds

        $jobs += @{ Job = $job; Task = $taskId; Worker = $w }
    }

    Write-Host ""
    Write-Host "Monitoring workers..."

    # Monitor jobs
    while ($jobs | Where-Object { $_.Job.State -eq 'Running' }) {
        foreach ($j in $jobs) {
            if ($j.Job.State -eq 'Completed' -and -not $j.Reported) {
                Write-Host "Worker $($j.Worker) ($($j.Task)): Complete"
                $j.Reported = $true
            }
        }
        Start-Sleep -Seconds 5
    }

    # Cleanup worktrees
    Write-Host ""
    Write-Host "Cleaning up worktrees..."
    for ($w = 0; $w -lt $Workers; $w++) {
        $worktreePath = "$worktreeDir/worker-$w"
        if (Test-Path $worktreePath) {
            git worktree remove $worktreePath --force 2>$null
        }
    }

    Write-Host ""
    Write-Host "Parallel execution complete. Merge branches manually if needed."
    Send-Webhook -Event "complete" -Message "Parallel execution finished" -Details "Workers: $Workers"
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

if ($Parallel -or ($config.ParallelEnabled -and -not $Task)) {
    Start-ParallelExecution
    exit 0
}

Write-Host ""
Write-Host "==========================================="
Write-Host "  Ralph Wiggum - LEGO Agent OS"
Write-Host "  Max iterations: $MaxIterations"
if ($config.Path) { Write-Host "  Config: $($config.Path)" }
Write-Host "==========================================="
Write-Host ""

# Verify required files exist
if (-not (Test-Path "PRD.md")) {
    Write-Error "PRD.md not found. Run /ralph-plan first to generate it."
    exit 1
}

if (-not (Test-Path "progress.txt")) {
    Write-Warning "progress.txt not found. Creating empty file."
    @"
# Progress Log

## Learnings
(Patterns discovered during implementation)

---
"@ | Out-File -FilePath "progress.txt" -Encoding utf8
}

# Build prompt with optional additions
$promptAdditions = ""
if ($config.PromptAdditions) {
    $promptAdditions = "`n`n## Project-Specific Notes`n$($config.PromptAdditions)"
}

$playwrightSection = ""
if ($config.PlaywrightEnabled) {
    $playwrightSection = @"

## Browser Testing (Playwright)
After implementing UI changes, run: $($config.PlaywrightCommand)
Only mark UI tasks complete if Playwright tests pass.
"@
}

$taskFilter = ""
if ($Task) {
    $taskFilter = "`n`n## IMPORTANT: Only work on task $Task"
}

$prompt = @"
You are Ralph, an autonomous coding agent running in the LEGO Agent OS.
Do exactly ONE task per iteration. You have fresh context each time.

## Context Files (Read These First)

1. **CLAUDE.md** (if exists) - Project-specific patterns and rules
2. **PRD.md** - Task list with [ ] checkboxes (find first incomplete)
3. **progress.txt** - Learnings section contains patterns from previous iterations
$taskFilter

## Steps

1. Read CLAUDE.md (if exists) for project context
2. Read PRD.md and find the FIRST task that is NOT complete (marked [ ])
3. Read progress.txt - check the Learnings section for patterns from previous iterations
4. Implement that ONE task only
5. Run tests/typecheck to verify it works
$playwrightSection

## Critical: Only Complete If Tests Pass

- If tests PASS:
  - Update PRD.md to mark the task complete (change [ ] to [x])
  - Commit your changes with message: feat: [task description]
  - Append what worked to progress.txt

- If tests FAIL:
  - Do NOT mark the task complete
  - Do NOT commit broken code
  - Append what went wrong to progress.txt (so next iteration can learn)

## Progress Notes Format

Append to progress.txt using this format:

## Iteration [N] - [Task Name]
- What was implemented
- Files changed
- Learnings for future iterations:
  - Patterns discovered
  - Gotchas encountered
  - Useful context
---

## Update CLAUDE.md (If Applicable)

If you discover a reusable pattern that future work should know about:
- Check if CLAUDE.md exists in the project root
- Add patterns like: 'This codebase uses X for Y' or 'Always do Z when changing W'
- Only add genuinely reusable knowledge, not task-specific details
$promptAdditions

## End Condition

After completing your task, check PRD.md:
- If ALL tasks are [x], output exactly: <promise>COMPLETE</promise>
- If tasks remain [ ], just end your response (next iteration will continue)
"@

$taskFailures = @{}

for ($i = 1; $i -le $MaxIterations; $i++) {
    Write-Host "==========================================="
    Write-Host "  Iteration $i of $MaxIterations"
    Write-Host "==========================================="
    Write-Host ""

    # Capture stdout+stderr and preserve newlines
    $result = (& claude --dangerously-skip-permissions -p $prompt 2>&1 | Out-String)

    Write-Host $result
    Write-Host ""

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Claude exited with code $LASTEXITCODE (continuing to next iteration)"
    }

    # Track task failures for blocker detection
    if ($result -match 'US-(\d+)') {
        $currentTask = "US-$($Matches[1])"
        if ($result -match 'FAIL|ERROR|failed') {
            if (-not $taskFailures.ContainsKey($currentTask)) {
                $taskFailures[$currentTask] = 0
            }
            $taskFailures[$currentTask]++

            if ($taskFailures[$currentTask] -ge 5) {
                Write-Warning "Task $currentTask has failed 5+ times - may be blocked"
                Send-Webhook -Event "task_failed" -Message "Task $currentTask appears blocked" -Details "Failed $($taskFailures[$currentTask]) times"
            }
        } else {
            # Reset on success
            $taskFailures[$currentTask] = 0
            Send-Webhook -Event "task_done" -Message "Task $currentTask completed" -Details "Iteration $i"
        }
    }

    if ($result -match "<promise>COMPLETE</promise>") {
        Write-Host "==========================================="
        Write-Host "  All tasks complete after $i iterations!"
        Write-Host "==========================================="
        Write-Host ""
        Write-Host "Next steps:"
        Write-Host "  1. Review progress.txt for learnings"
        Write-Host "  2. Run /security-review or /code-review in Claude Code"
        Write-Host "  3. Push changes when ready"
        Write-Host ""

        Send-Webhook -Event "complete" -Message "All tasks complete!" -Details "Finished in $i iterations"
        exit 0
    }

    Start-Sleep -Seconds $SleepSeconds
}

Write-Host "==========================================="
Write-Host "  Reached max iterations ($MaxIterations)"
Write-Host "==========================================="
Write-Host ""
Write-Host "Not all tasks completed. Check progress.txt for blockers."
Write-Host "Options:"
Write-Host "  1. Review progress.txt to understand what's blocking"
Write-Host "  2. Resume with: ./scripts/ralph/ralph.ps1 -MaxIterations 10"
Write-Host "  3. Get help in Claude Code: 'Review progress.txt and help me unblock'"
Write-Host ""

Send-Webhook -Event "max_reached" -Message "Hit max iterations ($MaxIterations)" -Details "Check progress.txt for blockers"
exit 1
