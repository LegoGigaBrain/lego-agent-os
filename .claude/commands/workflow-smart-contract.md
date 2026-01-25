# workflow-smart-contract

Complete smart contract development from design through audit to deployment readiness.

---

## Overview

This workflow orchestrates the complete smart contract development lifecycle, integrating security at every stage per professional audit firm methodologies.

## When to Use

- New smart contract development
- Smart contract upgrades
- Protocol changes
- Any code that handles value on-chain

## Agents Involved

| Role | Agent | Responsibility |
|------|-------|----------------|
| **Architecture** | `@senior-architect` | Protocol design, system boundaries |
| **Implementation** | `@solidity-protocol-engineer` | Contract development, testing |
| **Security** | `@security-auditor` | Security review, audit |
| **Economics** | `@defi-risk-engineer` | Economic model, risk analysis |
| **Review** | `@pragmatic-code-reviewer` | Code quality, maintainability |

## Workflow Steps

### Step 1: Protocol Design
**Command:** `/spec-and-plan`

Design the protocol architecture:
- System invariants
- Trust boundaries
- Privileged roles
- External dependencies
- Upgrade strategy

**Agents:**
- `@senior-architect`
- `@defi-risk-engineer` (for DeFi)

**Output:**
```
docs/specs/[protocol-name]/
  protocol-spec.md
  invariants.md
  threat-model.md
```

### Step 2: Economic Review (DeFi)
**If DeFi protocol:**

Review economic model:
- Tokenomics validation
- Incentive analysis
- Attack vector identification
- Risk parameter recommendations

**Agents:**
- `@defi-risk-engineer`

**Output:**
```
docs/specs/[protocol-name]/
  economic-model-review.md
```

### Step 3: Implementation
**Command:** `/implement-feature`

Implement contracts:
- Follow spec exactly
- Write comprehensive tests
- Document invariants
- NatSpec all functions

**Agents:**
- `@solidity-protocol-engineer`

**Output:**
- Smart contracts
- Test suite (unit + fuzz)
- Invariant tests

### Step 4: Security Review
**Command:** `/smart-contract-review`

Security review using OWASP SCSVS:
- Static analysis (Slither)
- Manual code review
- Known attack patterns
- Access control audit

**Agents:**
- `@security-auditor`

**Output:**
```
docs/audit/
  security-review-[date].md
```

### Step 5: Fix Findings
**Command:** `/prp-fix`

Address security findings:
- Critical/High: Immediate fix
- Medium: Fix before deployment
- Low: Document decision

**Agents:**
- `@solidity-protocol-engineer`
- `@security-auditor` (verification)

**Output:**
- Fixed contracts
- Remediation documentation

### Step 6: Re-audit (if critical findings)
**Command:** `/smart-contract-review`

Re-audit after fixes:
- Verify fixes address root cause
- Check for regressions
- Full regression test suite

**Agents:**
- `@security-auditor`

**Output:**
```
docs/audit/
  security-review-[date]-v2.md
```

### Step 7: Code Review
**Command:** `/pragmatic-code-review`

Final code quality review:
- Code clarity
- Test coverage
- Documentation completeness

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
- Review report
- Final sign-off

### Step 8: Deployment Readiness
Compile deployment checklist:
- [ ] All tests pass
- [ ] Slither clean (or findings documented)
- [ ] Invariant tests pass
- [ ] Security audit complete
- [ ] Economic review complete (DeFi)
- [ ] Bug bounty program ready
- [ ] Monitoring/alerting configured
- [ ] Incident response plan documented
- [ ] Multi-sig configured for admin functions
- [ ] Deployment scripts verified

---

## Quick Start

```
/workflow-smart-contract "ERC-20 staking vault"
```

This will execute the full workflow for secure contract development.

---

## Success Criteria

