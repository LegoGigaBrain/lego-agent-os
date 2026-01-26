#!/bin/bash
# Ralph Wiggum - Canonical Loop for LEGO Agent OS
# Each iteration spawns a NEW Claude Code instance with fresh context.
# Memory persists ONLY through files: PRD.md, progress.txt, git commits.

set -e

# =============================================================================
# ARGUMENT PARSING
# =============================================================================

MAX_ITERATIONS=0
SLEEP_SECONDS=0
PARALLEL=false
WORKERS=0
TASK=""
SKIP_WEBHOOKS=false
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--max-iterations) MAX_ITERATIONS="$2"; shift 2 ;;
        -s|--sleep) SLEEP_SECONDS="$2"; shift 2 ;;
        -p|--parallel) PARALLEL=true; shift ;;
        -w|--workers) WORKERS="$2"; shift 2 ;;
        -t|--task) TASK="$2"; shift 2 ;;
        --skip-webhooks) SKIP_WEBHOOKS=true; shift ;;
        -v|--verbose) VERBOSE=true; shift ;;
        *)
            # Positional args: first is max iterations, second is sleep
            if [[ $MAX_ITERATIONS -eq 0 ]]; then
                MAX_ITERATIONS="$1"
            elif [[ $SLEEP_SECONDS -eq 0 ]]; then
                SLEEP_SECONDS="$1"
            fi
            shift
            ;;
    esac
done

# =============================================================================
# CONFIG LOADING
# =============================================================================

CONFIG_PATH=""
CONFIG_ITERATIONS=10
CONFIG_SLEEP=2
CONFIG_PARALLEL=false
CONFIG_MAX_WORKERS=3
CONFIG_DISCORD_URL=""
CONFIG_SLACK_URL=""
CONFIG_PLAYWRIGHT_ENABLED=false
CONFIG_PLAYWRIGHT_COMMAND="npx playwright test"
CONFIG_PROMPT_ADDITIONS=""

load_config() {
    local config_files=(".ralph/config.yaml" ".ralph/config.yml" "ralph.config.yaml")

    for path in "${config_files[@]}"; do
        if [[ -f "$path" ]]; then
            CONFIG_PATH="$path"
            [[ "$VERBOSE" == "true" ]] && echo "Loading config from: $path"

            local content
            content=$(cat "$path")

            # Parse iterations
            if [[ $content =~ default:[[:space:]]*([0-9]+) ]]; then
                CONFIG_ITERATIONS="${BASH_REMATCH[1]}"
            fi

            # Parse sleep
            if [[ $content =~ sleep:[[:space:]]*([0-9]+) ]]; then
                CONFIG_SLEEP="${BASH_REMATCH[1]}"
            fi

            # Parse parallel enabled
            if echo "$content" | grep -q "parallel:" && echo "$content" | grep -A1 "parallel:" | grep -q "enabled: true"; then
                CONFIG_PARALLEL=true
            fi

            # Parse max workers
            if [[ $content =~ max_workers:[[:space:]]*([0-9]+) ]]; then
                CONFIG_MAX_WORKERS="${BASH_REMATCH[1]}"
            fi

            # Parse Discord webhook
            if echo "$content" | grep -q "discord:" && echo "$content" | grep -A2 "discord:" | grep -q "enabled: true"; then
                CONFIG_DISCORD_URL=$(echo "$content" | grep -A3 "discord:" | grep "url:" | sed 's/.*url:[[:space:]]*"\([^"]*\)".*/\1/')
            fi

            # Parse Slack webhook
            if echo "$content" | grep -q "slack:" && echo "$content" | grep -A2 "slack:" | grep -q "enabled: true"; then
                CONFIG_SLACK_URL=$(echo "$content" | grep -A3 "slack:" | grep "url:" | sed 's/.*url:[[:space:]]*"\([^"]*\)".*/\1/')
            fi

            # Parse Playwright
            if echo "$content" | grep -q "playwright:" && echo "$content" | grep -A1 "playwright:" | grep -q "enabled: true"; then
                CONFIG_PLAYWRIGHT_ENABLED=true
                local cmd
                cmd=$(echo "$content" | grep -A2 "playwright:" | grep "command:" | sed 's/.*command:[[:space:]]*//')
                [[ -n "$cmd" ]] && CONFIG_PLAYWRIGHT_COMMAND="$cmd"
            fi

            break
        fi
    done
}

load_config

# Apply config defaults if args not specified
[[ $MAX_ITERATIONS -eq 0 ]] && MAX_ITERATIONS=$CONFIG_ITERATIONS
[[ $SLEEP_SECONDS -eq 0 ]] && SLEEP_SECONDS=$CONFIG_SLEEP
[[ $WORKERS -eq 0 ]] && WORKERS=$CONFIG_MAX_WORKERS

