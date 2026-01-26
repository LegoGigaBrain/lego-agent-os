# PRPs Integration in LEGO Agent OS

This document explains how Rasmus Widing's PRPs (Product Requirement Prompts) methodology is integrated into LEGO Agent OS.

## What is PRPs?

PRPs is a context-first framework for AI-assisted development created by Rasmus Widing.

**Core insight**: "Over-specifying what to build while under-specifying the context, and how to build it, is why so many AI-driven coding attempts stall at 80%."

**Core formula**: `PRP = PRD + Curated Codebase Intelligence + Agent/Runbook`

### Resources
- GitHub: https://github.com/Wirasm/PRPs-agentic-eng
- Website: https://rasmuswiding.com

---

## What LEGO OS Adds from PRPs

LEGO OS already has robust planning and iteration workflows (`/spec-and-plan`, `/ralph-plan` + external script). The PRPs integration adds:

### 1. Issue Investigation Workflow
**Command**: `/prp-investigate`

Systematically analyze GitHub issues or bugs:
- Fetch and understand the issue
- Map symptoms to codebase locations
- Form and test hypotheses
- Identify root cause
- Produce investigation reports

### 2. Structured Debugging
**Command**: `/prp-debug`

Hypothesis-driven root cause analysis:
- Document symptoms and reproduction
- Build a hypothesis tree
- Test hypotheses one at a time
- Isolate root cause to file:line
- Produce debug reports

### 3. Fix Execution Pipeline
**Command**: `/prp-fix`

Implement fixes based on investigation:
- Load investigation/debug reports
- Route to appropriate workflow (direct, `/spec-and-plan`, or `/ralph-loop`)
- Verify the fix
- Document and archive

### 4. Codebase Intelligence Pattern
**Folder**: `ai-docs/`

Curated documentation that gives AI context:
- Architecture overview
- API contracts
- Domain knowledge
- Patterns and conventions
- Common pitfalls

### 5. Artifact Persistence
**Folder**: `docs/prps/`

Workflow outputs saved for reference:
- Investigation reports
- Debug reports
- Fix reports
- Completed archives

---

## Commands Reference

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/prp-investigate` | Analyze issues | GitHub issue or reported bug |
| `/prp-debug` | Root cause analysis | Complex bugs needing deep dive |
| `/prp-fix` | Execute fixes | After investigation/debug |

### /prp-investigate

**Input**: GitHub issue URL/number or problem description

**Output**: Investigation report at `docs/prps/issues/[name].md`

**Process**:
1. Fetch issue details
2. Load codebase intelligence from `ai-docs/`
3. Map issue to code locations
4. Form hypotheses about root cause
5. Test hypotheses systematically
6. Document root cause and recommend fix

### /prp-debug

**Input**: Bug description, error messages, reproduction steps

**Output**: Debug report at `docs/prps/reports/debug/[name].md`

**Process**:
1. Document symptoms and environment
2. Build hypothesis tree
3. Test each hypothesis (one at a time)
4. Isolate root cause to specific file:line
5. Explain why it fails
6. Recommend fix

### /prp-fix

**Input**: Reference to investigation/debug report

**Output**: Fix report at `docs/prps/issues/completed/[name]-fix.md`

**Process**:
1. Load investigation/debug context
2. Assess fix complexity
3. Route appropriately:
   - Simple: Direct implementation
   - Complex: Delegate to `/spec-and-plan`
   - Iterative: Delegate to `/ralph-plan` (then run external script)
4. Implement and verify
5. Move reports to completed

---

## Agent

### @prp-analyst

Investigation and debugging specialist who applies PRPs methodology.

**Responsibilities**:
- Issue investigation
- Root cause analysis
- Fix planning and validation
- Codebase intelligence maintenance

**Skills**:
- `skill-prps-methodology.md`
- `skill-testing-standards.md`

---

## Folder Structure

```
lego-agent-os/
├── ai-docs/                          # Curated codebase intelligence
│   ├── README.md                     # How to maintain ai-docs
│   ├── architecture-overview.md      # System design (you create)
│   ├── domain-context.md             # Business logic (you create)
│   ├── patterns-and-conventions.md   # Code patterns (you create)
│   └── common-pitfalls.md            # Known gotchas (you create)
│
├── docs/prps/                        # PRPs workflow artifacts
│   ├── issues/                       # Investigation reports
│   │   └── completed/                # Resolved investigations
│   ├── reports/
│   │   └── debug/                    # Debug reports
│   └── reviews/                      # Review reports
│
└── prp-templates/                    # Templates for artifacts
    ├── issue-investigation.template.md
    ├── debug-report.template.md
    └── fix-report.template.md
