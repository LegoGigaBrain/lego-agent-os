# Skill: Smart Contract Auditor

## Purpose

Provide structure and methodology for auditing smart contracts at a professional firm level. This skill integrates research from Trail of Bits, OpenZeppelin, Consensys Diligence, Spearbit, and Certora.

**Reference**: See `docs/research/smart-contract-audit-methodology.md` for complete methodology documentation.

---

## Core Philosophy

> "Automated tools only find 8-20% of exploitable bugs. Almost 50% of findings require human expertise."

Professional audits combine:
1. **Automated analysis** (Slither, Mythril, fuzzing)
2. **Systematic manual review** (OWASP SCSVS checklist)
3. **Attacker mindset** (economic attacks, edge cases)
4. **Formal verification** (for critical properties)

---

## Audit Categories (OWASP SCSVS + SWC)

### Critical Categories (highest loss potential)

| Category | 2024 Losses | Focus Areas |
|----------|-------------|-------------|
| **Access Control** | $953M (67%) | Role management, privilege escalation, missing modifiers |
| **Logic Errors** | $63.8M | State machine bugs, incorrect calculations |
| **Reentrancy** | $35.7M | Cross-function, cross-contract, read-only |
| **Flash Loans** | $33.8M | Price manipulation, governance attacks |
| **Oracle Manipulation** | $8.8M | Single oracle, TWAP bypasses, stale prices |

### Full Category List

1. **V1: Architecture and Threat Modeling**
2. **V2: Access Control / Authentication**
3. **V3: Blockchain Data**
4. **V4: Communications / External Calls**
5. **V5: Arithmetic / Overflow / Underflow**
6. **V6: Malicious Input Handling**
7. **V7: Gas Usage and Limitations**
8. **V8: Business Logic / Invariants**
9. **V9: Denial of Service / Griefing**
10. **V10: Token Standards**
11. **V11: Code Clarity**
12. **V12: Test Coverage**
13. **V13: Known Attacks**
14. **V14: DeFi-Specific** (oracles, liquidations, MEV)

---

## Audit Phases

### Phase 1: Preparation
- Build mental model of the system
- Map trust boundaries and privileged roles
- Identify crown jewels (what must never fail)
- Document intended behavior vs implementation

### Phase 2: Automated Analysis
```bash
# Static analysis
slither . --print human-summary
slither . 2>&1 | tee slither-report.txt

# Test coverage
forge coverage --report summary

# Gas analysis
forge test --gas-report
```

### Phase 3: Invariant Development
Define and test system invariants:
- Balance invariants (supply = sum of balances)
- Access control invariants (only owner can X)
- Protocol-specific invariants (AMM: xy=k)

```bash
forge test --match-contract Invariant -vvv
```

### Phase 4: Manual Review
- Line-by-line code review
- Think like an attacker
- Cross-contract interaction analysis
- Economic attack vector analysis

### Phase 5: Documentation
- Classify findings by severity
- Write proof of concepts
- Provide remediation recommendations

---

## Finding Output Structure

For each finding, document:

```markdown
### [SEVERITY]-[NUMBER]: [Title]

**Location**: `contract.sol:L123`

**Category**: [OWASP SCSVS category]

**Description**:
[What is the issue]

**Impact**:
[What could happen if exploited]

**Likelihood**: [High/Medium/Low]

**Proof of Concept**:
[Code or steps to reproduce]

**Recommendation**:
[How to fix]

**Tests to Add**:
[Specific test cases]

**Status**: [Open/Fixed/Acknowledged]
```

### Severity Classification

| Severity | Criteria |
|----------|----------|
| **Critical** | Direct fund loss, protocol takeover, no user action needed |
| **High** | Significant loss possible, requires specific conditions |
| **Medium** | Limited impact, requires attacker effort or user mistake |
| **Low** | Minor issues, best practice violations |
| **Informational** | Suggestions, gas optimizations, code clarity |

---

## Tools Integration

### Static Analysis
- **Slither**: 80+ vulnerability detectors, call graphs
- **Mythril**: Symbolic execution, SMT solving
- **Aderyn**: Fast Rust-based analysis

### Fuzzing
- **Echidna**: Grammar-based invariant testing
- **Foundry**: Integrated fuzz and invariant tests
- **Medusa**: Parallelized fuzzing

### Formal Verification
- **Certora Prover**: CVL specification language
- **SMTChecker**: Built-in Solidity verification

---

## When to Apply

- Inside `@security-auditor` when smart contracts are involved
- In `/smart-contract-review` and `/smart-contract-audit` workflows
- Before any mainnet deployment
- After significant code changes

---

## Quick Checks (minimum review)

- [ ] All external/public functions have access control
- [ ] No reentrancy vulnerabilities (CEI pattern or guards)
- [ ] All inputs validated
- [ ] No unbounded loops
- [ ] External calls checked for return values
- [ ] Events emitted for state changes
- [ ] Tests exist and pass

---

## DeFi-Specific Checks

When auditing DeFi protocols, additionally check:

- [ ] Oracle manipulation resistance
- [ ] Flash loan attack vectors
- [ ] Sandwich attack protection
- [ ] MEV considerations
- [ ] Liquidation logic correctness
- [ ] Interest/fee calculation precision
- [ ] Slippage protection

Delegate to `@defi-risk-engineer` for economic model review.

---

## Resources

- [OWASP Smart Contract Top 10](https://scs.owasp.org/sctop10/)
- [OWASP SCSVS](https://securing.github.io/SCSVS/)
- [Trail of Bits Building Secure Contracts](https://secure-contracts.com/)
- [Slither Documentation](https://github.com/crytic/slither)
- [Echidna Documentation](https://github.com/crytic/echidna)

---

## Ralph Wiggum Integration

For autonomous security audits, use the firm-level audit template in `skill-ralph-wiggum.md`. This template follows professional audit firm methodology with 8 phases, OWASP SCSVS checklist, and structured report generation.

1. Run `/ralph-plan` to generate PRD.md with audit tasks
2. Execute in terminal:
```powershell
./scripts/ralph/ralph.ps1 -MaxIterations 100
```
3. Review with `/smart-contract-review` when complete
