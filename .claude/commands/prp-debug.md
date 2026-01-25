# prp-debug

You are running the **PRPs Debug** workflow in LEGO Agent OS.

This workflow applies Rasmus Widing's PRPs (Product Requirement Prompts) methodology for structured root cause analysis.

Goal:
- Document symptoms and reproduction steps
- Build and test a hypothesis tree
- Isolate root cause to specific file:line
- Produce a debug report with fix recommendations

---

## Required Context

Load these before proceeding:

- `.claude/skills/skill-prps-methodology.md`
- `ai-docs/` folder (if exists) for codebase intelligence
- Previous investigation report (if running after `/prp-investigate`)

## Primary Agent

- @prp-analyst

Supporting Agents:
- @senior-architect (for architectural questions)
- @backend-engineer (for backend debugging)
- @security-auditor (if security issues discovered)

---

## STEP 1 - Document the Problem

Ask the user:

- **What are you debugging?**
  - Error message or symptoms
  - When does it occur?
  - Is there an existing investigation report?

Gather:
```
## Problem Statement

**Observed Behavior**: [What is happening]

**Expected Behavior**: [What should happen]

**Error Output**:
```
[Error messages, stack traces, logs]
```

**Reproduction Steps**:
1. [Step 1]
2. [Step 2]
3. [Observe error]
```

If there's a previous `/prp-investigate` report, read it:
```
Read: docs/prps/issues/[report-name].md
```

---

## STEP 2 - Document Environment

Capture context:

```
## Environment

| Context | Value |
|---------|-------|
| Branch | [Current git branch] |
| Commit | [Current commit hash] |
| Node/Runtime | [Version if relevant] |
| OS | [Operating system] |
```

Run if needed:
```bash
git rev-parse --short HEAD
```

---

## STEP 3 - Build Hypothesis Tree

Based on symptoms, build a tree of possible causes:

```
## Hypothesis Tree

Bug: [Problem description]
├── H1: [First hypothesis]
│   └── Test: [How to verify]
├── H2: [Second hypothesis]
│   └── Test: [How to verify]
├── H3: [Third hypothesis]
│   └── Test: [How to verify]
└── H4: [Fourth hypothesis]
    └── Test: [How to verify]
```

Guidelines:
- Start with most likely causes
- Make each hypothesis specific and testable
- Include what evidence would confirm or reject

---

## STEP 4 - Test Hypotheses Systematically

Test ONE hypothesis at a time. For each:

```
### [TIMESTAMP] Testing Hypothesis: [Description]

**Rationale**: [Why this might be the cause]

**Action**:
```
[Command run or code examined]
```

**Result**:
```
[Output or finding]
```

**Analysis**: [What this tells us]

**Conclusion**: [ ] Confirmed / [ ] Rejected / [ ] Partially confirmed
```

Repeat until root cause is found.

**Important**:
- Do NOT test multiple hypotheses simultaneously
- Document every test, even failures
- If rejected, explain why before moving on

---

## STEP 5 - Isolate Root Cause

Once a hypothesis is confirmed, narrow down:

```
## Root Cause Isolation

### Location
**File**: `path/to/file.ts`
**Line**: L123-L145

### The Problematic Code
```typescript
// Code that causes the issue
[Code snippet]
```

### Why This Fails
[Detailed explanation of the failure mechanism]

### Triggering Conditions
- [Condition 1 that triggers the bug]
- [Condition 2]

### Contributing Factors
1. [Factor that made this bug possible]
2. [Factor that made it hard to detect]
```

---

## STEP 6 - Propose Fix

Based on root cause analysis:

```
## Fix Recommendation

### Immediate Fix
```typescript
// Suggested fix
[Code snippet]
```

### Why This Works
[Explanation of why the fix addresses the root cause]

### Alternative Approaches
| Approach | Pros | Cons |
|----------|------|------|
| [Approach 1] | [Pros] | [Cons] |
| [Approach 2] | [Pros] | [Cons] |

### Tests to Add
```typescript
describe('...', () => {
  it('should handle [the bug scenario]', () => {
    // Test the fix
  });
});
```
```

---

## STEP 7 - Generate Debug Report

Create the debug report:

1. Read the template:
   ```
   Read: prp-templates/debug-report.template.md
   ```

2. Fill in all sections with your findings

3. Save to:
   ```
   docs/prps/reports/debug/[descriptive-slug].md
   ```

---

## STEP 8 - Output Summary

Provide a concise summary:

```
## Debug Complete

**Problem**: [One sentence]
**Root Cause**: [One sentence]
**Location**: `file.ts:L123`

**Why It Fails**:
[Brief explanation]

**Recommended Fix**:
[Brief approach]

**Next Steps**:
- [ ] Run `/prp-fix` to implement the fix
- [ ] Or use Ralph Wiggum workflow for iterative implementation:
      1. /ralph-plan to generate PRD
      2. ./scripts/ralph/ralph.ps1 in terminal
- [ ] Consider updating `ai-docs/common-pitfalls.md`

**Full Report**: docs/prps/reports/debug/[name].md
```

---

## Debugging Techniques

### Code Tracing
```bash
# Search for function calls
grep -r "functionName" --include="*.ts"

# Check git blame for recent changes
git blame path/to/file.ts

# View recent commits to a file
git log -p path/to/file.ts
```

### State Inspection
- Add console.log at key points
- Check variable values at boundaries
- Trace data flow through the system

### Isolation
- Remove/mock external dependencies
- Test with minimal reproduction case
- Binary search through code changes

---

## When Stuck

After 5 iterations on the same hypothesis:

1. **Document what was tried**
   ```
   ## Blocker: [Description]

   Attempts made:
   1. [What was tried]
   2. [What was tried]

   Results:
   - [What was learned]

   Suggestions:
   - [Alternative approaches to try]
   - [Questions to ask]
   ```

2. **Consider alternative hypotheses**
3. **Ask for additional context**
4. **Escalate if needed**

---

## Anti-Patterns

- **Shotgun debugging**: Changing random things hoping to fix it
- **Hypothesis stacking**: Testing multiple theories at once
- **Undocumented tests**: Not recording what was tried
- **Assumption as fact**: Treating guesses as confirmed
- **Scope creep**: Fixing unrelated issues discovered along the way

---

## Notes

- Debugging is hypothesis-driven science
- Document everything, even dead ends
- One hypothesis at a time prevents confusion
- The debug report becomes reference for similar issues
- Consider adding to `ai-docs/` after resolving

## Attribution

This workflow is based on Rasmus Widing's PRPs methodology:
https://github.com/Wirasm/PRPs-agentic-eng
