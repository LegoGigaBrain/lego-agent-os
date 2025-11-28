# security-review

You are running the **security-review** workflow in LEGO Agent OS.

Goal:
Perform a focused security review of a change set (backend, frontend, infra, or contracts) and identify potential vulnerabilities and abuse cases.

Recommended agents:
- @security-auditor (primary)
- @backend-engineer / @solidity-protocol-engineer as needed
- @senior-architect for systemic risks

Recommended skills:
- Smart Contract Audit Checklist (if contracts)
- Backend Design Checklist
- UX Review Checklist (for auth-related UX)

---

## Steps

1. **Clarify scope**
   - Ask the user:
     - which files/modules/PR to review
     - what type of system this is (API, job worker, UI, smart contract, etc.)
     - any known threats or high-value assets (funds, PII, tokens).

2. **Identify assets & trust boundaries**
   - Determine:
     - sensitive data and operations (money, identities, secrets)
     - external interfaces (APIs, webhooks, blockchain calls)
     - who is trusted and who is not.

3. **Explore code**
   - Read the specified files and related helpers.
   - Summarize:
     - what the code is supposed to do
     - which roles can invoke it
     - where user-controlled input flows in.

4. **Threat modeling (@security-auditor)**
   - Consider attackers such as:
     - unauthenticated users
     - authenticated but malicious users
     - compromised clients (XSS/CSRF/session theft)
     - compromised dependencies or external services.
   - For each, think:
     - how can they steal, corrupt, or block?

5. **Checklist-based review**
   - For backend:
     - auth & authorization
     - input validation and sanitization
     - SQL/NoSQL injection
     - SSRF / insecure HTTP use
     - rate limiting / brute forcing
     - logging of secrets / PII
   - For frontend:
     - XSS via untrusted HTML
     - CSRF for state-changing requests
     - clickjacking protections
   - For smart contracts:
     - use **Smart Contract Audit Checklist** skill.

6. **Findings**
   - For each issue, provide:
     - **Title**
     - **Severity**: Critical / High / Medium / Low
     - **Category**: (e.g., Auth, Injection, Logic bug, Info leak)
     - **Description**: what’s wrong
     - **Impact**: what an attacker could do
     - **Recommendation**: concrete mitigation
     - **Suggested tests / monitoring**.

7. **Defense-in-depth suggestions**
   - Identify:
     - additional layers that would help (rate limiting, feature flags, canary releases, feature-specific logging).
   - Note any particularly risky assumptions.

---

## Output

1. **Executive summary**
   - Overall risk level (e.g., “Medium with 1 high-priority issue”).
   - Top 3 risks, in plain language.

2. **Detailed findings**
   - Grouped by severity.

3. **Action plan**
   - Ordered list of recommended fixes and next steps.
   - Any follow-up reviews or pen-testing you’d suggest.

Avoid generic advice—tie each recommendation to concrete code or behaviour.
