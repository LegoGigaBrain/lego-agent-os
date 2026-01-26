# Professional Smart Contract Audit Methodology

> Research compiled from Trail of Bits, OpenZeppelin, Consensys Diligence, Spearbit, Certora, and other top audit firms.

---

## The Core Truth

**Automated tools only find 8-20% of exploitable bugs.**

- Almost 50% of findings are unlikely to ever be found by any automated tool
- Even 35% of high-severity findings require human expertise
- This is why firms charge $50K-$200K+ per audit

The gap between running Slither and a firm-level audit is enormous. Firms earn their fees through systematic manual review, custom fuzzing suites, and deep understanding of economic attack vectors.

---

## Firm-Level Audit Phases

### Phase 1: Engagement and Scoping (2-5 days)

- **Kickoff call** to download context on codebase
- **Scope definition**: What's in/out, commit hash freeze
- **Complexity assessment**: LOC, contract count, DeFi integrations
- **Threat model alignment**: What are the crown jewels?
- **Timeline and milestones agreed**

### Phase 2: Preparation and Documentation Review

- Review architecture diagrams, user flows, invariants
- Understand intended behavior vs actual implementation
- Identify trust assumptions and external dependencies
- Map privilege levels and access control
- Build mental model of the entire system

### Phase 3: Automated Analysis (Continuous)

| Tool Type | Tools | Purpose |
|-----------|-------|---------|
| Static Analysis | Slither, Mythril, Aderyn | Detect 80+ vulnerability patterns |
| Fuzzing | Echidna, Medusa, Foundry | Property-based testing with invariants |
| Formal Verification | Certora Prover, Manticore | Mathematical proofs of correctness |

Tools run continuously throughout the engagement. Findings are triaged by humans, not just reported raw.

### Phase 4: Manual Review (10-20+ days)

This is where firms earn their fees:

1. **Build Mental Model**: Understand business logic completely
2. **Think Like an Attacker**: Probe for edge cases, race conditions
3. **Line-by-Line Review**: Every function, every state change
4. **Cross-Contract Interactions**: Composability risks
5. **Economic Attack Vectors**: Tokenomics, incentive misalignment
6. **Access Control Deep Dive**: The #1 cause of losses ($953M in 2024)

### Phase 5: Remediation Review (10+ days)

- Verify all fixes address root cause
- Re-run entire fuzzing suite
- Check for regression bugs
- Validate no new vulnerabilities introduced
- Second review of remediation code

### Phase 6: Final Report and Certification

- Detailed findings with severity classification
- Proof of concepts for each vulnerability
- Remediation recommendations
- Final attestation (if clean)
- Public report (optional)

---

## OWASP SCSVS Categories

