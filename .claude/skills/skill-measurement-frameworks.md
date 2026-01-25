# Skill: Measurement Frameworks

## Purpose

Provide methodology for designing measurement systems, KPI hierarchies, and dashboards that drive data-informed decisions.

---

## Core Philosophy

> "What gets measured gets managed. What gets measured wrong gets managed wrong."

Effective measurement:
1. Aligns metrics to business outcomes
2. Distinguishes leading from lagging indicators
3. Creates actionable, not vanity, metrics
4. Enables decisions, not just reporting

---

## Metrics Hierarchy Framework

### The Pyramid Model

```
                    [North Star]
                   /            \
          [Primary Metrics (3-5)]
         /          |            \
    [Secondary Metrics (per primary)]
   /                |                \
[Health Metrics / Operational Metrics]
```

### Level Definitions

| Level | Purpose | Example |
|-------|---------|---------|
| **North Star** | Single metric capturing core value delivery | Monthly Active Users, Revenue, Transaction Volume |
| **Primary** | Key drivers of north star (3-5 max) | Activation rate, Retention rate, Monetization |
| **Secondary** | Decomposition of primaries | Day 1 retention, Day 7 retention, Day 30 retention |
| **Health** | Operational indicators | Uptime, Error rate, Load time |

### Selection Criteria

A good metric is:
- **Measurable**: Can be quantified consistently
- **Actionable**: Team can influence it
- **Relevant**: Connects to business outcomes
- **Timely**: Updates frequently enough to act on
- **Simple**: Easy to understand and communicate

---

## KPI Specification Template

```markdown
## KPI: [Metric Name]

### Definition
[Plain language description of what this measures]

### Calculation
[Formula or methodology]
Example: `(Users who completed action / Total users) * 100`

### Data Source
- System: [Where data comes from]
- Table/Event: [Specific source]
- Update frequency: [Real-time / Daily / Weekly]

### Segmentation
- By: [user type, geography, platform, etc.]
- Cohorts: [time-based groupings]

### Targets
| Timeframe | Target | Stretch |
|-----------|--------|---------|
| Q1 2026 | X% | Y% |
| Q2 2026 | X% | Y% |

### Thresholds
- Green: >= [value]
- Yellow: [range]
- Red: < [value]

### Owner
- Accountable: [Role/Person]
- Contributors: [Supporting roles]

### Review Cadence
- [Daily / Weekly / Monthly] in [meeting/report]

### Related Metrics
- Leading indicators: [metrics that predict this]
- Lagging indicators: [metrics this predicts]
```

---

## Leading vs Lagging Indicators

### Definitions

| Type | Definition | Example |
|------|------------|---------|
| **Leading** | Predicts future outcomes | Sign-ups, Feature adoption, NPS |
| **Lagging** | Measures past results | Revenue, Churn, LTV |

### The Balanced Approach

```
[Leading Indicators] → [Actions] → [Lagging Indicators]
     (predictive)      (lever)        (outcome)
```

Always pair:
- At least 1 leading indicator per lagging outcome
- Leading indicators should be actionable
- Validate leading-lagging correlation over time

---

## Dashboard Design Principles

### Information Hierarchy

1. **Hero Section**: North star + trend
2. **Primary Row**: 3-5 primary metrics with sparklines
3. **Detail Sections**: Drill-down by primary metric
4. **Health Footer**: Operational metrics

### Visual Guidelines

| Element | Purpose | Best Practice |
|---------|---------|---------------|
| **Big Number** | Current value | Include trend arrow |
| **Sparkline** | Trend at glance | 7-30 day window |
| **Bar Chart** | Comparison | Max 7 categories |
| **Line Chart** | Time series | Max 3 lines |
| **Table** | Detail view | Sortable, filterable |

### Context Requirements

Every metric should show:
- Current value
- Comparison (vs target, vs prior period)
- Trend direction
- Status indicator (green/yellow/red)

### Anti-Patterns

- **Dashboard overload**: >10 metrics per view
- **No context**: Numbers without comparison
- **Stale data**: No timestamp or refresh indicator
- **Vanity metrics**: Metrics that only go up
- **Action gap**: No path from insight to action

---

## Measurement Framework Document Structure

```markdown
# Measurement Framework: [Product/Feature]

## Business Objectives
1. [Objective 1]
2. [Objective 2]

## Metrics Hierarchy

### North Star
- Metric: [name]
- Definition: [what it measures]
- Target: [goal]

### Primary Metrics
| Metric | Definition | Target | Owner |
|--------|------------|--------|-------|
| [name] | [definition] | [target] | [owner] |

### Secondary Metrics
[Grouped by primary metric parent]

### Health Metrics
| Metric | Threshold | Alert |
|--------|-----------|-------|
| [name] | [value] | [condition] |

## Data Collection Requirements
- Events to instrument
- Data sources needed
- Pipeline requirements

## Dashboard Specification
- Views needed
- User personas
- Wireframes

## Implementation Roadmap
1. [Phase 1: Core metrics]
2. [Phase 2: Advanced metrics]
3. [Phase 3: Automation]
```

---

## Common Metric Categories

### Acquisition
- Traffic sources
- Sign-up rate
- Cost per acquisition (CPA)
- Channel efficiency

### Activation
- Onboarding completion
- Time to first value
- Feature adoption
- Activation rate

### Retention
- Day 1/7/30 retention
- Churn rate
- Cohort retention curves
- Reactivation rate

### Revenue
- ARPU / ARPA
- LTV
- Conversion rate
- Revenue per segment

### Engagement
- DAU/MAU ratio
- Session frequency
- Feature usage
- Time in app

---

## Experimentation Metrics

### A/B Test Framework

```markdown
## Experiment: [Name]

### Hypothesis
If [change], then [outcome], because [reasoning].

### Primary Metric
- Metric: [name]
- MDE (Minimum Detectable Effect): [%]
- Expected direction: [increase/decrease]

### Secondary Metrics
- [Metric 1] - expect [direction]
- [Metric 2] - expect [direction]

### Guardrail Metrics
- [Metric that should NOT change significantly]

### Sample Size
- Required: [N]
- Duration: [days]

### Decision Criteria
- Ship if: Primary metric >= MDE AND guardrails hold
- Iterate if: Inconclusive
- Kill if: Negative impact on guardrails
```

---

## Data Quality Checklist

- [ ] Metric definition is unambiguous
- [ ] Calculation is documented and reproducible
- [ ] Data source is reliable and accessible
- [ ] Historical data is available for trending
- [ ] Edge cases are handled (nulls, zeros, outliers)
- [ ] Metric is validated against known values
- [ ] Update frequency is documented
- [ ] Ownership is assigned

---

## Application

This skill is used by:
- `@analytics-strategist` for measurement framework design
- `@growth-engineer` for growth metrics
- `@product-manager` for product success metrics
- `@business-strategist` for business KPIs

Reference this skill when:
- Defining success metrics for a feature
- Designing dashboards
- Setting up A/B test metrics
- Creating KPI hierarchies
- Building measurement frameworks

---

*Last updated: 2026-01-22*
