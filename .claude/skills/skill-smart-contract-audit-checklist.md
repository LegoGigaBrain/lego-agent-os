# Skill: Smart Contract Audit Checklist

## Purpose

Comprehensive checklist for reviewing Solidity/EVM smart contracts, based on OWASP SCSVS (Smart Contract Security Verification Standard) and professional audit firm methodologies.

**Reference**: See `docs/research/smart-contract-audit-methodology.md` for methodology details.

---

## Quick Pre-Check (5 minutes)

Before deep review, verify basics:

- [ ] Code compiles without warnings
- [ ] Tests exist and pass
- [ ] Slither runs without critical findings
- [ ] Documentation exists

---

## V1: Architecture, Design and Threat Modeling

- [ ] System architecture is documented
- [ ] Trust boundaries are identified
- [ ] Attack surfaces are minimized
- [ ] Privileged roles are documented
- [ ] External dependencies are listed
- [ ] Upgrade path is documented (or explicitly immutable)

---

## V2: Access Control (CRITICAL - 67% of 2024 losses)

- [ ] All state-changing functions have appropriate access control
- [ ] Role-based permissions are correctly implemented
- [ ] No missing access modifiers on sensitive functions
- [ ] Ownership transfer is two-step (propose + accept)
- [ ] No privilege escalation paths exist
- [ ] Admin functions are timelocked where appropriate
- [ ] Multi-sig required for critical operations
- [ ] Default deny: functions reject unauthorized callers

---

## V3: Blockchain Data

- [ ] Private data is not stored on-chain (it's not actually private)
- [ ] Block timestamp is not used for critical logic
- [ ] Block number is not used for randomness
- [ ] Transaction ordering attacks are considered
- [ ] msg.sender vs tx.origin used correctly

---

## V4: Communications / External Calls

- [ ] External calls follow checks-effects-interactions pattern
- [ ] Return values from external calls are checked
- [ ] Reentrancy guards are in place for vulnerable functions
- [ ] Low-level calls (call, delegatecall) are used safely
- [ ] Contract existence is verified before calls
- [ ] Gas limits are considered for external calls
- [ ] Callbacks are handled safely

---

## V5: Arithmetic

- [ ] No integer overflow/underflow (Solidity 0.8+ or SafeMath)
- [ ] Division by zero is prevented
- [ ] Precision loss is acceptable and documented
- [ ] Fee/percentage calculations are correct
- [ ] Rounding direction is intentional
- [ ] Large number multiplication checked for overflow

---

## V6: Malicious Input Handling

- [ ] All user inputs are validated
- [ ] Array lengths are bounded
- [ ] No unbounded loops with external input
- [ ] Zero values are handled appropriately
- [ ] Address(0) checks where needed
- [ ] Empty arrays/strings handled
- [ ] Type ranges are validated (uint256 max, etc.)

---

## V7: Gas Usage and Limitations

- [ ] No unbounded loops
- [ ] No DoS via gas exhaustion
- [ ] Storage vs memory optimized
- [ ] Batch operations have reasonable limits
- [ ] Gas stipends for external calls considered
- [ ] Out-of-gas in sub-calls handled

---

## V8: Business Logic / Invariants

- [ ] Logic matches specification exactly
- [ ] State machine transitions are valid
- [ ] Edge cases are handled
- [ ] Time-dependent logic is correct
- [ ] Invariants are documented
- [ ] Invariants are tested with fuzzing
- [ ] No logical contradictions in require statements

---

## V9: Denial of Service

- [ ] No griefing attacks possible
- [ ] Legitimate users cannot be blocked
- [ ] Pull over push pattern for payments
- [ ] No blocking on single user failure
- [ ] Self-destruct cannot be triggered maliciously
- [ ] Pause functionality has escape hatch

---

## V10: Token Standards (if applicable)

- [ ] ERC-20/721/1155 standard correctly implemented
- [ ] Transfer hooks (ERC-777, ERC-721) handled
- [ ] Decimal handling is correct
- [ ] Approve/transferFrom race condition addressed
- [ ] totalSupply is accurate
- [ ] balance cannot exceed totalSupply

---

## V11: Code Clarity

- [ ] Code is readable and well-documented
- [ ] No dead code
- [ ] Consistent naming conventions
- [ ] NatSpec comments on public functions
- [ ] Complex logic is explained
- [ ] Magic numbers are constants

---

## V12: Test Coverage

- [ ] Overall coverage > 90%
- [ ] Critical paths at 100%
- [ ] Happy paths tested
- [ ] Failure/revert paths tested
- [ ] Boundary conditions tested
- [ ] At least one attack scenario tested
- [ ] Invariant tests exist
- [ ] Fuzz tests for complex functions

---

## V13: Known Attacks

### Reentrancy
- [ ] Single-function reentrancy protected
- [ ] Cross-function reentrancy protected
- [ ] Cross-contract reentrancy considered
- [ ] Read-only reentrancy considered

### Front-running / MEV
- [ ] Front-running impact assessed
- [ ] Commit-reveal scheme if needed
- [ ] Slippage protection in place
- [ ] Deadline parameters used

### Flash Loans
- [ ] Flash loan attacks considered
- [ ] Instant governance attacks prevented
- [ ] Price manipulation via flash loans prevented

### Other
- [ ] Signature replay prevented (nonces, EIP-712)
- [ ] Block stuffing attacks considered
- [ ] Griefing attacks prevented

---

## V14: Decentralized Finance (if DeFi)

### Oracles
- [ ] Multiple oracle sources or fallback
- [ ] Stale price protection (heartbeat check)
- [ ] Price manipulation resistant (TWAP)
- [ ] Decimal handling correct across oracles

### Lending/Borrowing
- [ ] Collateral ratio calculations correct
- [ ] Liquidation logic is sound
- [ ] Interest accrual is accurate
- [ ] Bad debt handling defined

### AMM/DEX
- [ ] Constant product formula correct
- [ ] Slippage protection
- [ ] Front-running mitigation
- [ ] LP token accounting accurate

### Governance
- [ ] Voting power snapshot-based
- [ ] Flash loan governance attacks prevented
- [ ] Timelock on proposals
- [ ] Quorum requirements appropriate

### Economic Model
- [ ] Emission schedule sustainable
- [ ] Incentives aligned correctly
- [ ] No infinite mint possible
- [ ] Token velocity considered

---

## Upgrade Safety (if upgradeable)

- [ ] Storage layout preserved across upgrades
- [ ] No storage collisions
- [ ] Initializer functions protected
- [ ] Implementation cannot be initialized directly
- [ ] No selfdestruct in implementation
- [ ] Upgrade path is access controlled
- [ ] slither-check-upgradability passes

---

## Pre-Deployment Checklist

- [ ] All tests pass
- [ ] Slither clean (or findings documented)
- [ ] Invariant tests pass
- [ ] Audit completed
- [ ] Bug bounty program ready
- [ ] Monitoring/alerting set up
- [ ] Incident response plan documented
- [ ] Multi-sig for admin functions
- [ ] Deployment scripts verified

---

## Post-Deployment

- [ ] Contract verified on block explorer
- [ ] Initial state correct
- [ ] Admin functions tested on mainnet
- [ ] Monitoring active
- [ ] Bug bounty live

---

## Usage

Use this checklist:
1. During code review
2. Before `/smart-contract-review`
3. As part of `/smart-contract-audit`
4. Before mainnet deployment
5. In Ralph loop audit prompts

Mark items as:
- [x] Checked and passing
- [ ] Not yet checked
- [N/A] Not applicable to this contract
- [!] Issue found (document separately)