The [OWASP Smart Contract Security Verification Standard](https://securing.github.io/SCSVS/) defines 14 verification categories:

| Category | Focus Area |
|----------|-----------|
| **V1** | Architecture, Design and Threat Modeling |
| **V2** | Access Control |
| **V3** | Blockchain Data |
| **V4** | Communications |
| **V5** | Arithmetic |
| **V6** | Malicious Input Handling |
| **V7** | Gas Usage and Limitations |
| **V8** | Business Logic |
| **V9** | Denial of Service |
| **V10** | Token |
| **V11** | Code Clarity |
| **V12** | Test Coverage |
| **V13** | Known Attacks |
| **V14** | Decentralized Finance |

Each category contains specific verification requirements that should be systematically checked.

---

## OWASP Smart Contract Top 10 (2025)

Based on $1.42B in losses across 149 incidents in 2024:

| Rank | Vulnerability | Losses 2024 | % of Total |
|------|--------------|-------------|------------|
| SC01 | Access Control Vulnerabilities | $953.2M | 67% |
| SC02 | Price Oracle Manipulation | $8.8M | <1% |
| SC03 | Logic Errors | $63.8M | 4.5% |
| SC04 | Lack of Input Validation | $14.6M | 1% |
| SC05 | Reentrancy Attacks | $35.7M | 2.5% |
| SC06 | Unchecked External Calls | $550K | <1% |
| SC07 | Flash Loan Attacks | $33.8M | 2.4% |
| SC08 | Integer Overflow/Underflow | - | - |
| SC09 | Insecure Randomness | - | - |
| SC10 | DoS Attacks | - | - |

**Key Insight**: Access control alone accounts for 67% of all losses. This is where auditors must focus the most attention.

---

## Tools Used by Top Firms

### Static Analysis

| Tool | Developer | Capabilities |
|------|-----------|-------------|
| **Slither** | Trail of Bits | 80+ detectors, inheritance analysis, call graphs |
| **Mythril** | ConsenSys | Symbolic execution, SMT solving, taint analysis |
| **Aderyn** | Cyfrin | Rust-based, fast, custom detectors |

### Fuzzing / Property-Based Testing

| Tool | Developer | Capabilities |
|------|-----------|-------------|
| **Echidna** | Trail of Bits | Grammar-based fuzzing, invariant testing |
| **Medusa** | Trail of Bits | Parallelized fuzzing, Go-based |
| **Foundry Fuzzer** | Paradigm | Integrated with test suite, Solidity-native |
| **Harvey** | ConsenSys | Bytecode-level fuzzing |

### Formal Verification

| Tool | Developer | Capabilities |
|------|-----------|-------------|
| **Certora Prover** | Certora | CVL specification language, mathematical proofs |
| **Manticore** | Trail of Bits | Symbolic execution engine |
| **SMTChecker** | Solidity | Built-in compiler verification |

### Economic Modeling

- **Agent-based simulations**: Test tokenomics under stress conditions
- **Game theory analysis**: Incentive alignment verification
- **MEV analysis**: Front-running and sandwich attack modeling

---

## Trail of Bits Building Secure Contracts Checklist

From their [handbook](https://secure-contracts.com/):

### Before Review

- [ ] Run Slither on all contracts
- [ ] Remove dead code and unused dependencies
- [ ] Freeze commit hash
- [ ] Comprehensive unit test coverage
- [ ] Document all invariants
- [ ] Create architecture diagrams
- [ ] List all actors with privileges
- [ ] Define system invariants and parameter ranges

### Design Principles

- [ ] Keep code off-chain where possible
- [ ] Favor migration over upgradeability
- [ ] Initialize implementations immediately
- [ ] Write small, single-purpose functions
- [ ] Minimize inheritance depth
- [ ] Log all critical operations
- [ ] Use well-tested libraries (OpenZeppelin)
- [ ] Avoid inline assembly

### Deployment

- [ ] Monitor contracts post-deploy
- [ ] Secure privileged wallets (hardware)
- [ ] Incident response plan ready
- [ ] Bug bounty program active

---

## What Differentiates Firm-Level Audits

| Amateur/Automated | Firm-Level |
|-------------------|------------|
| Run Slither, report findings | Build complete mental model first |
| Check known vulnerability patterns | Think like an attacker, find novel bugs |
| Single pass review | Multiple auditors, different perspectives |
| Code-only focus | Economic + code + architecture review |
| No fuzzing | Custom invariant suites, millions of test cases |
| Basic severity ratings | Proof of concepts, exploitation paths |
| Report and done | Remediation support, re-audit, ongoing |

---

## Severity Classification

Findings are classified by two axes: **impact** and **likelihood**.

### Impact Levels

| Level | Description |
|-------|-------------|
| **Critical** | Direct loss of funds, protocol takeover, irreversible damage |
| **High** | Significant loss possible under specific conditions |
| **Medium** | Limited impact, requires specific circumstances |
| **Low** | Minor issues, best practice violations |
| **Informational** | Suggestions, gas optimizations, code clarity |

### Likelihood Levels

| Level | Description |
|-------|-------------|
| **High** | Easy to exploit, likely to be discovered |
| **Medium** | Requires specific knowledge or timing |
| **Low** | Complex attack path, unlikely to be exploited |

### Severity Matrix

```
              IMPACT
           Low  Med  High  Crit
         +----+----+-----+-----+
    High | M  | H  |  C  |  C  |
L   Med  | L  | M  |  H  |  C  |
I   Low  | I  | L  |  M  |  H  |
K        +----+----+-----+-----+
```

---

## Economic Attack Vectors (DeFi-Specific)

### Price Oracle Manipulation

- Single oracle dependency
- Flash loan price manipulation
- Time window attacks
- Sandwich attacks

**Defense**: TWAP, multiple oracles, Chainlink with heartbeat checks

### Flash Loan Attacks

- Governance manipulation (Beanstalk, $182M)
- Price manipulation within single transaction
- Collateral value manipulation

**Defense**: Delay mechanisms, snapshot-based voting, multi-block confirmation

### Tokenomics Exploits

- Emission schedule gaming
- Incentive misalignment
- Inflation/deflation attacks
- Liquidity manipulation

**Defense**: Agent-based simulation, game theory analysis, gradual rollout

---

## Invariant Development

Invariants are properties that must always hold true. Examples:

### Balance Invariants
```solidity
// Total supply equals sum of all balances
invariant totalSupplyEqualsBalances()
    totalSupply() == sum(balanceOf(user) for all users)

// No balance exceeds total supply
invariant noBalanceExceedsTotalSupply()
    forall address user: balanceOf(user) <= totalSupply()
```

### Access Control Invariants
```solidity
// Only owner can change owner
invariant ownerOnlyChangedByOwner()
    owner() changed => msg.sender == old(owner())

// Paused state blocks transfers
invariant pausedBlocksTransfers()
    paused() => transfer() reverts
```

### DeFi Invariants
```solidity
// AMM: xy = k (constant product)
invariant constantProduct()
    reserveX * reserveY == k

// Lending: collateral ratio maintained
invariant collateralRatio()
    collateral(user) >= debt(user) * minRatio
```

---

## Report Structure

Professional audit reports follow this structure:

1. **Executive Summary**
   - Scope and objectives
   - Key findings overview
   - Risk assessment summary

2. **Methodology**
   - Tools used
   - Manual review approach
   - Testing methodology

3. **Findings**
   - For each finding:
     - Title and severity
     - Location (file:line)
     - Description
     - Impact analysis
     - Proof of concept
     - Recommendation
     - Status (fixed/acknowledged/disputed)

4. **Appendices**
   - Full tool output
   - Test coverage report
   - Gas analysis

---

## Sources

- [Trail of Bits Blog - 246 Findings Summary](https://blog.trailofbits.com/2019/08/08/246-findings-from-our-smart-contract-audits-an-executive-summary/)
- [Trail of Bits - Building Secure Contracts](https://secure-contracts.com/)
- [OWASP Smart Contract Security](https://scs.owasp.org/)
- [OWASP Smart Contract Top 10](https://scs.owasp.org/sctop10/)
- [OWASP SCSVS](https://securing.github.io/SCSVS/)
- [Consensys Diligence](https://diligence.consensys.io/)
- [OpenZeppelin Audit Readiness Guide](https://learn.openzeppelin.com/security-audits/readiness-guide)
- [Certora Prover Documentation](https://docs.certora.com/en/latest/docs/user-guide/index.html)
- [Echidna GitHub](https://github.com/crytic/echidna)
- [Cantina Security Reviews](https://cantina.xyz/)
- [Cyfrin - Fuzzing and Invariant Testing](https://www.cyfrin.io/blog/smart-contract-fuzzing-and-invariants-testing-foundry)
- [Three Sigma - DeFi Audit Guide](https://threesigma.xyz/blog/defi/defi-audit-guide)

---

*Last updated: January 2026*