- [ ] Protocol spec is complete
- [ ] All invariants are documented and tested
- [ ] Implementation matches spec
- [ ] Security review complete with no open critical/high
- [ ] Economic model validated (DeFi)
- [ ] All tests passing (unit, fuzz, invariant)
- [ ] Code review passed
- [ ] Deployment checklist complete

---

## Escalation

All security-sensitive decisions MUST involve:
- `@security-auditor` for security concerns
- `@defi-risk-engineer` for economic concerns
- `@senior-architect` for architecture decisions

See `.claude/escalation-matrix.md` for full protocol.

---

## Security Review Methodology

Based on professional audit firm practices:

### Automated Analysis
```bash
# Static analysis
slither . --print human-summary
slither . 2>&1 | tee slither-report.txt

# Test coverage
forge coverage --report summary

# Gas analysis
forge test --gas-report
```

### Manual Review Checklist (OWASP SCSVS)
- V2: Access Control (67% of 2024 losses)
- V4: External Calls (reentrancy)
- V5: Arithmetic
- V8: Business Logic
- V13: Known Attacks
- V14: DeFi-Specific

See `.claude/skills/skill-smart-contract-audit-checklist.md` for full checklist.

---

## Ralph Wiggum Integration

For autonomous execution of this workflow:

1. **Generate PRD**: Run `/ralph-plan` with the contract description to create PRD.md and progress.txt
2. **Run Script**: Execute in terminal:
   ```powershell
   ./scripts/ralph/ralph.ps1 -MaxIterations 100
   ```
3. **Review**: When complete, run `/smart-contract-review` and `/security-review`

For large audits, use parallel execution:
```powershell
./scripts/ralph/ralph.ps1 -Parallel -Workers 3 -MaxIterations 100
```

The canonical Ralph workflow spawns fresh context per iteration, critical for security-sensitive work.

---

## Dependencies

| This Command | Requires | Followed By |
|--------------|----------|-------------|
| Protocol design | Nothing | Implementation |
| Economic review | Protocol design | Implementation |
| Implementation | Protocol design | Security review |
| Security review | Implementation | Fix or re-audit |
| Code review | Security pass | Deployment readiness |

---

## Finding Severity Guide

| Severity | Criteria | Action |
|----------|----------|--------|
| **Critical** | Direct fund loss, protocol takeover | Immediate fix, re-audit |
| **High** | Significant loss under conditions | Fix before deployment |
| **Medium** | Limited impact, requires effort | Fix recommended |
| **Low** | Minor issues, best practices | Document decision |
| **Informational** | Suggestions, gas optimizations | Optional |

---

## Example Session

```
User: /workflow-smart-contract "ERC-4626 yield vault"

Step 1: Running /spec-and-plan...
- Protocol spec created
- Invariants: totalAssets >= totalSupply * minRate
- Threat model: flash loan, donation attack, rounding

Step 2: Running economic review...
- Validated fee structure
- Identified inflation attack vector
- Recommended: virtual shares pattern

Step 3: Running /implement-feature...
- Vault.sol implemented
- 45 unit tests, 10 fuzz tests, 5 invariant tests
- Coverage: 98%

Step 4: Running /smart-contract-review...
- Slither: 0 high, 2 medium, 5 informational
- Manual review: 1 medium (missing slippage protection)
- Finding: MEDIUM-1 - Missing deadline in deposit

Step 5: Running /prp-fix...
- Added deadline parameter
- Added regression test

Step 6: Running /smart-contract-review (re-audit)...
- MEDIUM-1: Fixed and verified
- No new findings

Step 7: Running /pragmatic-code-review...
- PASS: Code quality good
- PASS: Documentation complete

Step 8: Deployment readiness...
- [x] All tests pass
- [x] Slither clean
- [x] Security audit complete
- [x] Economic review complete
- [ ] Bug bounty program (pending setup)
- [ ] Monitoring (pending setup)

CONTRACT_DEPLOYMENT_READY (pending operational setup)
```
