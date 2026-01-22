# Skill: Ralph Wiggum Iterative Development

## Purpose

Design and execute autonomous iterative development loops that run until completion. Use this skill when tasks require persistent iteration, refinement, and self-correction. Named after The Simpsons character, it embodies the philosophy: "Iteration > Perfection."

## Standards Awareness

Before applying this skill, ensure familiarity with:
- `standards/global/testing-principles.md`
- `standards/global/code-style.md`
- Project-specific verification methods (tests, linters, type checks)

---

## Core Philosophy

> "It's better to fail predictably than succeed unpredictably."

Ralph Wiggum is deterministically bad in an undeterministic world. Success depends on:
- Writing good prompts, not just having a good model
- Clear completion criteria
- Mechanical execution with automatic verification
- Persistent iteration despite setbacks

---

## How It Works

```
while :; do
  cat PROMPT.md | claude
done
```

1. Claude works on the task
2. Claude tries to exit
3. Stop hook blocks exit
4. Same prompt feeds back
5. Claude sees its previous work (files, git history)
6. Loop repeats until completion promise detected or iteration limit reached

**Key insight**: Each iteration has full context of what came before. Claude isn't restarting. It's reviewing and improving.

---

## The Prompt Architecture Framework

### 1. Task Definition Block

```
## Task
[Clear, specific description of what to build/achieve]

## Success Criteria
- [ ] Criterion 1 (verifiable)
- [ ] Criterion 2 (verifiable)
- [ ] Criterion 3 (verifiable)
```

### 2. Phased Execution Block

Break work into discrete, completable phases:

```
## Phases

### Phase 1: [Name]
Goal: [Specific outcome]
Verification: [How to know it's done]
- Step 1
- Step 2
- Step 3

### Phase 2: [Name]
Goal: [Specific outcome]
Verification: [How to know it's done]
- Step 1
- Step 2
- Step 3
```

### 3. Self-Correction Block

Build in TDD-style feedback loops:

```
## Iteration Protocol

1. Check current state (run tests, check types, lint)
2. Identify what's failing or missing
3. Fix ONE issue per iteration
4. Verify the fix
5. If all green, move to next phase
6. If still failing, analyze error and retry
7. Document blockers after 5 failed attempts on same issue
```

### 4. Escape Hatch Block

Always include failure handling:

```
## If Stuck

After [N] iterations on the same issue:
1. Document what's blocking progress
2. List approaches already attempted
3. Suggest alternative strategies
4. Output: <blocker>DESCRIPTION</blocker>

## Max Iterations Safety
This loop will stop after [N] iterations regardless of completion.
```

### 5. Completion Promise Block

```
## Completion Signal

When ALL of the following are true:
- [ ] All tests passing
- [ ] All success criteria met
- [ ] Code compiles/builds without errors
- [ ] Documentation updated

Output EXACTLY: <promise>COMPLETE</promise>

Do NOT output the completion promise until ALL criteria are verified.
```

---

## Prompt Templates

### Template: Feature Implementation

```markdown
## Task
Implement [FEATURE NAME] with the following requirements:
[Detailed requirements]

## Success Criteria
- [ ] All CRUD operations working
- [ ] Input validation in place
- [ ] Test coverage > 80%
- [ ] No TypeScript errors
- [ ] Documentation complete

## Phases

### Phase 1: Foundation
- Set up file structure
- Define types/interfaces
- Write failing tests

### Phase 2: Implementation
- Implement core logic
- Pass all tests
- Add error handling

### Phase 3: Polish
- Refactor for clarity
- Add edge case tests
- Update docs

## Iteration Protocol
1. Run `npm test` to see current state
2. Fix failing tests one at a time
3. Run `npm run typecheck` after each fix
4. Commit working increments

## If Stuck
After 10 iterations on same error:
- Document the blocker
- Output: <blocker>DESCRIPTION</blocker>

## Completion Signal
When all tests pass and criteria met:
<promise>COMPLETE</promise>
```