# =============================================================================
# WEBHOOK FUNCTIONS
# =============================================================================

send_webhook() {
    local event="$1"
    local message="$2"
    local details="${3:-}"

    [[ "$SKIP_WEBHOOKS" == "true" ]] && return

    # Color based on event
    local color
    case $event in
        complete) color=65280 ;;      # Green
        max_reached) color=16776960 ;; # Yellow
        task_done) color=3447003 ;;    # Blue
        task_failed) color=15158332 ;; # Red
        *) color=9807270 ;;            # Gray
    esac

    # Discord webhook
    if [[ -n "$CONFIG_DISCORD_URL" ]]; then
        local payload
        payload=$(cat <<EOF
{
  "content": "**Ralph Wiggum** [$event]\n$message",
  "embeds": [{"description": "$details", "color": $color}]
}
EOF
)
        curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$CONFIG_DISCORD_URL" > /dev/null 2>&1 || true
    fi

    # Slack webhook
    if [[ -n "$CONFIG_SLACK_URL" ]]; then
        local payload
        payload=$(cat <<EOF
{"text": "$message\n$details"}
EOF
)
        curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$CONFIG_SLACK_URL" > /dev/null 2>&1 || true
    fi
}

# =============================================================================
# PARALLEL EXECUTION (Git Worktrees)
# =============================================================================

