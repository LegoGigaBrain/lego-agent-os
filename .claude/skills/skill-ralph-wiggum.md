# Skill: Ralph Wiggum Iterative Development

## Purpose

Design and execute autonomous iterative development loops that run until completion. Use this skill when tasks require persistent iteration, refinement, and self-correction. Named after The Simpsons character, it embodies the philosophy: "Iteration > Perfection."

## Standards Awareness

Before applying this skill, ensure familiarity with:
- `standards/global/testing-principles.md`
- `standards/global/code-style.md`
- Project-specific verification methods (tests, linters, type checks)

---

## Core Philosophy

> "It's better to fail predictably than succeed unpredictably."

Ralph Wiggum is deterministically bad in an undeterministic world. Success depends on:
- Writing good prompts, not just having a good model
- Clear completion criteria
- Mechanical execution with automatic verification
- Persistent iteration despite setbacks

---

## How It Works

```
while :; do
  cat PROMPT.md | claude
done
```

1. Claude works on the task
2. Claude tries to exit
3. Stop hook blocks exit
4. Same prompt feeds back
5. Claude sees its previous work (files, git history)
6. Loop repeats until completion promise detected or iteration limit reached

**Key insight**: Each iteration has full context of what came before. Claude isn't restarting. It's reviewing and improving.

---

## The Prompt Architecture Framework

### 1. Task Definition Block

```
## Task
[Clear, specific description of what to build/achieve]

## Success Criteria
- [ ] Criterion 1 (verifiable)
- [ ] Criterion 2 (verifiable)
- [ ] Criterion 3 (verifiable)
```

### 2. Phased Execution Block

Break work into discrete, completable phases:

```
## Phases

### Phase 1: [Name]
Goal: [Specific outcome]
Verification: [How to know it's done]
- Step 1
- Step 2
- Step 3

### Phase 2: [Name]
Goal: [Specific outcome]
Verification: [How to know it's done]
- Step 1
- Step 2
- Step 3
```

### 3. Self-Correction Block

Build in TDD-style feedback loops:

```
## Iteration Protocol

1. Check current state (run tests, check types, lint)
2. Identify what's failing or missing
3. Fix ONE issue per iteration
4. Verify the fix
5. If all green, move to next phase
6. If still failing, analyze error and retry
7. Document blockers after 5 failed attempts on same issue
```

### 4. Escape Hatch Block

Always include failure handling:

```
## If Stuck

After [N] iterations on the same issue:
1. Document what's blocking progress
2. List approaches already attempted
3. Suggest alternative strategies
4. Output: <blocker>DESCRIPTION</blocker>

## Max Iterations Safety
This loop will stop after [N] iterations regardless of completion.
```

### 5. Completion Promise Block

```
## Completion Signal

When ALL of the following are true:
- [ ] All tests passing
- [ ] All success criteria met
- [ ] Code compiles/builds without errors
- [ ] Documentation updated

Output EXACTLY: <promise>COMPLETE</promise>

Do NOT output the completion promise until ALL criteria are verified.
```

---

## Prompt Templates

### Template: Feature Implementation

```markdown
## Task
Implement [FEATURE NAME] with the following requirements:
[Detailed requirements]

## Success Criteria
- [ ] All CRUD operations working
- [ ] Input validation in place
- [ ] Test coverage > 80%
- [ ] No TypeScript errors
- [ ] Documentation complete

## Phases

### Phase 1: Foundation
- Set up file structure
- Define types/interfaces
- Write failing tests

### Phase 2: Implementation
- Implement core logic
- Pass all tests
- Add error handling

### Phase 3: Polish
- Refactor for clarity
- Add edge case tests
- Update docs

## Iteration Protocol
1. Run `npm test` to see current state
2. Fix failing tests one at a time
3. Run `npm run typecheck` after each fix
4. Commit working increments

## If Stuck
After 10 iterations on same error:
- Document the blocker
- Output: <blocker>DESCRIPTION</blocker>

## Completion Signal
When all tests pass and criteria met:
<promise>COMPLETE</promise>
```

### Template: Refactoring

