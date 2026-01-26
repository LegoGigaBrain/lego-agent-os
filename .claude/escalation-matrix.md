# Escalation Matrix

This document defines when and how to escalate issues to senior agents during LEGO Agent OS workflows.

---

## Mandatory Escalation Triggers

These triggers REQUIRE escalation. Do not proceed without expert review.

| Trigger | Escalate To | Rationale |
|---------|-------------|-----------|
| Security-sensitive code | `@security-auditor` | All code handling auth, payments, secrets, or user data |
| Smart contract changes | `@security-auditor` + `@defi-risk-engineer` | Immutable code with financial exposure |
| Architecture decisions | `@senior-architect` | Decisions that affect system boundaries or data flow |
| DeFi/economic logic | `@defi-risk-engineer` | Tokenomics, liquidity, oracle design, risk parameters |
| After 5 failed attempts | `@senior-architect` | Systematic blocker requiring fresh perspective |
| Breaking changes to APIs | `@senior-architect` | Changes affecting external consumers |
| Database schema changes | `@senior-architect` + `@backend-engineer` | Migrations with data integrity implications |

---

## Recommended Escalation Triggers

These triggers SHOULD result in escalation when resources permit.

| Trigger | Escalate To | Rationale |
|---------|-------------|-----------|
| UX/flow concerns | `@ux-product-strategist` | User experience impact assessment |
| Performance issues | `@senior-architect` | Systemic performance patterns |
| Brand consistency questions | `@brand-strategist` | Alignment with brand system |
| Content tone/voice questions | `@verbal-identity-designer` | Consistency with verbal identity |
| Complex state management | `@senior-architect` | Architectural patterns for state |
| Third-party integrations | `@senior-architect` + `@security-auditor` | External dependency risk |

---

## Escalation Protocol

### Step 1: Document the Blocker
Before escalating, clearly document:
- What was the original task/goal
- What approaches were attempted
- What specific errors or blockers occurred
- What constraints exist (time, resources, dependencies)

### Step 2: Provide Context
When escalating, include:
- Relevant file paths and line numbers
- Error messages or unexpected behaviors
- Any hypotheses about root cause
- Specific question or decision needed

### Step 3: Tag the Appropriate Agent
Use the agent tag in your message:
```
I need @senior-architect review for this architecture decision.

**Context**: [description]
**Attempted**: [approaches tried]
**Blocker**: [specific issue]
**Question**: [what decision/guidance is needed]
```

### Step 4: Wait for Resolution
Do not proceed with uncertain decisions. Wait for the escalation target to respond with guidance.

---

## Blocker Protocol

When stuck after 5 iterations on the same issue:

1. **Stop iterating** - Additional attempts likely waste tokens
2. **Document thoroughly**:
   - All approaches tried with outcomes
   - Specific error messages or failure modes
   - Hypotheses about potential root causes
3. **Escalate with context**:
   ```
   <blocker>
   TASK: [original task]
   ATTEMPTS: [list of approaches]
   ERRORS: [specific failures]
   HYPOTHESIS: [best guess at root cause]
   NEED: [specific help requested]
   </blocker>
   ```
4. **Request fresh perspective** from `@senior-architect`

---

## Escalation Targets by Domain

### Engineering
| Agent | Escalation Scope |
|-------|-----------------|
| `@senior-architect` | System design, architecture, blockers, performance |
| `@security-auditor` | Security concerns, vulnerabilities, audits |
| `@defi-risk-engineer` | DeFi mechanisms, economic models, oracle design |
| `@pragmatic-code-reviewer` | Code quality, best practices, maintainability |

### Brand & Content
| Agent | Escalation Scope |
|-------|-----------------|
| `@brand-strategist` | Brand alignment, positioning, strategic consistency |
| `@verbal-identity-designer` | Voice, tone, messaging consistency |
| `@content-strategist` | Content strategy alignment, pillar questions |

### Product & Design
| Agent | Escalation Scope |
|-------|-----------------|
| `@ux-product-strategist` | User flows, product decisions, UX patterns |
| `@design-reviewer` | Design consistency, component patterns |

---

## Anti-Patterns (Do NOT Do This)

1. **Silent struggling** - Continuing to iterate without escalating after repeated failures
2. **Premature escalation** - Escalating before attempting basic troubleshooting
3. **Vague escalation** - "This doesn't work" without context or specifics
4. **Wrong target** - Escalating security issues to brand strategist
5. **Skipping documentation** - Escalating without documenting what was tried

---

## Integration with Ralph Loops

During Ralph loop execution, escalations should:
1. Output a `<blocker>` tag for the orchestrator to detect
2. Include all context from the current loop iteration
3. Pause loop execution until blocker is resolved
4. Resume with fresh guidance from escalation target

Example Ralph loop escalation:
```
<iteration>15</iteration>
<status>BLOCKED</status>
<blocker>
TASK: Implement oracle price feed integration
ATTEMPTS:
- Chainlink direct integration (gas too high)
- TWAP calculation (manipulation risk)
- Multi-oracle aggregation (complexity concern)
ERRORS: All approaches have significant tradeoffs
HYPOTHESIS: Need architectural guidance on acceptable risk/cost balance
NEED: @defi-risk-engineer review of oracle strategy options
</blocker>
```

---

## Metrics and Learning

After escalation resolution:
1. Document the solution in relevant spec or ai-docs
2. Update this matrix if new escalation patterns emerge
3. Consider if the blocker indicates a gap in skills or standards

---

*Last updated: 2026-01-22*
