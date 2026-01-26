# gtm-strategy

You are running the **Go-to-Market Strategy** workflow in LEGO Agent OS.

Goal:
Develop a comprehensive go-to-market strategy for launching a product, feature, or brand to market. This workflow produces a complete GTM plan including market definition, positioning, channel strategy, and launch planning.

Primary Agent:
- @marketing-strategist

Supporting Agents:
- @growth-engineer (for growth loop design)
- @brand-strategist (for positioning alignment)
- @vibe-marketer (for content and channel execution)

Skills:
- Go-to-Market Strategy Framework
- Campaign Architecture
- Growth Loops
- Channel Strategy
- Tribe Building

Standards:
- `standards/signalos/transmission-framework.md`
- `standards/signalos/brand-strategy.md`
- `standards/signalos/vibe-marketing.md`

---

## Steps

### 1. Clarify GTM Context

Determine the scope and type of launch:

| GTM Type | Description | Typical Duration |
|----------|-------------|------------------|
| **Product Launch** | New product to market | 2-4 months prep |
| **Feature Launch** | New capability for existing product | 2-4 weeks prep |
| **Market Expansion** | Existing product to new market | 1-3 months prep |
| **Rebrand/Reposition** | New positioning for existing offering | 2-4 months prep |

Ask:
- What are we launching? (Product, feature, brand)
- What's the business objective?
- Who is the target customer?
- What's the timeline?
- What budget/resources are available?
- Is brand strategy already defined?

---

### 2. Market Definition

**Goal:** Establish clear market boundaries and opportunity

#### 2a. Problem Definition
```
PROBLEM STATEMENT:
[Target audience] struggles with [specific problem]
because [root cause].
This costs them [impact/pain].
```

Gather evidence:
- Customer research
- Competitive gaps
- Market trends

#### 2b. Solution Definition
```
SOLUTION STATEMENT:
[Product name] is a [category] that [key capability].
Unlike [alternative], we [key differentiator].
This enables [outcome].
```

#### 2c. Market Sizing
```
TAM (Total Addressable Market):
[Total market if everyone who could buy, did]

SAM (Serviceable Addressable Market):
[Portion we can realistically serve]

SOM (Serviceable Obtainable Market):
[Portion we can capture near-term]
```

---

### 3. Customer Definition

**Goal:** Define exactly who we're targeting

#### 3a. Ideal Customer Profile (ICP)
```
COMPANY CHARACTERISTICS:
- Industry:
- Size:
- Stage:
- Geography:
- Technology:

SITUATION TRIGGERS:
- [When they're ready to buy]

NOT A FIT:
- [Disqualifying characteristics]
```

#### 3b. Buyer Personas
For each key persona:
```
PERSONA: [Name/Title]

ROLE:
- Job title and function
- Decision-making role

PSYCHOGRAPHICS:
- Goals
- Challenges
- Motivations
- Fears

BUYING BEHAVIOR:
- Where they research
- Who influences them
- Objections they'll have
```

#### 3c. Buying Committee (B2B)
Map all stakeholders:
- Champion
- Influencer
- Decision-maker
- User
- Potential blockers

---

### 4. Positioning & Messaging

**Goal:** Craft compelling positioning aligned with brand signal

#### 4a. Verify Brand Foundation
Check if brand strategy exists:
- Is there an onliness statement?
- Is the archetype defined?
- Is the language stack available?

If not, invoke @brand-strategist for positioning work.

#### 4b. Positioning Statement
```
FOR [target customer]
WHO [statement of need]
[Product] IS A [category]
THAT [key benefit]
UNLIKE [alternative]
WE [primary differentiation]
```

#### 4c. Messaging Framework
```
TAGLINE: [5-7 words]
VALUE PROPOSITION: [One sentence]
KEY MESSAGES:
1. [Message]: [Proof point]
2. [Message]: [Proof point]
3. [Message]: [Proof point]

ELEVATOR PITCH: [30-second version]
```

#### 4d. Competitive Positioning
For each key competitor:
- Their position
- Our counter-position
- When they win
- When we win
- Battlecard talking points

---

### 5. GTM Motion Selection

**Goal:** Choose the right go-to-market motion

#### GTM Motion Options:

| Motion | Best For | Characteristics |
|--------|----------|-----------------|
| **Product-Led** | Self-serve products | Free tier, low-touch, viral |
| **Sales-Led** | Enterprise deals | High-touch, custom, longer cycles |
| **Marketing-Led** | SMB/Consumer | Content-driven, demand gen |
| **Community-Led** | Developer tools | Advocacy, word-of-mouth |
| **Partner-Led** | Platforms | Channel distribution |

Select motion based on:
- Product complexity
- Deal size
- Customer behavior
- Available resources

---

### 6. Channel Strategy

**Goal:** Select and prioritize marketing channels

Invoke @growth-engineer for:
- Channel evaluation matrix
- Budget allocation framework
- Funnel design

#### 6a. Channel Selection
Evaluate each channel on:
- Audience presence
- Signal fit
- Competition level
- Cost efficiency
- Time to impact

