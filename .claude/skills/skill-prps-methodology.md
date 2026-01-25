# Skill: PRPs Methodology

## Purpose

Apply the PRPs (Product Requirement Prompts) methodology for context-first AI-assisted development. Use this skill when investigating issues, debugging problems, or executing fixes.

PRPs was created by Rasmus Widing and is documented at:
- GitHub: https://github.com/Wirasm/PRPs-agentic-eng
- Website: https://rasmuswiding.com

## Standards Awareness

Before applying this skill, ensure familiarity with:
- `standards/global/code-style.md`
- `standards/global/testing-principles.md`
- Project-specific CLAUDE.md files

---

## Core Concept

> **PRP = PRD + Curated Codebase Intelligence + Agent/Runbook**

The minimum viable packet an AI needs to ship production-ready code on the first pass.

### The Problem PRPs Solves

> "Over-specifying what to build while under-specifying the context, and how to build it, is why so many AI-driven coding attempts stall at 80%."

Traditional approaches fail because:
- PRDs specify WHAT but not HOW
- AI lacks codebase context
- No systematic investigation process
- Fixes are attempted without root cause analysis

### The PRPs Solution

1. **Codebase Intelligence First**: Always read `ai-docs/` before planning
2. **Systematic Investigation**: Follow structured hypothesis testing
3. **Artifact Persistence**: Save investigations, debug reports, and fix reports
4. **Validation Loops**: Verify each phase before proceeding

---

## Workflow Patterns

### Pattern 1: Issue Investigation

Use `/prp-investigate` to analyze GitHub issues.

**Process**:
1. **Fetch Issue Context**
   - Read issue title, description, comments
   - Note reproduction steps
   - Identify error messages

2. **Map to Codebase**
   - Search for related files
   - Trace error paths
   - Identify affected components

3. **Form Hypotheses**
   - List possible root causes
   - Rank by likelihood
   - Note evidence needed

4. **Test Hypotheses**
   - Read relevant code
   - Check git history
   - Trace execution paths

5. **Document Findings**
   - Save to `docs/prps/issues/`
   - Use `prp-templates/issue-investigation.template.md`

### Pattern 2: Debugging

Use `/prp-debug` for structured root cause analysis.

**Process**:
1. **Document Symptoms**
   - What is observed?
   - What is expected?
   - Error messages/stack traces

2. **Form Hypothesis Tree**
   ```
   Bug: X is not working
   ├── Hypothesis 1: Input validation issue
   │   └── Test: Check input at L123
   ├── Hypothesis 2: State corruption
   │   └── Test: Log state before/after
   └── Hypothesis 3: External dependency
       └── Test: Mock and isolate
   ```

3. **Test Each Hypothesis**
   - One hypothesis per iteration
   - Document action and result
   - Mark as confirmed/rejected

4. **Isolate Root Cause**
   - Trace to specific file:line
   - Understand WHY it fails
   - Document contributing factors

5. **Document Findings**
   - Save to `docs/prps/reports/debug/`
   - Use `prp-templates/debug-report.template.md`

### Pattern 3: Fix Execution

Use `/prp-fix` to implement fixes based on investigation.

**Process**:
1. **Load Context**
   - Read investigation report
   - Read debug report if exists
   - Read `ai-docs/` for patterns

2. **Plan Fix**
   - Identify files to modify
   - Consider side effects
   - Plan verification steps

3. **Route Appropriately**
   - Simple fix: Implement directly
   - Complex fix: Delegate to `/spec-and-plan`
   - Iterative fix: Use Ralph Wiggum workflow (`/ralph-plan` + external script)

4. **Implement**
   - Follow codebase conventions
   - Add test coverage
   - Document changes

5. **Verify**
   - Run tests
   - Check for regressions
   - Manual verification

6. **Document**
   - Save to `docs/prps/issues/completed/`
   - Use `prp-templates/fix-report.template.md`

---

## Codebase Intelligence

### The `ai-docs/` Pattern

Before any investigation, check for `ai-docs/` folder containing:
- `architecture-overview.md` - System design
- `api-contracts.md` - API documentation
- `domain-context.md` - Business logic
- `patterns-and-conventions.md` - Code patterns
- `common-pitfalls.md` - Known gotchas

