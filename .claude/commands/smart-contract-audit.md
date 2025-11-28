# smart-contract-audit

You are running the **smart-contract-audit** workflow in LEGO Agent OS.

Goal:
Perform a focused security and correctness review of one or more smart contracts, and produce clear, actionable findings.

Recommended agents:
- @solidity-protocol-engineer
- @security-auditor

Recommended skills:
- Smart Contract Audit Checklist

---

## Steps

1. **Clarify scope**
   - Ask the user which contracts or folder to audit.
   - Confirm whether this is:
     - a full audit of a module, or
     - a review of recent changes.

2. **Explore code**
   - Read the specified contracts and their tests.
   - Identify:
     - core responsibilities
     - key invariants
     - external dependencies
     - trust boundaries (who can call what).

3. **Threat modeling (@security-auditor)**
   - List potential attackers and goals (e.g., steal funds, block usage, corrupt data).
   - Map out main attack surfaces (functions, modifiers, external calls).

4. **Checklist review**
   - Use the **Smart Contract Audit Checklist** skill to systematically review:
     - access control
     - reentrancy
     - input validation
     - arithmetic assumptions
     - event coverage
     - upgrade patterns (if any).

5. **Findings**
   - For each issue, provide:
     - **Title**
     - **Severity** (High / Medium / Low / Informational)
     - **Description** (what’s wrong)
     - **Impact** (what could go wrong)
     - **Likelihood** (how easily exploitable)
     - **Recommendation** (specific fix or mitigation)
     - **Suggested tests** (what to add or update)

6. **Summary & next steps**
   - Summarize overall risk level.
   - Highlight the top 3 issues to fix first.
   - List any architectural concerns or TODOs for a deeper audit.

---

## Output

Produce:

1. A short **executive summary** (3–7 sentences).
2. A **table or bullet list of findings**, grouped by severity.
3. A **checklist of recommended follow-up actions**, including tests.

Be concrete and practical; avoid vague “be careful with X” statements.
