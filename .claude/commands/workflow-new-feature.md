# workflow-new-feature

End-to-end feature development from idea to verified implementation.

---

## Overview

This workflow orchestrates the complete feature development lifecycle, from initial specification through implementation, review, and verification.

## When to Use

- New feature requests
- Significant enhancements to existing features
- Features that span multiple files or modules
- Any work that needs full spec-to-ship coverage

## Agents Involved

| Role | Agent | Responsibility |
|------|-------|----------------|
| **Strategy** | `@product-manager` | Requirements, prioritization, success metrics |
| **Architecture** | `@senior-architect` | Technical design, module boundaries |
| **UX** | `@ux-product-strategist` | User flows, UX states, interaction design |
| **Implementation** | `@backend-engineer` | Backend code, APIs, services |
| **Review** | `@pragmatic-code-reviewer` | Code quality, correctness, maintainability |
| **Verification** | `@pragmatic-code-reviewer` | Implementation matches spec |

## Workflow Steps

### Step 1: Specification
**Command:** `/spec-and-plan`

Create the feature specification:
- Feature spec document
- Tasks breakdown
- Verification checklist

**Agents:**
- `@product-manager` for requirements
- `@senior-architect` for technical approach
- `@ux-product-strategist` for user flows

**Output:**
```
docs/specs/[feature-name]/
  feature-spec.md
  tasks-breakdown.md
  verification-checklist.md
```

### Step 2: Implementation
**Command:** `/implement-feature`

Implement each task from the breakdown:
- Follow the spec exactly
- Write tests alongside code
- Document as you go

**Agents:**
- `@backend-engineer` (or appropriate implementation agent)
- `@senior-architect` for architecture questions

**Output:**
- Implementation code
- Test files
- Updated documentation

### Step 3: Code Review
**Command:** `/pragmatic-code-review`

Review the implementation for:
- Correctness
- Clarity
- Maintainability
- Safety

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
- Review report with findings
- Fix requests (if any)

### Step 4: Verification
**Command:** `/verify-implementation`

Verify implementation against spec:
- All requirements met
- All tests passing
- Verification checklist complete

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
- Verification report
- Sign-off or blockers

---

## Quick Start

```
/workflow-new-feature "user authentication with OAuth"
```

This will:
1. Create spec using /spec-and-plan
2. Implement using /implement-feature (per task)
3. Review using /pragmatic-code-review
4. Verify using /verify-implementation

---

## Success Criteria

- [ ] Feature spec is complete and approved
- [ ] All tasks from breakdown are implemented
- [ ] Code review passes with no blockers
- [ ] Verification checklist is complete
- [ ] All tests are passing
- [ ] Documentation is updated

---

## Escalation

If blocked during any step:
- Architecture issues: Escalate to `@senior-architect`
- Security concerns: Escalate to `@security-auditor`
- UX questions: Escalate to `@ux-product-strategist`

See `.claude/escalation-matrix.md` for full escalation protocol.

---

## Ralph Wiggum Integration

For autonomous execution of this workflow:

1. **Generate PRD**: Run `/ralph-plan` with the feature description to create PRD.md and progress.txt
2. **Run Script**: Execute in terminal:
   ```powershell
   ./scripts/ralph/ralph.ps1 -MaxIterations 50
   ```
3. **Review**: When complete, run `/security-review` and `/pragmatic-code-review`

The canonical Ralph workflow spawns fresh context per iteration, preventing context rot on large features.

---

## Dependencies

| This Command | Requires | Followed By |
|--------------|----------|-------------|
| `/spec-and-plan` | Nothing | `/implement-feature` |
| `/implement-feature` | Spec | `/pragmatic-code-review` |
| `/pragmatic-code-review` | Code | `/verify-implementation` |
| `/verify-implementation` | Review pass | Nothing (terminal) |

---

## Example Session

```
User: /workflow-new-feature "add user profile editing"

Step 1: Running /spec-and-plan...
- Created docs/specs/user-profile-editing/feature-spec.md
- Created docs/specs/user-profile-editing/tasks-breakdown.md
- Created docs/specs/user-profile-editing/verification-checklist.md

Step 2: Running /implement-feature for task 1/5...
[... implementation output ...]

Step 3: Running /pragmatic-code-review...
- 2 findings (1 medium, 1 low)
- Fixing medium finding...
- Re-running review... PASS

Step 4: Running /verify-implementation...
- Checklist: 12/12 items verified
- All tests passing
- FEATURE_COMPLETE
```
