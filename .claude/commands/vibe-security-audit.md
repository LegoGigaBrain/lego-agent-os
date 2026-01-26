# vibe-security-audit

Goal:
Perform a focused security audit for AI-generated code and BaaS (Supabase, Firebase, etc.) applications, checking for the 10 critical vibe-coding vulnerabilities.

Agents:
- @security-auditor (primary)
- @backend-engineer (architecture review)

Skills:
- Vibe-Coding Security
- Secure Coding Standards
- Backend API Standards

---

## When to Use

Use this command when auditing:
- Apps built with Supabase, Firebase, or similar BaaS
- AI-generated codebases
- Apps with direct frontend-to-database patterns
- Payment/subscription integrations
- File upload features

---

## Steps

### 1. Scope Discovery

Ask the user:
- What BaaS platform is used? (Supabase, Firebase, etc.)
- Are there payment integrations? (Stripe, LemonSqueezy, etc.)
- Is there file upload functionality?
- Is this a web app, mobile app, or both?
- What are the most sensitive data types? (PII, payments, etc.)

### 2. Architecture Scan

Identify:
- Frontend framework and file locations
- Server-side code locations (API routes, server actions, edge functions)
- Database schema and RLS policies
- Storage bucket configuration
- Webhook endpoints

### 3. The 10-Point Vulnerability Check

For each vulnerability, classify as: **PASS**, **FAIL**, or **NEEDS REVIEW**

#### V1: Direct-to-DB Access
- Search for `supabase.from(`, `firebase.firestore(` in frontend code
- Verify all mutations go through server-side functions
- **FAIL if**: Any direct DB access from client code

#### V2: RLS Configuration
- Review all RLS policies
- Check for overly permissive UPDATE/INSERT policies
- Verify Zero-Policy Rule (no public policies) or properly restricted policies
- **FAIL if**: Sensitive columns updateable via client

#### V3: Column Protection
- Identify sensitive columns (role, permissions, subscription_status, is_admin)
- Verify server-side whitelist for allowed update fields
- **FAIL if**: No server-side column filtering

#### V4: Rate Limiting
- Check auth endpoints for rate limits
- Check mutation endpoints for rate limits
- Check webhook endpoints for rate limits
- **FAIL if**: No rate limiting on sensitive endpoints

#### V5: Storage Security
- Check bucket configurations (public vs private)
- Check filename patterns (UUID vs predictable)
- Check for signed URL usage
- **FAIL if**: Public bucket with user data OR predictable filenames

#### V6: Webhook Verification
- Find all webhook handlers
- Verify signature verification (stripe.webhooks.constructEvent, etc.)
- Check for idempotency handling
- **FAIL if**: Any webhook trusts payload without verification

#### V7: RPC Function Lockdown
- Find all custom Postgres functions
- Verify REVOKE EXECUTE FROM public statements
- **FAIL if**: Any function callable by public/anon

#### V8: Environment Hygiene
- Check .gitignore for .env files
- Search for hardcoded secrets
- Check for env validation
- **FAIL if**: Secrets in code OR .env not in .gitignore

#### V9: Anon Key Exposure
- Review anon key usage
- Check what operations are possible with anon key
- **FAIL if**: Sensitive operations possible with anon key

#### V10: Mobile Safety (if applicable)
- Check for business logic in mobile client
- Verify pricing/payment logic is server-side
- **FAIL if**: Business logic in mobile client code

### 4. Generate Findings Report

For each FAIL, document:
- **Severity**: Critical / High / Medium / Low
- **Location**: File path and line numbers
- **Description**: What the vulnerability is
- **Impact**: What an attacker could do
- **Exploit Scenario**: How it could be exploited
- **Fix**: Specific code changes required

### 5. Prioritized Fix List

Order fixes by:
1. Critical severity (data breach, privilege escalation)
2. High severity (payment bypass, account takeover)
3. Medium severity (DoS, data enumeration)
4. Low severity (information disclosure, best practices)

---

## Output Format

```markdown
# Vibe-Security Audit Report

## Summary
- **App**: [name]
- **BaaS**: [Supabase/Firebase/etc.]
- **Audit Date**: [date]
- **Overall Risk**: [Critical/High/Medium/Low]

## 10-Point Check Results

| # | Vulnerability | Status | Severity |
|---|--------------|--------|----------|
| 1 | Direct-to-DB Access | PASS/FAIL | - |
| 2 | RLS Configuration | PASS/FAIL | - |
| 3 | Column Protection | PASS/FAIL | - |
| 4 | Rate Limiting | PASS/FAIL | - |
| 5 | Storage Security | PASS/FAIL | - |
| 6 | Webhook Verification | PASS/FAIL | - |
| 7 | RPC Function Lockdown | PASS/FAIL | - |
| 8 | Environment Hygiene | PASS/FAIL | - |
| 9 | Anon Key Exposure | PASS/FAIL | - |
| 10 | Mobile Safety | PASS/FAIL/N/A | - |

## Critical Findings

### [Finding Title]
- **Severity**: Critical
- **Location**: `path/to/file.ts:123`
- **Description**: ...
- **Impact**: ...
- **Fix**: ...

## High Findings
...

## Medium Findings
...

## Low Findings
...

## Prioritized Fix List

1. [ ] [Critical] Fix [issue] in [file]
2. [ ] [High] Fix [issue] in [file]
...

## Recommendations

- [Architecture recommendations]
- [Process recommendations]

## Next Steps

- [ ] Fix critical issues immediately
- [ ] Schedule high issues for next sprint
- [ ] Run `/security-review` after fixes
```

---

## Related Commands

- `/security-review` - General security review (broader scope)
- `/smart-contract-audit` - For web3 integrations
- `/code-review` - General code quality review