### Template: Refactoring

```markdown
## Task
Refactor [TARGET] to [GOAL].

## Success Criteria
- [ ] All existing tests still pass
- [ ] New pattern implemented
- [ ] No regressions
- [ ] Performance maintained or improved

## Approach
1. Identify all usages of current pattern
2. Create new abstraction
3. Migrate one usage at a time
4. Run tests after each migration
5. Remove old code only after all migrations complete

## Iteration Protocol
1. Run full test suite
2. If green, migrate next usage
3. If red, fix before continuing
4. Never migrate multiple usages in one iteration

## Completion Signal
When all usages migrated and tests green:
<promise>COMPLETE</promise>
```

### Template: Test Coverage

```markdown
## Task
Increase test coverage for [TARGET] to [PERCENTAGE]%.

## Success Criteria
- [ ] Coverage meets target
- [ ] All new tests are meaningful (not just line coverage)
- [ ] No flaky tests
- [ ] Tests run in < [N] seconds

## Approach
1. Run coverage report to identify gaps
2. Prioritize: error paths > edge cases > happy paths
3. Write one test file per iteration
4. Verify tests actually catch bugs

## Iteration Protocol
1. Run `npm run coverage`
2. Identify lowest-coverage module
3. Write tests for one uncovered path
4. Verify test fails when code is broken
5. Move to next gap

## Completion Signal
When coverage >= [PERCENTAGE]%:
<promise>COMPLETE</promise>
```

### Template: E2E Testing with Playwright

```markdown
## Task
Build [FEATURE] with full E2E test coverage using Playwright.

## Success Criteria
- [ ] Feature renders correctly
- [ ] All user interactions work
- [ ] All Playwright E2E tests pass
- [ ] No console errors in browser

## Phases

### Phase 1: Component Structure
- Create component files
- Set up basic rendering
- Write Playwright test skeleton

### Phase 2: Functionality
- Implement user interactions
- Add form validation
- Handle edge cases

### Phase 3: E2E Verification
- Run all Playwright tests
- Fix any failures
- Verify in real browser

## Iteration Protocol
1. Write/update component code
2. Run: `npx playwright test [test-file].spec.ts`
3. If tests fail, read error output
4. Fix the specific failure
5. Run tests again
6. Repeat until green

## Playwright Commands
- Run all tests: `npx playwright test`
- Run specific test: `npx playwright test login.spec.ts`
- Debug mode: `npx playwright test --debug`
- Show report: `npx playwright show-report`

## Completion Signal
When ALL Playwright tests pass:
<promise>COMPLETE</promise>
```

### Template: Browser Automation

```markdown
## Task
[BROWSER AUTOMATION TASK DESCRIPTION]

## Success Criteria
- [ ] Successfully navigates to target pages
- [ ] Extracts/interacts with required elements
- [ ] Handles errors gracefully
- [ ] Output data is valid and complete

## Approach
1. Use Playwright MCP to control browser
2. Take accessibility snapshots (not screenshots) for efficiency
3. Handle pagination/navigation
4. Validate extracted data

## Iteration Protocol
1. Navigate to page using Playwright
2. Take accessibility snapshot
3. Identify target elements
4. Perform action (click, fill, extract)
5. Validate result
6. If error, adjust selector and retry

## Playwright MCP Usage
- Navigate: "Use playwright to navigate to [URL]"
- Snapshot: "Take accessibility snapshot of current page"
- Click: "Click the element with text [TEXT]"
- Fill: "Fill the input field [NAME] with [VALUE]"
- Extract: "Extract all [ELEMENT TYPE] from the page"

## Completion Signal
When task complete and data validated:
<promise>COMPLETE</promise>
```

### Template: Migration