### What to Load When

| Task | Load These |
|------|------------|
| Issue investigation | architecture, domain, pitfalls |
| Debugging | patterns, pitfalls |
| Fix implementation | architecture, patterns, conventions |

### Maintaining ai-docs

After fixing issues, consider updating:
- `common-pitfalls.md` if this is a recurring pattern
- `patterns-and-conventions.md` if conventions were unclear

---

## Artifact Locations

| Artifact Type | Location |
|---------------|----------|
| Investigation reports | `docs/prps/issues/` |
| Completed investigations | `docs/prps/issues/completed/` |
| Debug reports | `docs/prps/reports/debug/` |
| Review reports | `docs/prps/reviews/` |

---

## Integration with LEGO OS

### Agent Delegation

PRPs workflows delegate to existing LEGO OS agents:

| Phase | Agents |
|-------|--------|
| Investigation | `@prp-analyst` |
| Architecture questions | `@senior-architect` |
| Backend fixes | `@backend-engineer` |
| Security concerns | `@security-auditor` |
| Frontend fixes | `@ux-product-strategist` |
| Contract fixes | `@solidity-protocol-engineer` |

### Command Integration

| PRPs Command | Delegates To |
|--------------|--------------|
| `/prp-investigate` | Analysis only (no `/spec-and-plan`) |
| `/prp-debug` | Analysis only (no `/spec-and-plan`) |
| `/prp-fix` (simple) | Direct implementation |
| `/prp-fix` (complex) | `/spec-and-plan` + `/implement-feature` |
| `/prp-fix` (iterative) | `/ralph-plan` + `./scripts/ralph/ralph.ps1` |

### Verification Integration

After fixes, use existing LEGO OS verification:
- `/pragmatic-code-review` for code quality
- `/security-review` for security-sensitive changes
- `/design-review` for UI changes
- `/verify-implementation` for feature completeness

---

## Hypothesis Testing Framework

### Forming Good Hypotheses

**Good hypothesis**:
- Specific and testable
- Based on evidence
- Falsifiable

**Example**:
```
Hypothesis: The API returns 500 because the database connection
times out when processing requests with > 100 items.

Test: Query with 50 items vs 150 items, measure response times.
Expected: 50 items succeeds, 150 items times out.
```

**Bad hypothesis**:
- "Something is wrong with the code"
- Too vague to test
- Not falsifiable

### Testing Process

1. **State the hypothesis clearly**
2. **Define the test**
3. **Predict the outcome if true**
4. **Execute the test**
5. **Record actual result**
6. **Verdict**: Confirmed / Rejected / Needs more data

### When Stuck

After 5 attempts on the same hypothesis:
1. Document what was tried
2. List what evidence was gathered
3. Consider alternative hypotheses
4. Escalate if needed

---

## Quality Checklist

### Investigation Quality
- [ ] Issue fully understood
- [ ] Codebase locations mapped
- [ ] Multiple hypotheses considered
- [ ] Root cause confirmed (not assumed)
- [ ] Fix approach recommended

### Debug Quality
- [ ] Symptoms documented
- [ ] Reproduction steps verified
- [ ] Hypotheses systematically tested
- [ ] Root cause isolated to file:line
- [ ] Fix rationale explained

### Fix Quality
- [ ] Root cause addressed (not symptoms)
- [ ] Tests added for the fix
- [ ] No regressions introduced
- [ ] Documentation updated
- [ ] Report completed

---

## Anti-Patterns

- **Symptom fixing**: Addressing symptoms without finding root cause
- **Hypothesis stacking**: Testing multiple hypotheses at once
- **Skipping investigation**: Jumping to fix without understanding
- **Incomplete reports**: Not documenting findings
- **Context amnesia**: Not reading ai-docs or previous reports

---

## Attribution

This skill is based on Rasmus Widing's PRPs framework:
- GitHub: https://github.com/Wirasm/PRPs-agentic-eng
- Core insight: Context engineering is as important as prompt engineering
