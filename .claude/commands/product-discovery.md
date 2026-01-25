# product-discovery

You are running the **Product Discovery** workflow in LEGO Agent OS.

Goal:
Facilitate a structured product ideation session with a founder to clarify their product idea before brand development. This workflow produces a Product Ideation Brief through guided conversation — NOT product decisions or feature design.

Primary Agent:
- @ideation-facilitator

Supporting Agents:
- @user-researcher (if problem/solution needs customer validation)
- @research-analyst (if market context needed)
- @senior-architect (if technical feasibility unclear)
- @business-strategist (if business model unclear)

Skills:
- Product Ideation (5-phase discovery methodology)

Standards:
- `standards/signalos/brand-strategy.md`

---

## Overview

Product Discovery is the **first step** before brand work. It surfaces problem, solution, market fit, feasibility, and vision through structured conversation — creating clarity on what's being built before articulating what the brand is.

### When to Use This Command

| Use `/product-discovery` When | Use Something Else When |
|-------------------------------|------------------------|
| You have a product idea but need to clarify it | Product is clear → `/brand-discovery` |
| You're not sure if the problem is real | You have brand strategy → `/brand-strategy` |
| You want to stress-test assumptions before building | You need to validate with users → work with @user-researcher |
| You need structured discovery before brand work | You have a defined product → go directly to brand |

### What This Produces

This workflow outputs:

**`product/product-ideation-brief.md`**

A comprehensive discovery document containing:
- Executive Summary
- Problem Space (statement, who, alternatives, severity, timing)
- Solution Hypothesis (statement, insight, MVP, features)
- Market Assessment (size, customer, channels, competition, differentiation)
- Feasibility (technical, resources, advantage, risks, validation)
- Vision (5-year, motivation, ambition, north star)
- Assessment (strengths, concerns, open questions)
- Recommended Path

---

## The 5 Discovery Phases

The @ideation-facilitator will guide you through:

### Phase 1: Problem Space
- What problem you're solving
- Who experiences it most acutely
- How people currently cope or solve it
- Why this problem matters now

### Phase 2: Solution Exploration
- Your proposed solution
- How it differs from alternatives
- Core insight or innovation
- Minimum viable version

### Phase 3: Market Fit
- Market size and opportunity
- Ideal first customers
- Competitive landscape
- Why customers choose you

### Phase 4: Feasibility
- Technical requirements
- Resources and capabilities
- Key risks and assumptions
- What to test first

### Phase 5: Vision
- Long-term vision
- Personal motivation
- Ambition level (feature/product/company)
- What success looks like

---

## Output Location

All discovery session outputs are saved to:

```
product/product-ideation-brief.md
```

---

## Success Criteria

Before concluding, verify the discovery session has:

- [ ] Captured a clear, specific problem statement
- [ ] Defined target user (not "everyone")
- [ ] Identified current alternatives and how people cope
- [ ] Articulated solution and its differentiation
- [ ] Defined MVP scope (essential vs nice-to-have)
- [ ] Assessed market opportunity and competition
- [ ] Documented key risks and assumptions
- [ ] Identified riskiest assumption with validation approach
- [ ] Captured vision and founder motivation
- [ ] Determined recommended path based on discoveries

---

## Handoff Recommendations

After discovery is complete, the @ideation-facilitator will recommend next steps:

| Discovery Result | Recommended Handoff |
|------------------|---------------------|
| Product concept clear, ready for brand | `/brand-discovery` via @brand-facilitator |
| Problem needs customer validation | @user-researcher |
| Solution needs customer validation | @user-researcher |
| Market unclear | `/market-research` via @research-analyst |
| Technical feasibility unclear | @senior-architect |
| Business model unclear | @business-strategist |
| Ready to plan and build | @product-manager |

---

## Important Notes

### What Product Discovery Is
- A structured conversation to clarify your product idea
- An opportunity to stress-test assumptions early
- Documentation of problem, solution, and market thinking
- Raw material for brand discovery (not brand work itself)

### What Product Discovery Is NOT
- Product decision-making or feature prioritization
- Customer validation or user research
- Technical architecture or prototyping
- Brand development (that comes after product clarity)
- A replacement for proper market research

The discovery brief produced here becomes input for brand workflows like `/brand-discovery` or execution workflows with @product-manager.

---

## Agents Involved

| Agent | Role |
|-------|------|
| @ideation-facilitator | Primary — conducts product discovery interview |
| @user-researcher | Support — validates problem/solution with customers |
| @research-analyst | Support — provides market context |
| @senior-architect | Support — assesses technical feasibility |
| @business-strategist | Support — develops business model |

---

## Getting Started

When you run `/product-discovery`, the @ideation-facilitator will:

1. **Open the Session** — Explain the purpose and set expectations
2. **Guide Discovery** — Walk through all 5 phases with you
3. **Challenge Assumptions** — Probe gently to surface risks and unknowns
4. **Synthesize** — Compile discoveries into the brief format
5. **Recommend Next Steps** — Point you to appropriate next workflows

Be prepared to examine your assumptions about the problem, solution, market, and feasibility. There are no wrong answers — this is about achieving clarity before building or branding.
