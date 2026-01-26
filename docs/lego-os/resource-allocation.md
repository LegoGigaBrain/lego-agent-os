# Resource Allocation Guide

Guidelines for managing token budgets, work-in-progress limits, and sprint planning in LEGO Agent OS.

---

## Token Budget Management

### Estimation

Before running Ralph loops, estimate costs:

| Task Size | Iterations | Est. Cost (Opus) | Est. Cost (Sonnet) |
|-----------|------------|------------------|-------------------|
| XS | 5-10 | $0.50-1.50 | $0.10-0.30 |
| S | 10-20 | $1-3 | $0.20-0.60 |
| M | 20-40 | $2-6 | $0.40-1.20 |
| L | 40-80 | $4-12 | $0.80-2.40 |
| XL | 80+ | $8-24+ | $1.60-4.80+ |

**Calculation:**
- Opus 4.5: ~$0.10-0.15 per iteration average
- Sonnet: ~$0.02-0.03 per iteration average

### Budget Tracking

Track actual vs estimated in sprint plans:

```markdown
| Task | Estimated | Actual | Variance |
|------|-----------|--------|----------|
| Task 1 | $5 | $4.20 | -16% |
| Task 2 | $8 | $12.50 | +56% |
| **Total** | $13 | $16.70 | +28% |
```

### Warning Thresholds

Set alerts at:
- **80%**: Warn that budget is nearly exhausted
- **100%**: Pause and request approval before continuing
- **120%**: Hard stop, require explicit override

### Cost Optimization

1. **Use Sonnet for exploration**: Initial research and file scanning
2. **Use Opus for implementation**: Complex coding and reasoning
3. **Batch similar tasks**: Reduces context-loading overhead
4. **Cache context**: Reuse loaded context across related tasks

---

## Work-in-Progress (WIP) Limits

### Loop Limits

| Scope | Limit | Rationale |
|-------|-------|-----------|
| Per category | 1 | Avoid conflicts in same domain |
| Total parallel | 3 | System resource constraints |
| Per sprint | 5 | Maintainable review overhead |

### Category Isolation

Only one loop per category at a time:
- `backend`: 1 loop max
- `frontend`: 1 loop max
- `smart-contract`: 1 loop max
- `brand`: 1 loop max

This prevents:
- File conflicts
- Context confusion
- Merge conflicts

### Completion Before Start

Before starting a new task in the same category:
1. Verify previous task's completion promise
2. Run verification command
3. Commit or stash changes
4. Clear context

---

## Priority Levels

### Priority Definitions

| Level | Description | Response Time |
|-------|-------------|---------------|
| **P0 - Critical** | Production down, security breach, data loss | Immediate |
| **P1 - High** | Blocking issues, sprint commitments | Same day |
| **P2 - Medium** | Important but not blocking | This week |
| **P3 - Low** | Nice-to-have, tech debt | Backlog |

### Priority Matrix

```
                URGENCY
              Low    High
         +--------+--------+
  High   |   P2   |   P0   |
IMPACT   +--------+--------+
  Low    |   P3   |   P1   |
         +--------+--------+
```

### Priority Handling

1. **P0 tasks** interrupt all other work
2. **P1 tasks** queue at front of current sprint
3. **P2 tasks** schedule in next available sprint
4. **P3 tasks** add to backlog for later

---

## Sprint Planning

### Sprint Structure

```
Sprint: [Name]
Duration: [1-2 weeks]
Budget: $[amount]

Goals:
- [ ] Goal 1
- [ ] Goal 2

Tasks (ordered by priority):
1. P1: [task]
2. P1: [task]
3. P2: [task]
...
```

### Estimation Process

1. **List tasks** from backlog
2. **Size each task** (XS/S/M/L/XL)
3. **Calculate total iterations**
4. **Add 20% buffer** for unknowns
5. **Check budget** against estimate
6. **Adjust scope** if over budget

### Velocity Tracking

Track completed iterations per sprint:

```
Sprint 1: 85 iterations (estimated 100)
Sprint 2: 120 iterations (estimated 100)
Sprint 3: 95 iterations (estimated 100)
Average velocity: 100 iterations/sprint
```

Use velocity to improve future estimates.

---

## Resource Allocation by Agent Type

### Engineering Agents

High token usage, complex reasoning:
- `@senior-architect`: 10-20 iterations for design
- `@backend-engineer`: 20-40 iterations for implementation
- `@solidity-protocol-engineer`: 30-60 iterations (security-critical)
- `@security-auditor`: 20-40 iterations for review

### Brand/Content Agents

Medium token usage:
- `@brand-strategist`: 15-30 iterations
- `@content-strategist`: 10-20 iterations
- `@copywriter`: 5-15 iterations per piece

### Review Agents

Lower token usage per pass:
- `@pragmatic-code-reviewer`: 10-20 iterations
- `@design-reviewer`: 5-10 iterations

---

## Parallel Execution

### When to Parallelize

Parallelize when tasks:
- Have no dependencies
- Touch different files/domains
- Don't share mutable state

### Parallel Patterns

```
Good:
[Backend API]     [Frontend UI]
      ↓                 ↓
[Integration Test]

Bad (conflicts):
[Backend API v1]  [Backend API v2]  // Same files!
```

### Parallel Budget

When running parallel loops:
- Total budget = sum of individual budgets
- Monitor combined burn rate
- Set combined warning threshold

---

## Emergency Procedures

### Budget Exceeded

1. Pause all non-critical loops
2. Review what caused overrun
3. Decide: add budget or descope
4. Document for future estimation

### Loop Stuck

1. Check iteration count vs max
2. Look for `<blocker>` tags
3. Escalate per escalation matrix
4. Consider: reset or manual intervention

### Resource Contention

1. Identify conflicting loops
2. Pause lower priority
3. Complete higher priority
4. Resume lower priority

---

## Best Practices

### Do

- Estimate before starting
- Track actual vs estimated
- Leave 20% buffer
- Complete current work before starting new
- Review costs after each sprint

### Don't

- Run unlimited iterations
- Ignore cost warnings
- Parallel conflicting tasks
- Skip verification steps
- Forget to track actuals

---

## Integration with Ralph Plan

Ralph Plan Mode automatically:
1. Estimates iterations per task
2. Calculates total sprint cost
3. Identifies parallelizable tasks
4. Sets appropriate max iterations
5. Generates budget tracking template

Use `/ralph-plan` for automatic resource planning.

---

*Last updated: 2026-01-22*
