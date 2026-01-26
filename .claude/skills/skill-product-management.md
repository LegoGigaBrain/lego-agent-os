# Skill: Product Management

## Purpose

Provide methodology for product strategy, requirements definition, prioritization, and roadmap planning.

---

## Core Philosophy

> "The job of a product manager is to discover a product that is valuable, usable, and feasible." - Marty Cagan

Effective product management:
1. Starts with problems, not solutions
2. Prioritizes ruthlessly based on impact
3. Writes clear specs that enable autonomous execution
4. Measures outcomes, not outputs

---

## Product Strategy Framework

### Strategy Stack

```
VISION (5+ years)
  "Why we exist, where we're going"
        ↓
STRATEGY (1-3 years)
  "How we'll win"
        ↓
ROADMAP (Quarters)
  "What we'll build when"
        ↓
BACKLOG (Sprints)
  "What we're building now"
```

### Strategy Components

| Component | Question | Output |
|-----------|----------|--------|
| **Vision** | What world are we creating? | Vision statement |
| **Mission** | What do we do to get there? | Mission statement |
| **Strategy** | How will we win? | Strategic pillars |
| **Goals** | What outcomes define success? | OKRs / KPIs |
| **Roadmap** | What capabilities when? | Roadmap |

---

## PRD (Product Requirements Document) Template

```markdown
# PRD: [Feature Name]

## Overview

### Problem Statement
[What problem are we solving? For whom? Why now?]

### Goals
- [Measurable objective 1]
- [Measurable objective 2]

### Non-Goals (Explicit Scope Limits)
- [What we're NOT doing]
- [Adjacent problems we're NOT solving]

### Success Metrics
| Metric | Current | Target | Measurement |
|--------|---------|--------|-------------|
| [KPI] | [baseline] | [goal] | [how measured] |

---

## User Stories

### Primary User: [Persona Name]
As a [user type], I want [capability], so that [benefit].

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]

### Secondary User: [Persona Name]
[Same format]

---

## Requirements

### Functional Requirements

#### [Feature Area 1]
| ID | Requirement | Priority | Notes |
|----|-------------|----------|-------|
| FR-1 | [Requirement] | Must | [Context] |
| FR-2 | [Requirement] | Should | [Context] |
| FR-3 | [Requirement] | Could | [Context] |

#### [Feature Area 2]
[Same format]

### Non-Functional Requirements
| Category | Requirement |
|----------|-------------|
| Performance | [e.g., Page load < 2s] |
| Security | [e.g., Data encrypted at rest] |
| Scalability | [e.g., Support 10K concurrent users] |
| Accessibility | [e.g., WCAG 2.1 AA] |

---

## User Flow

[Diagram or step-by-step flow]

1. User lands on [page]
2. User clicks [element]
3. System shows [response]
4. ...

---

## Design Considerations

### UX Requirements
- [Specific UX constraint or requirement]

### Edge Cases
| Scenario | Expected Behavior |
|----------|-------------------|
| [Edge case] | [How to handle] |

### Error States
| Error | User Message | Recovery |
|-------|--------------|----------|
| [Condition] | [Message] | [Action] |

---

## Technical Considerations

### Dependencies
- [External service/API]
- [Internal system]

### Constraints
- [Technical limitation]
- [Timeline constraint]

### Open Questions
- [ ] [Question for engineering]
- [ ] [Question for design]

---

## Launch Plan

### Rollout Strategy
- [ ] Internal testing
- [ ] Beta (X% of users)
- [ ] General availability

### Feature Flags
- Flag name: [name]
- Default: [on/off]

### Monitoring
- Alerts for: [conditions]
- Dashboard: [link]

---

## Timeline

| Milestone | Date | Status |
|-----------|------|--------|
| Spec complete | [date] | [status] |
| Design complete | [date] | [status] |
| Dev complete | [date] | [status] |
| QA complete | [date] | [status] |
| Launch | [date] | [status] |

---

## Appendix

### Research References
- [Link to user research]
- [Link to competitive analysis]

### Related Documents
- [Design spec]
- [Technical spec]
```

---

## Prioritization Frameworks

### RICE Scoring

| Factor | Definition | Scale |
|--------|------------|-------|
| **Reach** | Users impacted per quarter | Actual number |
| **Impact** | Effect on each user | 3=massive, 2=high, 1=medium, 0.5=low, 0.25=minimal |
| **Confidence** | Certainty of estimates | 100%=high, 80%=medium, 50%=low |
| **Effort** | Person-months | Actual estimate |

**Score = (Reach x Impact x Confidence) / Effort**

### ICE Scoring

| Factor | Definition | Scale |
|--------|------------|-------|
| **Impact** | Effect if successful | 1-10 |
| **Confidence** | Likelihood of success | 1-10 |
| **Ease** | Ease of implementation | 1-10 |