```markdown
## Task
Refactor [TARGET] to [GOAL].

## Success Criteria
- [ ] All existing tests still pass
- [ ] New pattern implemented
- [ ] No regressions
- [ ] Performance maintained or improved

## Approach
1. Identify all usages of current pattern
2. Create new abstraction
3. Migrate one usage at a time
4. Run tests after each migration
5. Remove old code only after all migrations complete

## Iteration Protocol
1. Run full test suite
2. If green, migrate next usage
3. If red, fix before continuing
4. Never migrate multiple usages in one iteration

## Completion Signal
When all usages migrated and tests green:
<promise>COMPLETE</promise>
```

### Template: Test Coverage

```markdown
## Task
Increase test coverage for [TARGET] to [PERCENTAGE]%.

## Success Criteria
- [ ] Coverage meets target
- [ ] All new tests are meaningful (not just line coverage)
- [ ] No flaky tests
- [ ] Tests run in < [N] seconds

## Approach
1. Run coverage report to identify gaps
2. Prioritize: error paths > edge cases > happy paths
3. Write one test file per iteration
4. Verify tests actually catch bugs

## Iteration Protocol
1. Run `npm run coverage`
2. Identify lowest-coverage module
3. Write tests for one uncovered path
4. Verify test fails when code is broken
5. Move to next gap

## Completion Signal
When coverage >= [PERCENTAGE]%:
<promise>COMPLETE</promise>
```

### Template: E2E Testing with Playwright

```markdown
## Task
Build [FEATURE] with full E2E test coverage using Playwright.

## Success Criteria
- [ ] Feature renders correctly
- [ ] All user interactions work
- [ ] All Playwright E2E tests pass
- [ ] No console errors in browser

## Phases

### Phase 1: Component Structure
- Create component files
- Set up basic rendering
- Write Playwright test skeleton

### Phase 2: Functionality
- Implement user interactions
- Add form validation
- Handle edge cases

### Phase 3: E2E Verification
- Run all Playwright tests
- Fix any failures
- Verify in real browser

## Iteration Protocol
1. Write/update component code
2. Run: `npx playwright test [test-file].spec.ts`
3. If tests fail, read error output
4. Fix the specific failure
5. Run tests again
6. Repeat until green

## Playwright Commands
- Run all tests: `npx playwright test`
- Run specific test: `npx playwright test login.spec.ts`
- Debug mode: `npx playwright test --debug`
- Show report: `npx playwright show-report`

## Completion Signal
When ALL Playwright tests pass:
<promise>COMPLETE</promise>
```

### Template: Browser Automation

```markdown
## Task
[BROWSER AUTOMATION TASK DESCRIPTION]

## Success Criteria
- [ ] Successfully navigates to target pages
- [ ] Extracts/interacts with required elements
- [ ] Handles errors gracefully
- [ ] Output data is valid and complete

## Approach
1. Use Playwright MCP to control browser
2. Take accessibility snapshots (not screenshots) for efficiency
3. Handle pagination/navigation
4. Validate extracted data

## Iteration Protocol
1. Navigate to page using Playwright
2. Take accessibility snapshot
3. Identify target elements
4. Perform action (click, fill, extract)
5. Validate result
6. If error, adjust selector and retry

## Playwright MCP Usage
- Navigate: "Use playwright to navigate to [URL]"
- Snapshot: "Take accessibility snapshot of current page"
- Click: "Click the element with text [TEXT]"
- Fill: "Fill the input field [NAME] with [VALUE]"
- Extract: "Extract all [ELEMENT TYPE] from the page"

## Completion Signal
When task complete and data validated:
<promise>COMPLETE</promise>
```

### Template: Migration

```markdown
## Task
Migrate [SOURCE] to [TARGET].

## Success Criteria
- [ ] All functionality preserved
- [ ] All tests pass
- [ ] No deprecated patterns remain
- [ ] Documentation updated

## Approach
1. Create parallel implementation
2. Migrate one module at a time
3. Run tests after each migration
4. Remove old code only when all tests pass

## Iteration Protocol
1. Identify next module to migrate
2. Create new implementation
3. Update imports/references
4. Run full test suite
5. If green, continue to next
6. If red, fix before continuing

## Completion Signal
When migration complete and tests green:
<promise>COMPLETE</promise>
```