```markdown
## Task
Migrate [SOURCE] to [TARGET].

## Success Criteria
- [ ] All functionality preserved
- [ ] All tests pass
- [ ] No deprecated patterns remain
- [ ] Documentation updated

## Approach
1. Create parallel implementation
2. Migrate one module at a time
3. Run tests after each migration
4. Remove old code only when all tests pass

## Iteration Protocol
1. Identify next module to migrate
2. Create new implementation
3. Update imports/references
4. Run full test suite
5. If green, continue to next
6. If red, fix before continuing

## Completion Signal
When migration complete and tests green:
<promise>COMPLETE</promise>
```

---

## Command Syntax

```bash
/ralph-loop "<prompt>" --max-iterations <n> --completion-promise "<text>"
```

**Options:**
- `--max-iterations <n>` - Safety limit (ALWAYS use this)
- `--completion-promise "<text>"` - Exact string that signals completion

**Example:**
```bash
/ralph-loop "Build a REST API for todos. Requirements: CRUD, validation, tests. Output <promise>COMPLETE</promise> when done." --completion-promise "COMPLETE" --max-iterations 50
```

---

## Cost Estimation

### Token Usage per Iteration

| Task Type | Avg Tokens/Iteration |
|-----------|---------------------|
| Small fix | 2,000-5,000 |
| Feature work | 5,000-15,000 |
| Complex refactor | 10,000-25,000 |
| E2E with Playwright | 8,000-20,000 |

### Iteration Estimates

| Task Complexity | Typical Iterations |
|-----------------|-------------------|
| Small feature | 10-20 |
| Medium feature | 30-50 |
| Large refactor | 50-100 |
| Overnight build | 100-200+ |

### Cost Formula

```
Estimated Cost = (Iterations x Tokens/Iteration x $0.000015)

Example: 50 iterations x 10,000 tokens x $0.000015 = $7.50
```

### Pro Max Subscription Limits

| Plan | 5-Hour Limit | Weekly Sonnet Hours |
|------|--------------|---------------------|
| Max 5x ($100/mo) | ~50-200 prompts | 140-280 hours |
| Max 20x ($200/mo) | ~200-800 prompts | 240-480 hours |

**Guidance:**
- Light usage (1-2 loops/day): Max 5x sufficient
- Heavy usage (multiple long loops): May hit limits
- Overnight runs: Consider Max 20x or API credits

---

## When to Use Ralph

### Good For

| Use Case | Verification Method |
|----------|---------------------|
| Feature building | Unit tests, integration tests |
| Refactoring | Existing test suite |
| Test coverage | Coverage reports |
| E2E testing | Playwright tests |
| Browser automation | Playwright assertions |
| Code migration | Full test suite |
| Documentation | Doc coverage tools |
| Linting/formatting | ESLint, Prettier |
| Type fixes | TypeScript compiler |
| Security fixes | Security audit tools |

### Not Good For

- Tasks requiring human judgment or design decisions
- Subjective quality assessments
- Production debugging (use targeted debugging instead)
- Tasks with unclear success criteria
- One-shot operations
- Anything needing real-time feedback

---

## Quality Checklist

### Before Starting Loop
- [ ] Success criteria are specific and verifiable
- [ ] Verification method exists (tests, linter, etc.)
- [ ] `--max-iterations` is set as safety net
- [ ] Completion promise is defined
- [ ] Escape hatches are documented
- [ ] Phases are small and incremental
- [ ] Cost estimate is acceptable

### Prompt Quality
- [ ] Task is mechanically executable
- [ ] Each phase has clear verification
- [ ] Self-correction protocol included
- [ ] Blocker handling defined
- [ ] No ambiguous requirements

### During Loop
- [ ] Each iteration makes measurable progress
- [ ] Failures are documented, not repeated
- [ ] Git commits preserve working states

---

## Anti-Patterns

