# Skill: Ralph Wiggum Iterative Development

## Purpose

Design and execute autonomous iterative development loops that run until completion. Named after The Simpsons character, Ralph Wiggum embodies the philosophy: "Iteration > Perfection."

## How It Actually Works

**The key insight everyone misses**: Each iteration spawns a **NEW Claude Code instance** with fresh context. Memory persists ONLY through files.

```bash
# The canonical loop (simplified)
for i in $(seq 1 $MAX_ITERATIONS); do
  # NEW Claude Code instance each iteration
  claude --dangerously-skip-permissions -p "$PROMPT"

  # Check for completion
  if grep "<promise>COMPLETE</promise>"; then exit 0; fi
done
```

**Memory persists through:**
- `PRD.md` - Task list with `[ ]` checkboxes
- `progress.txt` - Learnings log (append-only)
- Git commits
- `CLAUDE.md` - Project patterns (if exists)

**NOT through:**
- In-context memory (each iteration starts fresh)
- Conversation history
- Session state

---

## The Workflow

```
STEP 1: Ideate (in Claude Code)
   ↓
   "I want to build X with features Y and Z"
   ↓
   Claude asks clarifying questions (1A, 2B, 3C style)
   ↓
STEP 2: Generate PRD (/ralph-plan)
   ↓
   Claude generates PRD.md and progress.txt
   Claude suggests iteration count: "20-30 recommended"
   ↓
STEP 3: Run Ralph (in terminal)
   ↓
   ./scripts/ralph/ralph.ps1 -MaxIterations 30
   ↓
   Each iteration:
   1. Fresh Claude instance reads PRD.md
   2. Finds first [ ] task
   3. Reads progress.txt for learnings
   4. Implements ONE task
   5. Runs tests
   6. If pass: marks [x], commits, appends to progress.txt
   7. Loops until all [x] or max iterations
   ↓
STEP 4: Review (back in Claude Code)
   ↓
   "Ralph finished, please review"
   ↓
   Claude runs /security-review, /code-review
```

---

## Story Sizing (THE NUMBER ONE RULE)

**Each story must be completable in ONE context window (~10 min of AI work).**

If a story is too big, the AI runs out of context before finishing and produces broken code.

### Right-sized stories:
- Add a database column and migration
- Add a single UI component to an existing page
- Update a server action with new logic
- Add a filter dropdown to a list

### Too big (MUST split):

| Too Big | Split Into |
|---------|-----------|
| "Build the dashboard" | Schema, queries, UI components, filters |
| "Add authentication" | Schema, middleware, login UI, session handling |
| "Add drag and drop" | Drag events, drop zones, state update, persistence |
| "Refactor the API" | One story per endpoint or pattern |

**Rule of thumb:** If you cannot describe the change in 2-3 sentences, it is too big.

---

## Story Ordering (Dependencies First)

Stories execute in priority order. Earlier stories must NOT depend on later ones.

**Correct order:**
1. Schema/database changes (migrations)
2. Server actions / backend logic
3. UI components that use the backend
4. Dashboard/summary views that aggregate data

---

## Acceptance Criteria (Must Be Verifiable)

Each criterion must be something Ralph can CHECK, not something vague.

### Good criteria:
- "Add `status` column to tasks table with default 'pending'"
- "Filter dropdown has options: All, Active, Completed"
- "Typecheck passes"
- "Tests pass"

### Bad criteria:
- "Works correctly"
- "User can do X easily"
- "Good UX"

---

## When to Use Ralph

### Good For

- Multi-task features (3+ stories)
- Overnight/autonomous builds
- Tasks with clear, verifiable success criteria
- Code that has existing tests to verify against
- Refactoring with test coverage

### Not Good For

- Quick single-file fixes (just do it directly)
- Tasks requiring human judgment
- Subjective quality assessments
- Tasks with unclear success criteria
- Real-time collaboration

---

## The Prompt (What Each Iteration Sees)

The Ralph script sends this prompt to each fresh Claude instance:

