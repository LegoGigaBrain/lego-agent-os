# growth-review

You are running the **Growth Review** workflow in LEGO Agent OS.

Goal:
Analyze current growth systems, identify bottlenecks, and design improvements for sustainable user acquisition and retention. This workflow produces a growth assessment with actionable recommendations.

Primary Agent:
- @growth-engineer

Supporting Agents:
- @marketing-strategist (for channel and campaign strategy)
- @vibe-marketer (for content optimization)

Skills:
- Growth Loops
- Channel Strategy
- Go-to-Market Strategy
- Campaign Architecture

Standards:
- `standards/signalos/transmission-framework.md`
- `standards/signalos/vibe-marketing.md`
- `standards/signalos/tribe-building.md`

---

## Steps

### 1. Scope the Review

Determine what aspect of growth to analyze:

| Review Type | Focus | Output |
|-------------|-------|--------|
| **Full Assessment** | Complete growth system | Comprehensive analysis |
| **Loop Audit** | Specific growth loop | Loop optimization plan |
| **Channel Review** | Channel performance | Channel reallocation |
| **Funnel Analysis** | Conversion bottlenecks | Optimization roadmap |
| **Retention Deep-Dive** | Churn and engagement | Retention playbook |

Ask:
- What growth challenge are we addressing?
- What data is available?
- What's the current growth rate?
- What have we tried already?
- What resources are available for improvements?

---

### 2. Current State Assessment

**Goal:** Understand the existing growth system

#### 2a. Growth Motion Audit
```
CURRENT GTM MOTION: [Product-led/Sales-led/Marketing-led/etc.]

PRIMARY ACQUISITION CHANNELS:
- [Channel 1]: [Volume + Performance]
- [Channel 2]: [Volume + Performance]

PRIMARY GROWTH LOOPS:
- [Loop 1]: [Description + Health]
- [Loop 2]: [Description + Health]

CURRENT METRICS:
- CAC: [Amount]
- LTV: [Amount]
- LTV:CAC: [Ratio]
- Payback: [Months]
- Growth Rate: [%/Month]
```

#### 2b. Funnel Mapping
Map the complete customer journey:
```
STAGE: AWARENESS
- Volume: [Number]
- Sources: [Where they come from]
- Drop-off: [% lost]

STAGE: CONSIDERATION
- Volume: [Number]
- Actions: [What they do]
- Drop-off: [% lost]

STAGE: CONVERSION
- Volume: [Number]
- Conversion rate: [%]
- Time to convert: [Duration]

STAGE: ACTIVATION
- Volume: [Number]
- Activation rate: [%]
- Time to value: [Duration]

STAGE: RETENTION
- D7/D30/D90: [Retention %]
- Engagement: [Frequency]
- Churn: [%/Month]
```

#### 2c. Channel Performance
For each active channel:
```
CHANNEL: [Name]
INVESTMENT: [Spend or effort level]
VOLUME: [Traffic/Leads/Users]
CONVERSION: [Rate at each stage]
CAC: [Channel-specific CAC]
QUALITY: [Retention/LTV of cohort]
TREND: [Improving/Stable/Declining]
```

---

### 3. Bottleneck Identification

**Goal:** Find the constraints limiting growth

#### 3a. Quantitative Analysis
Look for:
- Biggest drop-off points in funnel
- Channels with declining performance
- Cohorts with poor retention
- High CAC segments
- Slow payback periods

#### 3b. Qualitative Analysis
Consider:
- User feedback on friction points
- Competitive pressure
- Market changes
- Resource constraints
- Technical limitations

#### 3c. Bottleneck Prioritization
```
BOTTLENECK: [Description]
IMPACT: [High/Medium/Low]
EVIDENCE: [Data supporting this]
ROOT CAUSE: [Why it exists]
DIFFICULTY: [Easy/Medium/Hard to fix]
PRIORITY: [Calculated priority]
```

---

### 4. Growth Loop Analysis

**Goal:** Evaluate and optimize growth loops

#### 4a. Existing Loop Audit
For each growth loop:
```
LOOP NAME: [Name]
LOOP TYPE: [Viral/Content/Product/Paid/Community]

CURRENT PERFORMANCE:
- K-factor: [Number]
- Cycle time: [Duration]
- Loop completion rate: [%]
- Contribution to growth: [% of new users]

FRICTION POINTS:
- [Stage]: [Friction + Impact]

STRENGTHS:
- [What's working]

WEAKNESSES:
- [What's not working]

OPTIMIZATION OPPORTUNITIES:
- [Improvement]: [Expected impact]
```

#### 4b. Missing Loop Opportunities
Identify loops that could exist but don't:
```
POTENTIAL LOOP: [Name]
TYPE: [Loop type]
MECHANISM: [How it would work]
EXPECTED IMPACT: [Potential contribution]
REQUIREMENTS: [What's needed to build]
PRIORITY: [Based on impact/effort]
```

---

### 5. Recommendations

**Goal:** Provide actionable improvement plan

#### 5a. Quick Wins
Improvements achievable in 1-2 weeks:
```
QUICK WIN: [Description]
BOTTLENECK ADDRESSED: [What it fixes]
EXPECTED IMPACT: [Metric improvement]
EFFORT: [Low]
OWNER: [Who implements]
```

