# workflow-bug-fix

Systematic bug resolution using PRPs methodology.

---

## Overview

This workflow provides a structured approach to investigating, debugging, and fixing bugs using the PRPs (Problem Resolution Protocols) methodology.

## When to Use

- Bug reports from users or QA
- Failing tests
- Production incidents
- Unexpected behavior
- Performance issues

## Agents Involved

| Role | Agent | Responsibility |
|------|-------|----------------|
| **Investigation** | `@prp-analyst` | Root cause analysis, evidence gathering |
| **Implementation** | `@backend-engineer` | Fix implementation |
| **Review** | `@pragmatic-code-reviewer` | Fix quality, no regressions |
| **Verification** | `@pragmatic-code-reviewer` | Fix works, tests pass |

## Workflow Steps

### Step 1: Investigation
**Command:** `/prp-investigate`

Investigate the bug systematically:
- Reproduce the issue
- Gather evidence
- Form hypotheses
- Identify root cause

**Agents:**
- `@prp-analyst`

**Output:**
```
docs/prp/[issue-id]/
  investigation-report.md
```

Contains:
- Issue description
- Reproduction steps
- Evidence collected
- Hypotheses ranked
- Root cause identified

### Step 2: Debug
**Command:** `/prp-debug`

Deep debugging to confirm root cause:
- Test hypotheses
- Trace code paths
- Analyze state
- Confirm fix approach

**Agents:**
- `@prp-analyst`

**Output:**
```
docs/prp/[issue-id]/
  debug-report.md
```

Contains:
- Debugging steps taken
- Hypothesis validation
- Root cause confirmation
- Proposed fix approach

### Step 3: Fix
**Command:** `/prp-fix`

Implement the fix:
- Apply minimal fix
- Add regression test
- Document the change

**Agents:**
- `@backend-engineer` (or appropriate implementation agent)
- `@prp-analyst` for guidance

**Output:**
- Fix implementation
- Regression test
- Updated investigation doc

### Step 4: Review
**Command:** `/pragmatic-code-review`

Review the fix:
- Fix addresses root cause
- No regressions introduced
- Test coverage adequate

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
- Review report
- Fix approval or requests

### Step 5: Verification
**Command:** `/verify-implementation`

Verify the fix works:
- Original issue resolved
- Regression tests pass
- No new issues introduced

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
- Verification report
- Bug closure confirmation

---

## Quick Start

```
/workflow-bug-fix "users can't log in after password reset"
```

This will:
1. Investigate using /prp-investigate
2. Debug using /prp-debug
3. Fix using /prp-fix
4. Review using /pragmatic-code-review
5. Verify using /verify-implementation

---

## Success Criteria

- [ ] Root cause identified and documented
- [ ] Fix addresses root cause (not symptoms)
- [ ] Regression test added
- [ ] Code review passes
- [ ] Original issue is resolved
- [ ] No new issues introduced

---

## Escalation

If blocked during any step:
- After 5 investigation attempts: Escalate to `@senior-architect`
- Security implications: Escalate to `@security-auditor`
- Architecture-level bug: Escalate to `@senior-architect`

See `.claude/escalation-matrix.md` for full escalation protocol.

---

## PRPs Methodology Overview

### Investigation Phase
1. **Reproduce**: Can we reliably trigger the issue?
2. **Isolate**: What's the smallest reproduction case?
3. **Hypothesize**: What could cause this?
4. **Evidence**: What data supports each hypothesis?
5. **Root Cause**: What's the underlying cause?

### Debug Phase
1. **Trace**: Follow the code path
2. **Inspect**: Examine state at key points
3. **Test**: Validate hypotheses with tests
4. **Confirm**: Verify root cause

### Fix Phase
1. **Minimal**: Smallest change that fixes the issue
2. **Test**: Add regression test before fixing
3. **Fix**: Implement the fix
4. **Verify**: Confirm test now passes

---

## Ralph Wiggum Integration

For autonomous execution of this workflow:

1. **Generate PRD**: Run `/ralph-plan` with the bug description to create PRD.md and progress.txt
2. **Run Script**: Execute in terminal:
   ```powershell
   ./scripts/ralph/ralph.ps1 -MaxIterations 30
   ```
3. **Review**: When complete, run `/pragmatic-code-review`

The canonical Ralph workflow spawns fresh context per iteration, preventing context rot.

---

## Dependencies

| This Command | Requires | Followed By |
|--------------|----------|-------------|
| `/prp-investigate` | Bug report | `/prp-debug` |
| `/prp-debug` | Investigation | `/prp-fix` |
| `/prp-fix` | Debug complete | `/pragmatic-code-review` |
| `/pragmatic-code-review` | Fix code | `/verify-implementation` |
| `/verify-implementation` | Review pass | Nothing (terminal) |

---

## Example Session

```
User: /workflow-bug-fix "payments failing with timeout error"

Step 1: Running /prp-investigate...
- Reproduced: Payments to Stripe timing out after 30s
- Hypothesis 1: Stripe API latency (LOW - other services fine)
- Hypothesis 2: Connection pool exhaustion (HIGH - logs show waiting)
- Root cause: Connection pool limit too low for traffic volume

Step 2: Running /prp-debug...
- Confirmed: Pool size = 5, concurrent requests = 20
- Traced: Requests queuing for 25+ seconds
- Fix approach: Increase pool size, add timeout handling

Step 3: Running /prp-fix...
- Added regression test for pool exhaustion
- Increased pool size to 50
- Added request timeout of 10s with retry

Step 4: Running /pragmatic-code-review...
- PASS: Fix addresses root cause
- PASS: Test coverage adequate

Step 5: Running /verify-implementation...
- Original issue resolved
- Regression test passing
- BUG_FIXED
```