start_parallel_execution() {
    echo ""
    echo "==========================================="
    echo "  Ralph Wiggum - PARALLEL MODE"
    echo "  Workers: $WORKERS"
    echo "==========================================="
    echo ""

    # Create worktree directory
    local worktree_dir=".ralph-worktrees"
    mkdir -p "$worktree_dir"

    # Read PRD to get tasks
    if [[ ! -f "PRD.md" ]]; then
        echo "ERROR: PRD.md not found. Run /ralph-plan first."
        exit 1
    fi

    # Extract incomplete tasks
    local incomplete_tasks
    incomplete_tasks=$(grep -E '### US-[0-9]+:' PRD.md | while read -r line; do
        task_id=$(echo "$line" | grep -oE 'US-[0-9]+')
        # Check if this task has incomplete items
        if grep -A20 "### $task_id:" PRD.md | grep -q '\[ \]'; then
            echo "$task_id"
        fi
    done)

    local task_count
    task_count=$(echo "$incomplete_tasks" | grep -c . || echo 0)

    if [[ $task_count -eq 0 ]]; then
        echo "All tasks already complete!"
        exit 0
    fi

    echo "Found $task_count incomplete tasks"
    echo "Starting $WORKERS parallel workers..."
    echo ""

    # Get current branch
    local current_branch
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    # Start workers
    local pids=()
    local worker=0

    for task_id in $incomplete_tasks; do
        if [[ $worker -ge $WORKERS ]]; then
            break
        fi

        local worktree_path="$worktree_dir/worker-$worker"
        local branch_name="ralph/$task_id"

        echo "Worker $worker: Setting up for $task_id..."

        # Create branch and worktree
        git branch "$branch_name" "$current_branch" 2>/dev/null || true
        [[ -d "$worktree_path" ]] && git worktree remove "$worktree_path" --force 2>/dev/null || true
        git worktree add "$worktree_path" "$branch_name" 2>/dev/null

        # Start worker in background
        (
            cd "$worktree_path"
            ./scripts/ralph/ralph.sh --max-iterations "$MAX_ITERATIONS" --sleep "$SLEEP_SECONDS" --task "$task_id" --skip-webhooks
        ) &
        pids+=($!)

        ((worker++))
    done

    echo ""
    echo "Monitoring workers..."

    # Wait for all workers
    for pid in "${pids[@]}"; do
        wait "$pid" || true
    done

    # Cleanup worktrees
    echo ""
    echo "Cleaning up worktrees..."
    for ((w=0; w<WORKERS; w++)); do
        local worktree_path="$worktree_dir/worker-$w"
        [[ -d "$worktree_path" ]] && git worktree remove "$worktree_path" --force 2>/dev/null || true
    done

    echo ""
    echo "Parallel execution complete. Merge branches manually if needed."
    send_webhook "complete" "Parallel execution finished" "Workers: $WORKERS"
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

if [[ "$PARALLEL" == "true" ]] || { [[ "$CONFIG_PARALLEL" == "true" ]] && [[ -z "$TASK" ]]; }; then
    start_parallel_execution
    exit 0
fi

echo ""
echo "==========================================="
echo "  Ralph Wiggum - LEGO Agent OS"
echo "  Max iterations: $MAX_ITERATIONS"
[[ -n "$CONFIG_PATH" ]] && echo "  Config: $CONFIG_PATH"
echo "==========================================="
echo ""

# Verify required files exist
if [[ ! -f "PRD.md" ]]; then
    echo "ERROR: PRD.md not found. Run /ralph-plan first to generate it."
    exit 1
fi

if [[ ! -f "progress.txt" ]]; then
    echo "WARNING: progress.txt not found. Creating empty file."
    cat > progress.txt << 'EOF'
# Progress Log

## Learnings
(Patterns discovered during implementation)

---
EOF
fi

# Build prompt sections
TASK_FILTER=""
[[ -n "$TASK" ]] && TASK_FILTER="

## IMPORTANT: Only work on task $TASK"

PLAYWRIGHT_SECTION=""
[[ "$CONFIG_PLAYWRIGHT_ENABLED" == "true" ]] && PLAYWRIGHT_SECTION="

## Browser Testing (Playwright)
After implementing UI changes, run: $CONFIG_PLAYWRIGHT_COMMAND
Only mark UI tasks complete if Playwright tests pass."

PROMPT_ADDITIONS=""
[[ -n "$CONFIG_PROMPT_ADDITIONS" ]] && PROMPT_ADDITIONS="

## Project-Specific Notes
$CONFIG_PROMPT_ADDITIONS"

PROMPT="You are Ralph, an autonomous coding agent running in the LEGO Agent OS.
Do exactly ONE task per iteration. You have fresh context each time.

## Context Files (Read These First)

1. **CLAUDE.md** (if exists) - Project-specific patterns and rules
2. **PRD.md** - Task list with [ ] checkboxes (find first incomplete)
3. **progress.txt** - Learnings section contains patterns from previous iterations
$TASK_FILTER

## Steps

1. Read CLAUDE.md (if exists) for project context
2. Read PRD.md and find the FIRST task that is NOT complete (marked [ ])
3. Read progress.txt - check the Learnings section for patterns from previous iterations
4. Implement that ONE task only
5. Run tests/typecheck to verify it works
$PLAYWRIGHT_SECTION

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
- Add patterns like: \"This codebase uses X for Y\" or \"Always do Z when changing W\"
- Only add genuinely reusable knowledge, not task-specific details
$PROMPT_ADDITIONS

## End Condition

After completing your task, check PRD.md:
- If ALL tasks are [x], output exactly: <promise>COMPLETE</promise>
- If tasks remain [ ], just end your response (next iteration will continue)"

# Track task failures
declare -A task_failures

for ((i=1; i<=MAX_ITERATIONS; i++)); do
    echo "==========================================="
    echo "  Iteration $i of $MAX_ITERATIONS"
    echo "==========================================="
    echo ""

    result=$(claude --dangerously-skip-permissions -p "$PROMPT" 2>&1)

    echo "$result"
    echo ""

    # Track task failures for blocker detection
    if [[ $result =~ US-([0-9]+) ]]; then
        current_task="US-${BASH_REMATCH[1]}"
        if echo "$result" | grep -qiE 'FAIL|ERROR|failed'; then
            task_failures[$current_task]=$((${task_failures[$current_task]:-0} + 1))

            if [[ ${task_failures[$current_task]} -ge 5 ]]; then
                echo "WARNING: Task $current_task has failed 5+ times - may be blocked"
                send_webhook "task_failed" "Task $current_task appears blocked" "Failed ${task_failures[$current_task]} times"
            fi
        else
            task_failures[$current_task]=0
            send_webhook "task_done" "Task $current_task completed" "Iteration $i"
        fi
    fi

    if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
        echo "==========================================="
        echo "  All tasks complete after $i iterations!"
        echo "==========================================="
        echo ""
        echo "Next steps:"
        echo "  1. Review progress.txt for learnings"
        echo "  2. Run /security-review or /code-review in Claude Code"
        echo "  3. Push changes when ready"
        echo ""

        send_webhook "complete" "All tasks complete!" "Finished in $i iterations"
        exit 0
    fi

    sleep $SLEEP_SECONDS
done

echo "==========================================="
echo "  Reached max iterations ($MAX_ITERATIONS)"
echo "==========================================="
echo ""
echo "Not all tasks completed. Check progress.txt for blockers."
echo "Options:"
echo "  1. Review progress.txt to understand what's blocking"
echo "  2. Resume with: ./scripts/ralph/ralph.sh $MAX_ITERATIONS"
echo "  3. Get help in Claude Code: 'Review progress.txt and help me unblock'"
echo ""

send_webhook "max_reached" "Hit max iterations ($MAX_ITERATIONS)" "Check progress.txt for blockers"
exit 1
