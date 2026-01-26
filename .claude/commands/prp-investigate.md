# prp-investigate

You are running the **PRPs Issue Investigation** workflow in LEGO Agent OS.

This workflow applies Rasmus Widing's PRPs (Product Requirement Prompts) methodology for systematic issue analysis.

Goal:
- Analyze a GitHub issue systematically
- Map the issue to codebase locations
- Form and test hypotheses about root cause
- Produce an investigation report with fix recommendations

---

## Required Context

Load these before proceeding:

- `.claude/skills/skill-prps-methodology.md`
- `ai-docs/` folder (if exists) for codebase intelligence

## Primary Agent

- @prp-analyst

Supporting Agents:
- @senior-architect (for architectural questions)
- @backend-engineer (for backend-specific investigations)
- @security-auditor (if security issues discovered)

---

## STEP 1 - Get Issue Context

Ask the user:

- **What issue are you investigating?**
  - GitHub issue URL or number
  - Or describe the problem if not a GitHub issue

If a GitHub issue URL/number is provided:
```bash
gh issue view [NUMBER] --json title,body,comments,labels,author,createdAt
```

Summarize:
- Issue title and description
- Reporter and date
- Key symptoms mentioned
- Any reproduction steps provided

---

## STEP 2 - Load Codebase Intelligence

Check for `ai-docs/` folder:

```bash
ls ai-docs/
```

If exists, read relevant files:
- `ai-docs/architecture-overview.md` (system context)
- `ai-docs/common-pitfalls.md` (known issues)
- `ai-docs/domain-context.md` (business logic)

This context helps you understand where to look.

---

## STEP 3 - Map to Codebase

Based on the issue description:

1. **Search for relevant files**
   - Search for error messages mentioned
   - Search for feature/component names
   - Search for API endpoints if mentioned

2. **Trace the code path**
   - Identify entry points
   - Map the flow
   - Note affected components

3. **Check git history**
   - Recent changes to affected files
   - Related commits

Document findings:
```
## Affected Code Locations

| File | Lines | Purpose |
|------|-------|---------|
| `path/to/file.ts` | L123-L145 | [What this code does] |
```

---

## STEP 4 - Form Hypotheses

Based on your analysis, form 2-3 hypotheses:

```
### Hypothesis 1: [Short description]

**Rationale**: [Why this might be the cause]

**Evidence needed**: [What would confirm this]

**Likelihood**: High/Medium/Low
```

Rank hypotheses by likelihood. Start with the most likely.

---

## STEP 5 - Test Hypotheses

For each hypothesis (one at a time):

1. **State what you're testing**
2. **Perform the test**
   - Read relevant code
   - Check git blame/history
   - Trace execution path
3. **Document the result**
4. **Verdict**: Confirmed / Rejected / Needs More Data

```
### Testing Hypothesis 1

**Action**: Read file.ts:L123-L150 to check [specific thing]

**Result**: [What was found]

**Verdict**: Confirmed / Rejected
```

If a hypothesis is confirmed, proceed to STEP 6.
If all are rejected, form new hypotheses or ask for clarification.

---

## STEP 6 - Document Root Cause

Once root cause is confirmed:

```
## Confirmed Root Cause

**Location**: `file.ts:L123`

**Explanation**: [Why this causes the issue]

**Evidence**:
- [Evidence 1]
- [Evidence 2]

**Contributing Factors**:
- [Factor 1]
- [Factor 2]
```

---

## STEP 7 - Recommend Fix

Propose a fix approach:

```
## Recommended Fix

### Approach
[Describe the fix strategy]

### Files to Modify
| File | Change Type | Description |
|------|-------------|-------------|
| `path/to/file.ts` | Modify | [What to change] |
| `path/to/test.ts` | Add | [New test] |

### Verification Steps
- [ ] [How to verify the fix works]
- [ ] [Test to run]
- [ ] [Edge case to check]

### Risk Assessment
- [Potential risks]
- [Mitigation strategies]
```

---

## STEP 8 - Generate Report

Create the investigation report:

1. Read the template:
   ```
   Read: prp-templates/issue-investigation.template.md
   ```

2. Fill in all sections with your findings

3. Save to:
   ```
   docs/prps/issues/[issue-number].md
   ```
   Or if not a GitHub issue:
   ```
   docs/prps/issues/[descriptive-slug].md
   ```

---

## STEP 9 - Output Summary

Provide a concise summary to the user:

```
## Investigation Complete

**Issue**: [Title]
**Root Cause**: [One sentence]
**Location**: `file.ts:L123`
**Confidence**: High/Medium/Low

**Recommended Fix**: [Brief approach]

**Next Steps**:
- [ ] Run `/prp-debug` if more investigation needed
- [ ] Run `/prp-fix` to implement the fix
- [ ] Or `/spec-and-plan` if this requires larger changes

**Full Report**: docs/prps/issues/[name].md
```

---

## When to Escalate

If investigation reveals:
- **Architectural issues**: Recommend consulting @senior-architect
- **Security vulnerabilities**: Immediately flag and involve @security-auditor
- **Multiple root causes**: Document all, prioritize by impact
- **Unclear reproduction**: Ask user for more details before continuing

---

## Notes

- Always test hypotheses one at a time
- Document even failed hypotheses (prevents revisiting)
- If stuck after testing 3+ hypotheses, ask for help
- Investigation reports become codebase intelligence over time
- Consider updating `ai-docs/common-pitfalls.md` after fix

## Attribution

This workflow is based on Rasmus Widing's PRPs methodology:
https://github.com/Wirasm/PRPs-agentic-eng
