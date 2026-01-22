# ralph-loop

You are running the `ralph-loop` workflow in LEGO Agent OS.

Goal:
- Design and configure an optimal Ralph Wiggum iterative development loop
- Ensure the task has clear, verifiable completion criteria
- Provide cost estimates and subscription impact warnings
- Output a ready-to-run command

## Required Context

Load these before proceeding:
- `.claude/skills/skill-ralph-wiggum.md`

## Process

### 1. Gather Requirements

Ask the user:

**What task do you want to run autonomously?**

Then clarify:
- What's the scope? (feature, refactor, tests, migration, etc.)
- What verification exists? (tests, linter, Playwright, type checker)
- Any constraints? (max iterations, time budget, cost limit)

### 2. Determine Verification Method

Based on task type, identify the verification approach:

| Task | Verification |
|------|--------------|
| Feature building | `npm test` or `pytest` |
| Frontend with UI | `npx playwright test` |
| Refactoring | Existing test suite |
| Type fixes | `npm run typecheck` |
| Linting cleanup | `npm run lint` |
| E2E flows | Playwright tests |
| Browser automation | Playwright MCP |

If no verification exists, warn the user:
> "Ralph loops work best with automatic verification. Without tests or linters, the loop can't know when it's done. Consider adding tests first, or this may not be suitable for Ralph."

### 3. Delegate to Architect

Use the `@ralph-loop-architect` agent to design the prompt:

```
@ralph-loop-architect

Task: [User's task description]
Verification method: [Identified method]
Constraints: [Any user constraints]

Please design an optimal Ralph loop prompt with:
- Clear success criteria
- Phased execution
- Self-correction protocol
- Escape hatches
- Cost estimate
```

### 4. Review and Validate

Before presenting to user, verify:
- [ ] All success criteria are verifiable
- [ ] Verification command is correct for this project
- [ ] Phases are appropriately sized
- [ ] Cost estimate is reasonable
- [ ] Max iterations recommendation is conservative

### 5. Present Output

Provide the user with:

```markdown
# Ralph Loop Ready: [Task Name]

## Your Prompt

[Full prompt from architect]

## Run Command

\`\`\`bash
/ralph-loop "[prompt summary]" --max-iterations [N] --completion-promise "COMPLETE"
\`\`\`

## Cost Estimate

| Metric | Estimate |
|--------|----------|
| Iterations | [N-M] |
| Tokens | ~[X,000] |
| Cost | $[Y-Z] |
| Pro Max 5x impact | [X]% of 5-hour limit |

## Pre-Flight Checklist

Before running:
- [ ] Tests currently pass (`[verification command]`)
- [ ] Git working directory is clean
- [ ] You can walk away and let it run
- [ ] Cost is acceptable

## To Run

1. Copy the prompt above to a file (optional but recommended for long prompts)
2. Run the command
3. Monitor progress or walk away
4. Check results when complete or max iterations reached
```

## Suitability Check

If the task is NOT suitable for Ralph, explain why:

**Not suitable for Ralph:**
- No automatic verification available
- Success criteria are subjective ("make it look better")
- Task requires human judgment mid-process
- One-shot operation (no iteration needed)
- Production debugging (too risky for autonomous loops)

**Suggest alternatives:**
- Add tests first, then use Ralph
- Break into smaller tasks with clear verification
- Use manual iteration with human review

## Quick Examples

### Feature with Tests
```bash
/ralph-loop "Implement user authentication with JWT. Tests in auth.test.ts. Output <promise>COMPLETE</promise> when all tests pass." --max-iterations 30 --completion-promise "COMPLETE"
```

### Playwright E2E
```bash
/ralph-loop "Build login form. E2E tests in login.spec.ts. Run npx playwright test after each change. Output <promise>COMPLETE</promise> when all pass." --max-iterations 40 --completion-promise "COMPLETE"
```

### Refactoring
```bash
/ralph-loop "Migrate all class components to hooks. Run npm test after each migration. Output <promise>COMPLETE</promise> when all migrated and tests green." --max-iterations 50 --completion-promise "COMPLETE"
```

### Type Fixes
```bash
/ralph-loop "Fix all TypeScript errors. Run npm run typecheck after each fix. Output <promise>COMPLETE</promise> when zero errors." --max-iterations 25 --completion-promise "COMPLETE"
```

## Plugin Requirement

This command requires the Ralph Loop plugin. If not installed:

```bash
# Global installation (recommended)
/plugin install ralph-loop@claude-plugins-official --global

# Per-project
/plugin install ralph-loop@claude-plugins-official
```

## LEGO OS Integration

The ralph-loop workflow automatically integrates with the LEGO OS ecosystem to ensure your autonomous loops follow project standards and leverage specialist agents.

### Auto-Detection

Based on your task description, the `@ralph-loop-architect` agent will automatically:

| Task Keywords | What Gets Loaded |
|---------------|------------------|
| API, endpoint, backend, REST | Backend standards, security skills, @security-auditor delegation |
| React, component, frontend, UI | Frontend standards, design system skills, @ux-product-strategist delegation |
| Solidity, contract, token, DeFi | Security standards, smart contract skills, @solidity-protocol-engineer delegation |
| Test, coverage, spec | Testing principles, test standards, @pragmatic-code-reviewer delegation |
| Copy, content, marketing | SignalOS standards, copywriting skills, @copywriter delegation |
| Docs, readme, documentation | Docs standards, docs style skills, @docs-writer delegation |

### Integration Levels

Choose how deeply to integrate with LEGO OS:

**Light** (default for simple tasks)
- Load relevant standards at each iteration
- Apply appropriate skills

**Medium** (recommended for most tasks)
- Light +
- Agent delegation for specialist review phases
- Example: Security review by @security-auditor before completion

**Full** (for critical or complex tasks)
- Medium +
- Command verification gates between phases
- Example: Must pass `/security-review` before proceeding

### Integrated Prompt Structure

When LEGO OS integration is active, prompts include:

```markdown
## Standards (load at start of each iteration)
- standards/global/code-style.md
- [Auto-detected standards based on task type]

## Skills to Apply
- [Auto-detected skills based on task type]

## Phases
### Phase N: [Implementation]
...

### Phase N+1: [Review Gate]
Delegate to @[agent-name]:
- [Specific review task]
- [Expected deliverable]

Run `/[verification-command]` - must pass before continuing.
```

### Verification Gates

Common verification gates by task type:

| Task Type | Verification Command |
|-----------|---------------------|
| Backend/API | `/security-review` |
| Frontend/UI | `/design-review`, `/ux-review` |
| Smart Contract | `/smart-contract-review` |
| Testing | `/pragmatic-code-review` |
| Content/Copy | `/ux-copy-review` |
| Documentation | `/write-docs` |

### Example: Full Integration

```bash
/ralph-loop "Build user settings API with full LEGO OS integration"
```

Generated prompt includes:
- Backend and security standards loaded each iteration
- `skill-backend-api-standards` and `skill-secure-coding-standards` applied
- Phase for @backend-engineer to implement
- Phase for @security-auditor to review
- `/security-review` gate before completion
- `/pragmatic-code-review` final quality check

## Output

After the workflow completes, provide:
- Summary of the designed prompt
- Ready-to-run command
- Cost estimate
- Any warnings or recommendations
