# prp-fix

You are running the **PRPs Fix Execution** workflow in LEGO Agent OS.

This workflow applies Rasmus Widing's PRPs (Product Requirement Prompts) methodology to implement fixes based on investigation and debug reports.

Goal:
- Load context from investigation/debug reports
- Execute the fix using appropriate LEGO OS workflow
- Verify the fix resolves the issue
- Document the fix and move reports to completed

---

## Required Context

Load these before proceeding:

- `.claude/skills/skill-prps-methodology.md`
- Investigation report from `/prp-investigate`
- Debug report from `/prp-debug` (if exists)
- `ai-docs/` folder for codebase patterns

## Primary Agent

- @prp-analyst (for validation)

Supporting Agents (based on fix type):
- @backend-engineer (backend fixes)
- @senior-architect (architectural changes)
- @security-auditor (security fixes)
- @ux-product-strategist (frontend fixes)
- @solidity-protocol-engineer (smart contract fixes)

---

## STEP 1 - Load Investigation Context

Ask the user:

- **What issue are you fixing?**
  - GitHub issue number
  - Or reference to investigation report

Load the investigation report:
```
Read: docs/prps/issues/[issue-name].md
```

If a debug report exists:
```
Read: docs/prps/reports/debug/[debug-name].md
```

Summarize:
- Root cause
- Location (file:line)
- Recommended fix approach
- Files to modify
- Verification steps

---

## STEP 2 - Load Codebase Intelligence

Check for `ai-docs/`:
```bash
ls ai-docs/
```

Read relevant files:
- `ai-docs/patterns-and-conventions.md` (how to write code here)
- `ai-docs/architecture-overview.md` (system context)

This ensures the fix follows project conventions.

---

## STEP 3 - Assess Fix Complexity

Based on the investigation report, categorize:

### Simple Fix
- Single file change
- Clear, isolated fix
- Low risk of side effects

**Action**: Proceed to STEP 4 (Direct Implementation)

### Medium Fix
- Multiple files
- Needs careful testing
- Some risk of side effects

**Action**: Proceed to STEP 4, but with extra verification

### Complex Fix
- Architectural changes required
- Multiple components affected
- Requires specification

**Action**: Recommend `/spec-and-plan` first
```
This fix requires broader changes. Recommend running:
/spec-and-plan

Then return to /prp-fix after spec is complete.
```

### Iterative Fix
- Needs multiple attempts
- Has automated verification
- Good candidate for autonomous work

**Action**: Recommend Ralph Wiggum workflow
```
This fix is suitable for iterative development. Recommend:

1. Run /ralph-plan to generate PRD.md with fix tasks
2. Execute in terminal: ./scripts/ralph/ralph.ps1 -MaxIterations 25
3. Return here to verify and document

Verification: [test command]
```

---

## STEP 4 - Implement the Fix

For direct implementation:

### 4.1 Plan Changes

```
## Implementation Plan

### Files to Modify
| File | Change | Rationale |
|------|--------|-----------|
| `path/to/file.ts` | [Change] | [Why] |
| `path/to/test.ts` | [Add test] | [Coverage] |

### Order of Operations
1. [First change]
2. [Second change]
3. [Add tests]
4. [Verify]
```

### 4.2 Make Changes

For each file:
1. Read the current code
2. Apply the fix
3. Ensure it follows `ai-docs/patterns-and-conventions.md`

### 4.3 Add Test Coverage

Add tests that:
- Reproduce the original bug (should fail without fix)
- Verify the fix works
- Cover edge cases from investigation

```typescript
describe('[Feature/Component]', () => {
  it('should [expected behavior that was broken]', () => {
    // Arrange
    // Act
    // Assert
  });

  it('should handle [edge case from investigation]', () => {
    // Test edge case
  });
});
```

---

## STEP 5 - Verify the Fix

### 5.1 Run Tests

```bash
# Run relevant tests
npm test -- [test-file]

# Or run all tests
npm test
```

### 5.2 Type Check (if TypeScript)

```bash
npm run typecheck
```

### 5.3 Lint

```bash
npm run lint
```

### 5.4 Manual Verification

Follow the verification steps from the investigation report:
- [ ] Original reproduction steps no longer reproduce
- [ ] Expected behavior now works
- [ ] No new errors introduced

---

## STEP 6 - Check for Regressions

Run broader verification:

```bash
# Full test suite
npm test

# Build check
npm run build
```

If this is a sensitive area, consider running:
- `/security-review` for security-sensitive changes
- `/pragmatic-code-review` for code quality
- `/design-review` for UI changes

---

## STEP 7 - Generate Fix Report

Create the fix report:

1. Read the template:
   ```
   Read: prp-templates/fix-report.template.md
   ```

2. Fill in all sections

3. Save to:
   ```
   docs/prps/issues/[issue-name]-fix.md
   ```

---

## STEP 8 - Move to Completed

Once fix is verified:

1. Move investigation report:
   ```bash
   mv docs/prps/issues/[issue-name].md docs/prps/issues/completed/
   ```

2. Move debug report (if exists):
   ```bash
   mv docs/prps/reports/debug/[debug-name].md docs/prps/issues/completed/
   ```

3. Move fix report:
   ```bash
   mv docs/prps/issues/[issue-name]-fix.md docs/prps/issues/completed/
   ```

---

## STEP 9 - Update Codebase Intelligence

If this issue revealed a common pitfall:

```
Read: ai-docs/common-pitfalls.md
```

Add an entry:
```markdown
### [Pitfall Name]

**Symptom**: [What you see]

**Root Cause**: [What causes it]

**Prevention**: [How to avoid]

**Reference**: docs/prps/issues/completed/[issue-name].md
```

---

## STEP 10 - Output Summary

```
## Fix Complete

**Issue**: [Title/Number]
**Root Cause**: [One sentence]
**Fix**: [One sentence description]

### Changes Made
| File | Change |
|------|--------|
| `path/to/file.ts` | [What changed] |
| `path/to/test.ts` | [Test added] |

### Verification
- [x] Tests pass
- [x] No regressions
- [x] Original issue resolved

### Reports
- Investigation: `docs/prps/issues/completed/[name].md`
- Fix Report: `docs/prps/issues/completed/[name]-fix.md`

### Next Steps
- [ ] Create PR / commit changes
- [ ] Close GitHub issue
- [ ] Update ai-docs if needed
```

---

## Delegation to Other Workflows

### When to use /spec-and-plan

If the fix requires:
- New feature development
- API changes
- Multiple component changes
- Architectural decisions

```
This fix exceeds simple bug-fix scope. Recommend:

/spec-and-plan

Feature: [Fix as feature]
Context: [Link to investigation report]
```

### When to use Ralph Wiggum Workflow

If the fix:
- Has clear automated verification
- May need iteration
- Can run autonomously

```
This fix is suitable for Ralph Wiggum:

1. Run /ralph-plan to generate PRD.md with fix tasks
2. Execute: ./scripts/ralph/ralph.ps1 -MaxIterations 25
3. Return to /prp-fix to verify and document

Verification: npm test -- [test-file]
```

### When to use /implement-feature

If the fix was spec'd via /spec-and-plan:

```
Spec complete. Run:

/implement-feature

Using: docs/specs/[feature]/
```

---

## Notes

- Always load investigation/debug reports first
- Follow project conventions from ai-docs/
- Add test coverage for the bug
- Document everything in fix report
- Move completed reports to completed/
- Update ai-docs if pattern emerges

## Attribution

This workflow is based on Rasmus Widing's PRPs methodology:
https://github.com/Wirasm/PRPs-agentic-eng
