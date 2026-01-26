# brand-discovery

You are running the **Brand Discovery** workflow in LEGO Agent OS.

Goal:
Facilitate a structured brand discovery session with a founder to uncover brand foundations. This workflow produces a Brand Discovery Brief through guided conversation — NOT brand strategy execution.

Primary Agent:
- @brand-facilitator

Supporting Agents:
- @ideation-facilitator (if product needs clarification first)
- @user-researcher (if customer understanding needs depth)
- @research-analyst (if market context needed)

Skills:
- Brand Facilitation (6-phase discovery methodology)

Standards:
- `standards/signalos/brand-strategy.md`

---

## Overview

Brand Discovery is the **first step** before brand strategy. It surfaces what already exists in the founder's mind through structured conversation rather than making strategic decisions.

### When to Use This Command

| Use `/brand-discovery` When | Use Something Else When |
|-----------------------------|------------------------|
| You know your product but need to articulate the brand | Product/idea is unclear → `/product-discovery` |
| You're starting brand work from scratch | You have brand strategy → `/brand-strategy` |
| You want help articulating what you already know | You need market research → `/market-research` |
| You need structured discovery before strategy | You need naming → `/naming` |

### What This Produces

This workflow outputs:

**`brand/brand-discovery-brief.md`**

A comprehensive discovery document containing:
- Executive Summary
- Origin Story
- Positioning Elements (Audience, Category, Benefits, Support)
- Purpose (Values, Purpose, Vision, Mission, Goals)
- Customer Design (Transformation, not just demographics)
- Onliness Statement (draft or gaps documented)
- Brand Commitment Matrix (I AM + POV alignment)
- Gaps & Open Questions
- Recommended Next Steps

---

## The 6 Discovery Phases

The @brand-facilitator will guide you through:

### Phase 1: Origin & Context
- Founding story and motivations
- Problem you're solving
- Competitive landscape
- Relevant trends

### Phase 2: Positioning
- Target audience
- Category definition
- Key benefits and proof points
- Differentiation

### Phase 3: Purpose (VPVMG)
- Values — What you stand for
- Purpose — Why you exist beyond profit
- Vision — What the future looks like
- Mission — How you'll get there
- Goals — Measurable milestones

### Phase 4: Customer Design
- Who your customers are today
- Who they BECOME through your brand
- The transformation journey

### Phase 5: Onliness Statement
- What makes you the ONLY one
- Category you're claiming
- Differentiation defense

### Phase 6: Brand Commitment Matrix
- Customer I AM (Identity, Aims, Mores)
- Company POV (Purpose, Onliness, Values)
- Alignment assessment

---

## Output Location

All discovery session outputs are saved to:

```
brand/brand-discovery-brief.md
```

---

## Success Criteria

Before concluding, verify the discovery session has:

- [ ] Captured the founding story with motivations
- [ ] Defined positioning elements (audience, category, benefits, support)
- [ ] Articulated all VPVMG components (Values, Purpose, Vision, Mission, Goals)
- [ ] Documented customer transformation (not just demographics)
- [ ] Drafted or documented gaps in Onliness Statement
- [ ] Completed Brand Commitment Matrix with alignment notes
- [ ] Honestly documented gaps and open questions
- [ ] Preserved founder's exact language where possible
- [ ] Identified recommended next steps and handoffs

---

## Handoff Recommendations

After discovery is complete, the @brand-facilitator will recommend next steps:

| Discovery Result | Recommended Handoff |
|------------------|---------------------|
| Complete discovery, ready for strategy | `/brand-strategy` via @brand-strategist |
| Voice and tone needed | `/verbal-identity` via @verbal-identity-designer |
| Visual direction needed | `/visual-identity` via @visual-designer |
| Product/offering unclear | `/product-discovery` via @ideation-facilitator |
| Customer needs more depth | @user-researcher |
| Market context needed | `/market-research` via @research-analyst |

---

## Important Notes

### What Brand Discovery Is
- A structured conversation to surface what you already know
- An opportunity to articulate your beliefs and vision
- Documentation of your founder truth
- Raw material for strategy (not strategy itself)

### What Brand Discovery Is NOT
- Strategic decision-making
- Brand naming or tagline creation
- Visual identity development
- Marketing execution
- A replacement for proper brand strategy

The discovery brief produced here becomes input for execution workflows like `/brand-strategy` and `/verbal-identity`.

---

## Agents Involved

| Agent | Role |
|-------|------|
| @brand-facilitator | Primary — conducts discovery interview |
| @ideation-facilitator | Support — handles product clarity if needed |
| @user-researcher | Support — deepens customer understanding |
| @research-analyst | Support — provides market context |

---

## Getting Started

When you run `/brand-discovery`, the @brand-facilitator will:

1. **Open the Session** — Explain the process and set expectations
2. **Guide Discovery** — Walk through all 6 phases with you
3. **Capture Your Words** — Document your exact language and insights
4. **Synthesize** — Compile discoveries into the brief format
5. **Recommend Next Steps** — Point you to appropriate execution workflows

Be prepared to reflect on your founding story, your beliefs, your customers, and what makes you different. There are no wrong answers — this is about articulating what you already know.