---

## Command Syntax

```bash
/ralph-loop "<prompt>" --max-iterations <n> --completion-promise "<text>"
```

**Options:**
- `--max-iterations <n>` - Safety limit (ALWAYS use this)
- `--completion-promise "<text>"` - Exact string that signals completion

**Example:**
```bash
/ralph-loop "Build a REST API for todos. Requirements: CRUD, validation, tests. Output <promise>COMPLETE</promise> when done." --completion-promise "COMPLETE" --max-iterations 50
```

---

## Cost Estimation

### Token Usage per Iteration

| Task Type | Avg Tokens/Iteration |
|-----------|---------------------|
| Small fix | 2,000-5,000 |
| Feature work | 5,000-15,000 |
| Complex refactor | 10,000-25,000 |
| E2E with Playwright | 8,000-20,000 |

### Iteration Estimates

| Task Complexity | Typical Iterations |
|-----------------|-------------------|
| Small feature | 10-20 |
| Medium feature | 30-50 |
| Large refactor | 50-100 |
| Overnight build | 100-200+ |

### Cost Formula

```
Estimated Cost = (Iterations x Tokens/Iteration x $0.000015)

Example: 50 iterations x 10,000 tokens x $0.000015 = $7.50
```

### Pro Max Subscription Limits

| Plan | 5-Hour Limit | Weekly Sonnet Hours |
|------|--------------|---------------------|
| Max 5x ($100/mo) | ~50-200 prompts | 140-280 hours |
| Max 20x ($200/mo) | ~200-800 prompts | 240-480 hours |

**Guidance:**
- Light usage (1-2 loops/day): Max 5x sufficient
- Heavy usage (multiple long loops): May hit limits
- Overnight runs: Consider Max 20x or API credits

---

## When to Use Ralph

### Good For

| Use Case | Verification Method |
|----------|---------------------|
| Feature building | Unit tests, integration tests |
| Refactoring | Existing test suite |
| Test coverage | Coverage reports |
| E2E testing | Playwright tests |
| Browser automation | Playwright assertions |
| Code migration | Full test suite |
| Documentation | Doc coverage tools |
| Linting/formatting | ESLint, Prettier |
| Type fixes | TypeScript compiler |
| Security fixes | Security audit tools |

### Not Good For

- Tasks requiring human judgment or design decisions
- Subjective quality assessments
- Production debugging (use targeted debugging instead)
- Tasks with unclear success criteria
- One-shot operations
- Anything needing real-time feedback

---

## Quality Checklist

### Before Starting Loop
- [ ] Success criteria are specific and verifiable
- [ ] Verification method exists (tests, linter, etc.)
- [ ] `--max-iterations` is set as safety net
- [ ] Completion promise is defined
- [ ] Escape hatches are documented
- [ ] Phases are small and incremental
- [ ] Cost estimate is acceptable

### Prompt Quality
- [ ] Task is mechanically executable
- [ ] Each phase has clear verification
- [ ] Self-correction protocol included
- [ ] Blocker handling defined
- [ ] No ambiguous requirements

### During Loop
- [ ] Each iteration makes measurable progress
- [ ] Failures are documented, not repeated
- [ ] Git commits preserve working states

---

## Anti-Patterns

- Vague completion criteria ("make it good")
- No iteration limit (infinite loop risk)
- Multiple goals per phase (scope creep)
- No verification method (can't know when done)
- Subjective success criteria (can't be automated)
- Prompts that change between iterations
- No escape hatch for blockers
- Skipping cost estimation for large tasks

---

## Real-World Results

- 6 repositories shipped overnight in YC hackathon ($297 API cost)
- $50k contract completed autonomously
- Complete programming language built over 3 months with single prompt
- Typical API builds complete in 20-40 iterations

---

## Plugin Installation

```bash
# Global installation (recommended)
/plugin install ralph-loop@claude-plugins-official --global

# Per-project installation
/plugin install ralph-loop@claude-plugins-official
```

---

## Resources

- Original technique: https://ghuntley.com/ralph/
- Official plugin: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-loop
- Ralph Orchestrator (advanced): https://github.com/mikeyobrien/ralph-orchestrator