#### 6b. Channel Mix
```
PRIMARY CHANNELS (70% effort):
- [Channel]: [Role and rationale]

SECONDARY CHANNELS (20% effort):
- [Channel]: [Role and rationale]

EXPERIMENTAL (10% effort):
- [Channel]: [Hypothesis]
```

#### 6c. Funnel Design
Map customer journey:
- Awareness: [Channels + Content]
- Consideration: [Channels + Content]
- Decision: [Channels + Content]
- Retention: [Channels + Content]

---

### 7. Growth Systems

**Goal:** Design sustainable growth mechanics

Invoke @growth-engineer for:
- Growth loop identification
- Viral mechanics
- Retention systems

#### 7a. Growth Loop Design
Identify potential loops:
- Viral loops
- Content loops
- Product loops
- Community loops

#### 7b. Metrics Framework
Define key metrics:
- Acquisition: CAC, conversion rates
- Activation: Time to value, onboarding
- Retention: Cohort curves, churn
- Revenue: LTV, LTV:CAC
- Referral: K-factor, NPS

---

### 8. Launch Planning

**Goal:** Create detailed launch plan

#### 8a. Launch Type Selection
- Big Bang: Major new product
- Soft Launch: Testing and iteration
- Rolling: Phased expansion
- Feature: Incremental release

#### 8b. Launch Timeline
```
T-30: PREPARATION
- Messaging finalized
- Assets created
- Channels briefed
- Team trained

T-14: PRE-LAUNCH
- Teaser campaign
- Press/influencer outreach
- Waitlist activation

T-7: FINAL PREP
- QA everything
- Team standby
- Monitoring ready

T-0: LAUNCH DAY
- Coordinated release
- All channels live
- Real-time monitoring

T+7: POST-LAUNCH
- Performance review
- Optimization begins
- Sustain campaign
```

#### 8c. Success Metrics
```
Day 1: [Metric + Target]
Week 1: [Metric + Target]
Month 1: [Metric + Target]
Quarter 1: [Metric + Target]
```

---

### 9. Enablement

**Goal:** Prepare team for execution

#### 9a. Sales Enablement (if applicable)
- Pitch deck
- Demo script
- Objection handling
- Competitive battlecards
- ROI calculator
- Case studies

#### 9b. Marketing Enablement
- Campaign briefs
- Creative assets
- Content calendar
- Tracking setup

#### 9c. Support Enablement
- FAQ document
- Escalation paths
- Feedback collection

---

### 10. Output Deliverables

Produce the GTM Strategy Document:

```markdown
# [Product/Launch] Go-to-Market Strategy

## Executive Summary
[2-3 sentences on what we're launching and why]

LAUNCH DATE: [Date]
GTM MOTION: [Type]
PRIMARY METRIC: [What success looks like]

## Market & Customer

### Problem Statement
[Problem definition]

### Solution Statement
[Solution definition]

### Market Size
- TAM: [Amount]
- SAM: [Amount]
- SOM: [Amount]

### Ideal Customer Profile
[ICP summary]

### Key Personas
[Persona summaries]

## Positioning & Messaging

### Positioning Statement
[Positioning]

### Key Messages
1. [Message 1]
2. [Message 2]
3. [Message 3]

### Competitive Differentiation
[How we're different]

## GTM Strategy

### GTM Motion
[Selected motion + rationale]

### Channel Strategy
PRIMARY: [Channels]
SECONDARY: [Channels]
EXPERIMENTAL: [Channels]

### Growth Systems
[Key growth loops and mechanics]

## Launch Plan

### Timeline
[Key milestones]

### Phase 1: Pre-Launch
[Activities]

### Phase 2: Launch
[Activities]

### Phase 3: Sustain
[Activities]

## Metrics & Success Criteria

### Launch Metrics
[Day 1, Week 1, Month 1 targets]

### Ongoing Metrics
[What we'll track]

## Resources & Budget

### Budget Allocation
[By channel/activity]

### Team Requirements
[Who's involved]

### Dependencies
[What must be true]

## Risks & Mitigations
[Key risks and how we'll address]

## Next Steps
[Immediate actions]
```

---

## Quality Checklist

Before finalizing:

**Strategy Quality**
- [ ] Clear business objective
- [ ] Target customer well-defined
- [ ] Positioning is differentiated
- [ ] Channel selection justified

**Alignment Quality**
- [ ] Aligned with brand signal
- [ ] Consistent with brand voice
- [ ] Supports overall company goals

**Execution Quality**
- [ ] Timeline is realistic
- [ ] Resources are available
- [ ] Metrics are measurable
- [ ] Team is prepared

**Risk Assessment**
- [ ] Key risks identified
- [ ] Mitigations planned
- [ ] Contingencies ready

---

## Handoff Guidance

After completing GTM strategy:

**Vibe Marketing**
- Content calendar for launch
- Platform-specific briefs
- Rapid response guidelines

**Design**
- Creative brief for launch assets
- Visual direction for campaign

**Sales (if applicable)**
- Pitch deck and materials
- Training schedule
- Lead routing setup

**Product**
- Launch feature requirements
- Analytics implementation
- Support preparation