- Vague completion criteria ("make it good")
- No iteration limit (infinite loop risk)
- Multiple goals per phase (scope creep)
- No verification method (can't know when done)
- Subjective success criteria (can't be automated)
- Prompts that change between iterations
- No escape hatch for blockers
- Skipping cost estimation for large tasks

---

## Real-World Results

- 6 repositories shipped overnight in YC hackathon ($297 API cost)
- $50k contract completed autonomously
- Complete programming language built over 3 months with single prompt
- Typical API builds complete in 20-40 iterations

---

## Plugin Installation

```bash
# Global installation (recommended)
/plugin install ralph-loop@claude-plugins-official --global

# Per-project installation
/plugin install ralph-loop@claude-plugins-official
```

---

## Resources

- Original technique: https://ghuntley.com/ralph/
- Official plugin: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-loop
- Ralph Orchestrator (advanced): https://github.com/mikeyobrien/ralph-orchestrator

---

## LEGO OS Integration

Ralph loops become more powerful when integrated with the LEGO OS ecosystem. The `ralph-loop-architect` agent auto-detects relevant standards, skills, agents, and commands based on your task.

### Task Type Detection Matrix

| Task Keywords | Standards | Skills | Agents | Verification Commands |
|--------------|-----------|--------|--------|----------------------|
| API, endpoint, backend, REST | `backend/*`, `security/*` | `skill-backend-api-standards`, `skill-secure-coding-standards` | @backend-engineer, @security-auditor | `/security-review` |
| React, component, frontend, UI | `frontend/*` | `skill-react-components-standards`, `skill-design-system-standards` | @ux-product-strategist, @design-reviewer | `/design-review`, `/ux-review` |
| Solidity, contract, token, DeFi | `security/*` | `skill-solidity-style-security`, `skill-smart-contract-auditor` | @solidity-protocol-engineer, @security-auditor, @defi-risk-engineer | `/smart-contract-review` |
| Test, coverage, spec, TDD | `global/testing-principles.md` | `skill-testing-standards` | @pragmatic-code-reviewer | `/pragmatic-code-review` |
| Copy, content, marketing, brand | `signalos/*` | `skill-copywriting`, `skill-verbal-identity` | @copywriter, @ux-writer | `/ux-copy-review` |
| Docs, readme, documentation | `docs/*` | `skill-docs-style`, `skill-gitbook-docs` | @docs-writer | `/write-docs` |
| E2E, playwright, browser, automation | `frontend/*`, `global/*` | `skill-testing-standards`, `skill-ux-review-checklist` | @ux-product-strategist | `/ux-review` |

### Integration Blocks

Include these blocks in Ralph prompts for full LEGO OS integration:

#### Standards Loading Block

```
## Standards (load at start of each iteration)
- `standards/global/code-style.md`
- [Additional standards based on task type]

Apply these standards throughout all code changes.
```

#### Skill Application Block

```
## Skills to Apply
- [Auto-detected skills based on task type]

Reference these skills for implementation patterns and quality checks.
```

#### Agent Delegation Block

```
## Agent Delegation

### Phase N: [Review/Audit Phase]
Delegate to @[agent-name]:
- [Specific review task]
- [Expected deliverable]

Proceed only when agent confirms phase passes.
```

#### Command Verification Block

```
## Verification Gates

After Phase N:
- Run `/[command-name]`
- Review output for issues
- Fix any problems before proceeding
- Re-run until clean
```

---

## Integrated Prompt Templates

### Template: Backend API with Security Gate

```markdown
## Task
Build [API FEATURE] with full security review.

## Standards (load each iteration)
- `standards/global/code-style.md`
- `standards/global/testing-principles.md`
- `standards/backend/api-design.md`
- `standards/backend/data-modelling.md`
- `standards/security/secure-coding.md`

## Skills to Apply
- `skill-backend-api-standards`
- `skill-data-modelling-standards`
- `skill-secure-coding-standards`
- `skill-testing-standards`

## Phases

### Phase 1: API Design
Delegate to @senior-architect:
- Define endpoints and contracts
- Document request/response schemas
- Identify security considerations

### Phase 2: Implementation
- Implement endpoints following standards
- Write unit and integration tests
- Run `npm test` after each change
- Ensure test coverage > 80%

### Phase 3: Security Gate
Delegate to @security-auditor:
- Review for OWASP Top 10 vulnerabilities
- Check authentication/authorization logic
- Verify input validation and sanitization
- Review error handling (no sensitive data leaks)

Run `/security-review` on new code - must pass.

### Phase 4: Code Quality Gate
Run `/pragmatic-code-review`
- Fix any correctness issues
- Address maintainability concerns
- Re-run until clean

## Iteration Protocol
1. Run `npm test` to check current state
2. Fix one failing test or implement one feature
3. Run `npm run typecheck` if TypeScript
4. Commit working increments

## Completion Signal
When all tests pass AND all gates clear:
<promise>COMPLETE</promise>
```

### Template: Frontend Component with Design Review

```markdown
## Task
Build [UI COMPONENT] with design system compliance.

## Standards (load each iteration)
- `standards/frontend/react-components.md`
- `standards/frontend/design-system.md`
- `standards/frontend/design-principles.md`
- `standards/global/testing-principles.md`

## Skills to Apply
- `skill-react-components-standards`
- `skill-design-system-standards`
- `skill-design-principles`
- `skill-ux-review-checklist`

## Phases

### Phase 1: Component Architecture
- Create component file structure
- Define TypeScript props interface
- Set up Playwright test file

### Phase 2: Implementation
- Build component following design system tokens
- Implement all interactive states
- Ensure accessibility (ARIA, keyboard nav)
- Pass Playwright tests

### Phase 3: UX Gate
Delegate to @ux-product-strategist:
- Review user flow clarity
- Check error states and empty states
- Validate loading states
- Verify accessibility

Run `/ux-review` - must pass.

### Phase 4: Design Gate
Run `/design-review`
- Verify design system compliance
- Check visual hierarchy
- Validate responsive behavior
- Fix any issues

## Playwright Commands
- Run tests: `npx playwright test [component].spec.ts`
- Debug: `npx playwright test --debug`
- Report: `npx playwright show-report`

## Completion Signal
When Playwright tests pass AND all gates clear:
<promise>COMPLETE</promise>
```

### Template: Smart Contract with Audit

```markdown
## Task
Build [CONTRACT NAME] with security audit.

## Standards (load each iteration)
- `standards/security/secure-coding.md`

## Skills to Apply
- `skill-solidity-style-security`
- `skill-smart-contract-auditor`

## Phases

### Phase 1: Contract Design
Delegate to @senior-architect:
- Define state variables and access control
- Document invariants
- Identify attack vectors

Delegate to @defi-risk-engineer (if DeFi):
- Review economic model
- Analyze liquidity risks
- Check for manipulation vectors

### Phase 2: Implementation
- Implement contract following Solidity best practices
- Write Foundry/Hardhat tests
- Run `forge test` or `npx hardhat test` after each change
- Achieve 100% test coverage on critical paths

### Phase 3: Security Audit Gate
Delegate to @security-auditor:
- Check for reentrancy vulnerabilities
- Review access control
- Verify arithmetic safety
- Check external call handling

Delegate to @solidity-protocol-engineer:
- Gas optimization review
- Storage layout analysis
- Upgrade safety (if upgradeable)

Run `/smart-contract-review` - must pass.

### Phase 4: Final Verification
- Run full test suite with coverage
- Run static analysis (Slither/Mythril)
- Document any known limitations

## Completion Signal
When all tests pass AND audit gates clear:
<promise>COMPLETE</promise>
```

### Template: Content with Copy Review

```markdown
## Task
Create [CONTENT TYPE] aligned with brand voice.

## Standards (load each iteration)
- `standards/signalos/brand-strategy.md`
- `standards/signalos/vibe-marketing.md`

## Skills to Apply
- `skill-copywriting`
- `skill-verbal-identity`
- `skill-ux-writing-brand-voice`

## Writing Standards
- NEVER use em dashes (AI signal)
- Use commas, colons, or periods instead
- Write like a human, not AI-generated content

## Phases

### Phase 1: Brief Analysis
- Review brand voice guidelines
- Identify target audience
- Define key messages

### Phase 2: Draft Creation
- Write initial draft following brand voice
- Apply copywriting frameworks (AIDA, PAS)
- Ensure clear CTAs

### Phase 3: Copy Review Gate
Delegate to @copywriter:
- Check brand voice alignment
- Verify message clarity
- Review CTA effectiveness

Delegate to @ux-writer (if UI copy):
- Check microcopy patterns
- Verify error message tone
- Review button labels

Run `/ux-copy-review` - must pass.

### Phase 4: Final Polish
- Remove any AI-sounding phrases
- Tighten language
- Verify no em dashes remain

## Completion Signal
When copy review passes:
<promise>COMPLETE</promise>
```

---

## Firm-Level Smart Contract Audit Template

This template mimics the methodology used by professional audit firms like Trail of Bits, OpenZeppelin, Consensys Diligence, and Spearbit. It follows their multi-phase approach with automated tools, manual review, and structured verification.

**Reference**: See `docs/research/smart-contract-audit-methodology.md` for full research.

### Template: Firm-Level Smart Contract Security Audit

```markdown
## Task
Perform a comprehensive security audit of [CONTRACT/PROTOCOL NAME] following professional audit firm methodology.

## Scope
- Contracts: [List all contract files in scope]
- Commit hash: [Frozen commit]
- External dependencies: [List dependencies]
- Out of scope: [Explicitly list what's NOT being audited]

## Standards (load each iteration)
- `standards/security/secure-coding.md`
- `docs/research/smart-contract-audit-methodology.md`

## Skills to Apply
- `skill-solidity-style-security`
- `skill-smart-contract-auditor`

## Success Criteria
- [ ] All automated tools executed (Slither, tests, coverage)
- [ ] Invariant suite developed and passing
- [ ] OWASP SCSVS checklist completed (14 categories)
- [ ] All findings documented with severity
- [ ] Proof of concepts for High/Critical findings
- [ ] Final audit report generated

---

## Phase 1: Preparation and Scoping

### 1.1 Documentation Review
- [ ] Read all available documentation
- [ ] Understand intended behavior
- [ ] Map trust assumptions
- [ ] Identify external dependencies
- [ ] List all privileged roles

### 1.2 Architecture Analysis
Delegate to @senior-architect:
- Create mental model of the system
- Document contract interactions
- Map state transitions
- Identify crown jewels (what must never fail)

### 1.3 Threat Model
Document:
- What are the assets at risk?
- Who are the potential attackers?
- What are the attack surfaces?
- What are the trust boundaries?

---

## Phase 2: Automated Analysis

### 2.1 Static Analysis
Run and document findings:
```bash
slither . --print human-summary
slither . --print contract-summary
slither . 2>&1 | tee slither-report.txt
```

Triage all Slither findings:
- [ ] High severity items addressed or documented
- [ ] Medium severity items reviewed
- [ ] False positives marked with justification

### 2.2 Test Coverage
```bash
forge coverage --report summary
forge coverage --report lcov
```

Requirements:
- [ ] Overall coverage > 90%
- [ ] Critical paths at 100%
- [ ] All external functions tested
- [ ] Edge cases covered

### 2.3 Gas Analysis
```bash
forge test --gas-report
```

Document any functions with unexpectedly high gas usage.

---

## Phase 3: Invariant Development and Fuzzing

### 3.1 Define Invariants
Document system invariants that must ALWAYS hold:

**Balance Invariants:**
- [ ] Total supply equals sum of all balances
- [ ] No balance exceeds total supply
- [ ] Contract balance matches accounting

**Access Control Invariants:**
- [ ] Only authorized roles can call privileged functions
- [ ] Role changes require proper authorization
- [ ] Paused state blocks expected operations

**Protocol-Specific Invariants:**
- [ ] [Define based on protocol type]
- [ ] [DeFi: xy=k, collateral ratios, etc.]

### 3.2 Write Fuzz Tests
Create invariant tests in Foundry:
```solidity
function invariant_totalSupplyMatchesBalances() public {
    // Implementation
}
```

### 3.3 Run Fuzzing Campaign
```bash
forge test --match-contract Invariant -vvv
```

Requirements:
- [ ] All invariants pass after 10,000+ runs
- [ ] No violations found
- [ ] Edge cases documented

---

## Phase 4: OWASP SCSVS Systematic Review

Check each category systematically:

### V1: Architecture, Design and Threat Modeling
- [ ] System architecture is documented
- [ ] Trust boundaries are identified
- [ ] Attack surfaces are minimized

### V2: Access Control (CRITICAL - 67% of 2024 losses)
- [ ] All privileged functions have proper modifiers
- [ ] Role-based access is correctly implemented
- [ ] No missing access controls on sensitive functions
- [ ] Ownership transfer is two-step
- [ ] No privilege escalation paths

### V3: Blockchain Data
- [ ] Private data is not stored on-chain
- [ ] Block data is not relied upon for randomness
- [ ] Transaction ordering attacks considered

### V4: Communications
- [ ] External calls are properly handled
- [ ] Return values are checked
- [ ] Reentrancy protections in place

### V5: Arithmetic
- [ ] No overflow/underflow vulnerabilities
- [ ] SafeMath or Solidity 0.8+ used correctly
- [ ] Precision loss is acceptable

### V6: Malicious Input Handling
- [ ] All inputs are validated
- [ ] Array bounds are checked
- [ ] No unbounded loops with external input

### V7: Gas Usage and Limitations
- [ ] No unbounded loops
- [ ] No DoS via gas exhaustion
- [ ] Appropriate gas limits on external calls

### V8: Business Logic
- [ ] Logic matches specification
- [ ] Edge cases handled
- [ ] State machine transitions are valid

### V9: Denial of Service
- [ ] No griefing attacks possible
- [ ] No blocking of legitimate users
- [ ] Withdrawal patterns used vs push

### V10: Token (if applicable)
- [ ] ERC standard correctly implemented
- [ ] Transfer hooks handled
- [ ] Decimal handling correct

### V11: Code Clarity
- [ ] Code is readable and documented
- [ ] No dead code
- [ ] Consistent naming

### V12: Test Coverage
- [ ] Adequate test coverage
- [ ] Tests are meaningful
- [ ] Edge cases tested

### V13: Known Attacks
- [ ] Reentrancy: protected
- [ ] Front-running: mitigated or accepted
- [ ] Flash loans: considered
- [ ] Oracle manipulation: protected

### V14: Decentralized Finance (if DeFi)
Delegate to @defi-risk-engineer:
- [ ] Price oracle manipulation resistant
- [ ] Flash loan attack resistant
- [ ] Sandwich attack resistant
- [ ] Economic model is sound
- [ ] Liquidation logic is correct
- [ ] Interest calculations are accurate

---

## Phase 5: Manual Deep Review

### 5.1 Line-by-Line Review
For each contract in scope:
- [ ] Read every line of code
- [ ] Understand every state change
- [ ] Question every assumption
- [ ] Check every external call

### 5.2 Attack Vector Analysis
Think like an attacker:
- [ ] How would I steal funds?
- [ ] How would I DoS the protocol?
- [ ] How would I manipulate governance?
- [ ] How would I exploit trust assumptions?

### 5.3 Cross-Contract Interaction Review
- [ ] Trace all cross-contract calls
- [ ] Check for composability risks
- [ ] Verify callback safety
- [ ] Check for reentrancy across contracts

### 5.4 Upgrade Safety (if upgradeable)
- [ ] Storage layout is preserved
- [ ] Initializers are protected
- [ ] Proxy patterns correctly implemented
- [ ] No selfdestruct in implementation

---

## Phase 6: Findings Documentation

### Severity Classification

For each finding, classify:

| Severity | Impact | Likelihood |
|----------|--------|------------|
| Critical | Direct fund loss, protocol takeover | High |
| High | Significant loss under conditions | Medium-High |
| Medium | Limited impact, specific circumstances | Medium |
| Low | Minor issues, best practices | Low |
| Informational | Suggestions, optimizations | N/A |

### Finding Template
For each finding document:
```markdown
### [SEVERITY]-[NUMBER]: [Title]

**Location**: `contract.sol:L123`

**Description**:
[What is the issue]

**Impact**:
[What could happen if exploited]

**Proof of Concept**:
[Code or steps to reproduce]

**Recommendation**:
[How to fix]

**Status**: [Open/Fixed/Acknowledged]
```

---

## Phase 7: Remediation Verification

After fixes are applied:

### 7.1 Verify Each Fix
- [ ] Fix addresses root cause
- [ ] No new vulnerabilities introduced
- [ ] Tests added for the fix

### 7.2 Re-run Automated Analysis
```bash
slither .
forge test
forge coverage
```

### 7.3 Re-run Invariant Tests
```bash
forge test --match-contract Invariant
```

### 7.4 Final Review
Delegate to @security-auditor:
- [ ] All Critical/High findings resolved
- [ ] Remediation is correct
- [ ] No regressions

---

## Phase 8: Report Generation

Generate final audit report:

### Executive Summary
- Scope and objectives
- Key findings overview
- Risk assessment

### Methodology
- Tools used
- Manual review approach
- Testing methodology

### Findings Summary
| Severity | Count | Fixed | Acknowledged |
|----------|-------|-------|--------------|
| Critical | X | X | 0 |
| High | X | X | 0 |
| Medium | X | X | X |
| Low | X | X | X |
| Info | X | - | - |

### Detailed Findings
[All findings with details]

### Appendix
- Full Slither output
- Test coverage report
- Gas analysis

---

## Iteration Protocol

1. Start with Phase 1, complete before proceeding
2. Run automated tools (Phase 2-3) continuously
3. Document findings as discovered
4. After each finding, assess if it affects other areas
5. Complete SCSVS checklist systematically
6. Generate report incrementally

## If Stuck

After 5 iterations on same issue:
1. Document the blocker
2. List what was tried
3. Output: <blocker>DESCRIPTION</blocker>

## Completion Signal

When ALL of the following are true:
- [ ] All phases completed
- [ ] All SCSVS categories reviewed
- [ ] All findings documented
- [ ] Remediation verified (if fixes provided)
- [ ] Final report generated

Output: <promise>AUDIT_COMPLETE</promise>
```

### Estimated Iterations and Cost

| Audit Scope | Estimated Iterations | Estimated Cost |
|-------------|---------------------|----------------|
| Single contract (<500 LOC) | 30-50 | $5-15 |
| Small protocol (500-2000 LOC) | 50-100 | $15-40 |
| Medium protocol (2000-5000 LOC) | 100-200 | $40-100 |
| Large protocol (5000+ LOC) | 200-500 | $100-300 |

**Note**: These are estimates. Complex DeFi protocols with economic risks may require significantly more iterations.

### Pre-Flight Checklist

Before starting firm-level audit:
- [ ] All contract code is frozen (commit hash)
- [ ] Documentation exists
- [ ] Foundry/Hardhat is set up
- [ ] Slither is installed (`pip install slither-analyzer`)
- [ ] Tests exist and pass
- [ ] You have time for a thorough review (not rushing)
- [ ] Cost budget is acceptable for scope