**Score = Impact x Confidence x Ease**

### MoSCoW Prioritization

| Category | Definition | Guideline |
|----------|------------|-----------|
| **Must** | Non-negotiable for launch | ~60% of effort |
| **Should** | Important but not critical | ~20% of effort |
| **Could** | Nice to have | ~20% of effort |
| **Won't** | Out of scope this time | Documented |

### Value vs Effort Matrix

```
         HIGH VALUE
              |
    Quick     |    Big Bets
    Wins      |    (Plan carefully)
--------------+---------------
    Fill-ins  |    Money Pit
    (Maybe)   |    (Avoid)
              |
         LOW VALUE
    LOW EFFORT -------- HIGH EFFORT
```

---

## Roadmap Planning

### Roadmap Formats

| Format | Best For | Shows |
|--------|----------|-------|
| **Timeline** | Predictable work | Dates, dependencies |
| **Now/Next/Later** | Uncertain timelines | Priorities, not dates |
| **Theme-based** | Strategic alignment | Goals, not features |
| **Kanban** | Continuous delivery | Work in progress |

### Now/Next/Later Template

```markdown
# Product Roadmap

## Now (This Quarter)
Committed work in progress

| Initiative | Goal | Status |
|------------|------|--------|
| [Feature] | [Outcome] | [%] |

## Next (Next Quarter)
High-confidence upcoming work

| Initiative | Goal | Dependencies |
|------------|------|--------------|
| [Feature] | [Outcome] | [Blockers] |

## Later (Future)
Directional, subject to change

| Initiative | Goal | Open Questions |
|------------|------|----------------|
| [Feature] | [Outcome] | [Unknowns] |

## Not Doing
Explicitly deprioritized

| Initiative | Reason |
|------------|--------|
| [Feature] | [Why not] |
```

---

## Stakeholder Communication

### Status Update Template

```markdown
# [Product/Feature] Status Update - [Date]

## TL;DR
[One sentence summary]

## Progress
- [x] [Completed item]
- [~] [In progress item]
- [ ] [Upcoming item]

## Metrics
| Metric | Last Period | This Period | Target |
|--------|-------------|-------------|--------|
| [KPI] | [value] | [value] | [goal] |

## Risks & Blockers
| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk] | [H/M/L] | [Action] |

## Decisions Needed
- [ ] [Decision] - needed by [date]

## Next Week
- [Plan item 1]
- [Plan item 2]
```

---

## Feature Sizing

| Size | Characteristics | Duration |
|------|-----------------|----------|
| **XS** | Single component, no dependencies | Hours |
| **S** | Single module, minimal dependencies | 1-3 days |
| **M** | Multiple modules, some dependencies | 1-2 weeks |
| **L** | Cross-functional, significant dependencies | 2-4 weeks |
| **XL** | Epic - break down further | 4+ weeks |

### Sizing Questions

1. How many systems/services are touched?
2. How many people need to be involved?
3. Are there external dependencies?
4. How much is unknown?
5. What's the testing complexity?

---

## Decision Documentation

### ADR (Architecture Decision Record) Template

```markdown
# ADR-[Number]: [Title]

## Status
[Proposed / Accepted / Deprecated / Superseded]

## Context
[What is the issue that we're seeing that is motivating this decision?]

## Decision
[What is the change that we're proposing and/or doing?]

## Consequences
### Positive
- [Benefit 1]
- [Benefit 2]

### Negative
- [Tradeoff 1]
- [Tradeoff 2]

### Neutral
- [Side effect]

## Alternatives Considered
| Option | Pros | Cons | Why Not |
|--------|------|------|---------|
| [Alt 1] | [+] | [-] | [Reason] |
| [Alt 2] | [+] | [-] | [Reason] |
```

---

## Common Anti-Patterns

| Anti-Pattern | Problem | Solution |
|--------------|---------|----------|
| **Feature factory** | Building without validating | Validate before building |
| **HiPPO** | Highest-paid person decides | Use data and frameworks |
| **Scope creep** | Requirements grow unchecked | Explicit non-goals, change control |
| **Vague specs** | "Make it better" | Specific, testable requirements |
| **Output focus** | Shipped features vs outcomes | Define success metrics |
| **Analysis paralysis** | Over-researching | Time-box research, decide |

---

## Application

This skill is used by:
- `@product-manager` for all product work
- `@ux-product-strategist` for feature planning
- `@senior-architect` for technical requirements
- `@business-strategist` for product strategy alignment

Reference this skill when:
- Writing PRDs or feature specs
- Prioritizing the backlog
- Planning roadmaps
- Making product decisions
- Communicating with stakeholders

---

*Last updated: 2026-01-22*