```markdown
You are Ralph, an autonomous coding agent running in the LEGO Agent OS.
Do exactly ONE task per iteration. You have fresh context each time.

## Context Files (Read These First)

1. **CLAUDE.md** (if exists) - Project-specific patterns and rules
2. **PRD.md** - Task list with [ ] checkboxes (find first incomplete)
3. **progress.txt** - Learnings from previous iterations

## Steps

1. Read CLAUDE.md (if exists) for project context
2. Read PRD.md and find the FIRST task that is NOT complete (marked [ ])
3. Read progress.txt - check Learnings section for patterns
4. Implement that ONE task only
5. Run tests/typecheck to verify it works

## Critical: Only Complete If Tests Pass

- If tests PASS: Mark [x], commit, append to progress.txt
- If tests FAIL: Do NOT mark complete, append failure to progress.txt

## End Condition

After completing your task, check PRD.md:
- If ALL tasks are [x], output: <promise>COMPLETE</promise>
- If tasks remain [ ], just end (next iteration continues)
```

---

## Iteration Estimation

| Stories | Recommended Iterations |
|---------|------------------------|
| 1-2 | 10 (default) |
| 3-5 | 15-25 |
| 6-10 | 30-50 |
| 10+ | 50-100+ |

Use 2-3 iterations per story as baseline. Some stories complete in 1 iteration, others need retries.

---

## Cost Estimation

| Task Complexity | Iterations | Est. Cost (Opus) |
|-----------------|------------|------------------|
| Small feature | 10-20 | $1-3 |
| Medium feature | 30-50 | $3-8 |
| Large refactor | 50-100 | $8-15 |
| Overnight build | 100-200+ | $15-30+ |

Based on ~$0.10-0.15 per iteration with Opus 4.5.

---

## Quality Checklist

### Before Running Ralph

- [ ] PRD.md has clear, verifiable acceptance criteria
- [ ] Stories are small enough (one context window each)
- [ ] Stories are ordered by dependency
- [ ] Tests/typecheck exist to verify work
- [ ] progress.txt is initialized
- [ ] You've set appropriate max iterations

### PRD Quality

- [ ] Each story has `[ ]` checkboxes (not JSON or YAML)
- [ ] Every story has "Typecheck passes" as criterion
- [ ] UI stories have "Verify changes work in browser"
- [ ] Non-goals section defines scope boundaries

---

## Troubleshooting

### Max iterations reached before completion

Check `progress.txt` for patterns:
- Same task failing repeatedly? Story might be too big
- Different errors each time? Missing context in PRD
- Tests flaky? Fix tests before running Ralph

### Task keeps failing

In Claude Code:
```
"Review progress.txt and help me understand what's blocking"
```

Common causes:
- Story too large (split it)
- Acceptance criteria unclear
- Missing dependency
- Flaky tests

---

## Running the Scripts

**Basic usage:**
```powershell
./scripts/ralph/ralph.ps1 -MaxIterations 25
```

```bash
./scripts/ralph/ralph.sh 25
```

---

## Advanced Features

### Configuration File

Create `.ralph/config.yaml` for project-specific settings:

```yaml
iterations:
  default: 10
  sleep: 2

verification:
  playwright:
    enabled: true
    command: npx playwright test

webhooks:
  discord:
    enabled: true
    url: "https://discord.com/api/webhooks/..."

parallel:
  enabled: false
  max_workers: 3
```

### Parallel Execution

Run multiple tasks concurrently using git worktrees:

```powershell
./scripts/ralph/ralph.ps1 -Parallel -Workers 3
```

Each worker:
1. Gets its own git worktree
2. Works on a separate branch (`ralph/US-001`, etc.)
3. Completes tasks independently
4. Branches merge manually after completion

### Webhook Notifications

Get notified on Discord/Slack when:
- All tasks complete
- Max iterations reached
- A task fails repeatedly

### Playwright Integration

For UI tasks, enable Playwright testing in config:

```yaml
verification:
  playwright:
    enabled: true
    command: npx playwright test
```

UI tasks must pass Playwright tests before being marked complete.

### Blocker Detection

Ralph tracks repeated failures and alerts when blocked:

```yaml
blockers:
  max_attempts: 5
  action: notify  # notify | skip | stop
```

---

## Resources

- Scripts: `scripts/ralph/`
- PRD command: `/ralph-plan`
- Research materials: `docs/research/`
- Original technique: https://ghuntley.com/ralph/