#### 5b. Medium-Term Improvements
Improvements for 1-3 month horizon:
```
IMPROVEMENT: [Description]
BOTTLENECK ADDRESSED: [What it fixes]
EXPECTED IMPACT: [Metric improvement]
DEPENDENCIES: [What's needed first]
RESOURCES: [What's required]
```

#### 5c. Strategic Initiatives
Major investments for 3-6+ months:
```
INITIATIVE: [Description]
STRATEGIC VALUE: [Why this matters]
EXPECTED IMPACT: [Transformation expected]
INVESTMENT: [Resources required]
RISKS: [What could go wrong]
```

---

### 6. Experimentation Plan

**Goal:** Design tests to validate improvements

For each key hypothesis:
```
EXPERIMENT: [Name]

HYPOTHESIS:
If we [change], then [outcome] because [rationale].

METRICS:
- Primary: [What we're measuring]
- Secondary: [Supporting metrics]

DESIGN:
- Control: [Current state]
- Variant: [Change being tested]
- Sample size: [Required N]
- Duration: [Time needed]

SUCCESS CRITERIA:
[Metric] improves by [X%] with [confidence]

RISKS & MITIGATIONS:
[What could go wrong + prevention]
```

---

### 7. Metrics & Monitoring

**Goal:** Define ongoing measurement

#### 7a. North Star Metric
```
NORTH STAR: [Single metric that captures value]
DEFINITION: [How it's calculated]
CURRENT: [Baseline]
TARGET: [Goal]
INPUTS: [Metrics that drive it]
```

#### 7b. Growth Dashboard
Key metrics to monitor:
```
ACQUISITION:
- [Metric]: [Current] → [Target]

ACTIVATION:
- [Metric]: [Current] → [Target]

RETENTION:
- [Metric]: [Current] → [Target]

REVENUE:
- [Metric]: [Current] → [Target]

REFERRAL:
- [Metric]: [Current] → [Target]
```

#### 7c. Health Checks
Early warning indicators:
```
LEADING INDICATOR: [Metric]
HEALTHY RANGE: [Numbers]
WARNING THRESHOLD: [When to act]
ACTION: [What to do if triggered]
```

---

### 8. Output Deliverables

Produce the Growth Review Document:

```markdown
# Growth Review: [Product/Company]

## Executive Summary
[2-3 sentences on growth health and key findings]

GROWTH RATE: [Current]
BIGGEST BOTTLENECK: [Primary constraint]
TOP RECOMMENDATION: [Highest priority action]

## Current State

### Growth Motion
[Description of how growth currently works]

### Key Metrics
| Metric | Current | Benchmark | Status |
|--------|---------|-----------|--------|
| [Metric] | [Value] | [Target] | [Health] |

### Funnel Performance
[Funnel visualization or description]

### Channel Performance
[Channel breakdown]

### Growth Loop Health
[Loop assessment]

## Findings

### Bottlenecks Identified
1. [Bottleneck 1]: [Description + Evidence]
2. [Bottleneck 2]: [Description + Evidence]
3. [Bottleneck 3]: [Description + Evidence]

### Root Causes
[Analysis of why bottlenecks exist]

### Opportunities
[Untapped potential identified]

## Recommendations

### Quick Wins (1-2 weeks)
1. [Action]: [Expected impact]
2. [Action]: [Expected impact]

### Medium-Term (1-3 months)
1. [Action]: [Expected impact]
2. [Action]: [Expected impact]

### Strategic (3-6+ months)
1. [Initiative]: [Expected impact]

## Experimentation Roadmap

### Priority Experiments
| Experiment | Hypothesis | Metric | Duration |
|------------|------------|--------|----------|
| [Name] | [Hypothesis] | [Primary] | [Time] |

## Metrics & Monitoring

### North Star
[Metric + rationale]

### Key Metrics to Track
[List with targets]

### Health Checks
[Early warning indicators]

## Next Steps

### Immediate (This Week)
- [ ] [Action]
- [ ] [Action]

### Short-Term (This Month)
- [ ] [Action]
- [ ] [Action]

### Ongoing
- [ ] [Monitoring activity]
```

---

## Quality Checklist

Before finalizing:

**Analysis Quality**
- [ ] Data is current and accurate
- [ ] Bottlenecks are evidence-based
- [ ] Root causes identified, not just symptoms
- [ ] Competitive context considered

**Recommendation Quality**
- [ ] Actions are specific and actionable
- [ ] Impact estimates are realistic
- [ ] Resources required are clear
- [ ] Priorities are justified

**Alignment Quality**
- [ ] Recommendations align with brand signal
- [ ] Growth motions fit company stage
- [ ] Sustainable, not just hacks

**Execution Quality**
- [ ] Clear ownership for each action
- [ ] Experiments are well-designed
- [ ] Metrics are measurable
- [ ] Review cadence established

---

## Handoff Guidance

After completing growth review:

**Marketing Strategist**
- Channel reallocation recommendations
- Campaign optimization priorities

**Vibe Marketing**
- Content experiments to run
- Platform-specific optimizations

**Product Team**
- Activation improvements
- Product loop opportunities

**Analytics/Data**
- Tracking requirements
- Dashboard setup