```

---

## Workflow Diagram

```
┌─────────────────┐
│  GitHub Issue   │
│  or Bug Report  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐     ┌─────────────────┐
│ /prp-investigate│────▶│  Investigation  │
│                 │     │     Report      │
└────────┬────────┘     └─────────────────┘
         │
         │ Root cause unclear?
         ▼
┌─────────────────┐     ┌─────────────────┐
│   /prp-debug    │────▶│  Debug Report   │
│                 │     │                 │
└────────┬────────┘     └─────────────────┘
         │
         ▼
┌─────────────────┐
│    /prp-fix     │
└────────┬────────┘
         │
    ┌────┼────┐
    │    │    │
    ▼    ▼    ▼
┌──────┐┌──────────────┐┌─────────────┐
│Direct││/spec-and-plan││/ralph-plan  │
│ Fix  ││    + impl    ││ + script    │
└──┬───┘└──────┬───────┘└─────┬───────┘
   │           │              │
   └───────────┼──────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│           Verification              │
│  - Tests pass                       │
│  - No regressions                   │
│  - Original issue resolved          │
└────────────────┬────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│      Move to completed/             │
│  - Update ai-docs if pattern        │
│  - Close GitHub issue               │
└─────────────────────────────────────┘
```

---

## Integration with Existing LEGO OS Workflows

### With /spec-and-plan

When `/prp-fix` determines a fix is complex:
1. PRPs investigation provides context
2. `/spec-and-plan` creates specification
3. `/implement-feature` executes
4. Return to `/prp-fix` to verify and close

### With Ralph Wiggum Canonical Workflow

When `/prp-fix` determines a fix needs iteration:
1. PRPs investigation defines the problem
2. `/ralph-plan` generates PRD.md and progress.txt
3. Run external script: `./scripts/ralph/ralph.ps1 -MaxIterations 25`
4. Return to `/prp-fix` to document and close

### With Review Commands

After fixing:
- `/security-review` for security-sensitive changes
- `/pragmatic-code-review` for code quality
- `/design-review` for UI changes

---

## The ai-docs Pattern

### Purpose

`ai-docs/` contains curated documentation that gives AI codebase context before it starts investigating or implementing.

### What to Include

| File | Contents |
|------|----------|
| `architecture-overview.md` | System boundaries, components, data flow |
| `domain-context.md` | Business logic, terminology, invariants |
| `patterns-and-conventions.md` | Code patterns, naming, file organization |
| `common-pitfalls.md` | Known gotchas, past bugs, edge cases |
| `api-contracts.md` | API patterns, auth, response formats |

### When to Update

Update `ai-docs/` when:
- Architecture changes
- New patterns are introduced
- A bug reveals a common pitfall
- Onboarding reveals knowledge gaps

### Example: common-pitfalls.md

```markdown
# Common Pitfalls

## API Error Handling

**Symptom**: 500 errors with no useful message

**Root Cause**: Error handler doesn't catch async errors

**Prevention**: Always wrap async routes with error handler

**Reference**: docs/prps/issues/completed/api-error-fix.md

---

## State Race Condition

**Symptom**: Intermittent incorrect state after rapid updates

**Root Cause**: Multiple setState calls before re-render

**Prevention**: Use functional setState or useReducer

**Reference**: docs/prps/issues/completed/state-race-fix.md
```

---

## Getting Started

### 1. Set Up ai-docs

Create initial codebase intelligence:

```bash
# Create architecture overview
touch ai-docs/architecture-overview.md

# Add your system context
```

### 2. Investigate an Issue

```
/prp-investigate

Issue: https://github.com/your/repo/issues/123
```

### 3. Debug if Needed

```
/prp-debug

Problem: [Describe the bug]
Error: [Error message]
```

### 4. Fix the Issue

```
/prp-fix

Issue: #123
```

---

## Best Practices

### Investigation

- Read `ai-docs/` before searching code
- Form 2-3 hypotheses before testing
- Test one hypothesis at a time
- Document all findings, even dead ends

### Debugging

- Document symptoms clearly
- Build a hypothesis tree
- Never test multiple hypotheses at once
- Isolate to specific file:line

### Fixing

- Load investigation context first
- Follow project conventions from `ai-docs/`
- Add test coverage for the bug
- Update `ai-docs/` if pattern emerges

### Maintenance

- Move completed reports to `completed/`
- Update `common-pitfalls.md` after fixes
- Keep `ai-docs/` current with architecture

---

## Attribution

The PRPs methodology integrated here was created by Rasmus Widing:
- GitHub: https://github.com/Wirasm/PRPs-agentic-eng
- Website: https://rasmuswiding.com

Key insight from PRPs: "Context engineering is as important as prompt engineering."
