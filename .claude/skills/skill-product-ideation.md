# Skill: Product Ideation

## Purpose

Guide founders through structured product discovery interviews to clarify their product idea before brand development. This skill defines the methodology for facilitating conversations that surface problem spaces, solution hypotheses, market fit, feasibility, and product vision - resulting in a comprehensive product ideation brief.

## Standards Awareness

Before applying this skill, ensure familiarity with:
- `standards/signalos/brand-strategy.md`
- `.claude/skills/skill-feature-idea-validator.md`
- `.claude/skills/skill-market-research.md`
- `.claude/skills/skill-business-strategy.md`

---

## Discovery Philosophy

### Clarify Before Building

The facilitator's role is to **ask and document**, not to build or prescribe. Great product ideation:
- Surfaces the core problem before jumping to solutions
- Tests assumptions through structured questioning
- Identifies unknowns and risks early
- Creates clarity on what needs validation

### Core Principle

**"The best products solve real problems. Our job is to help founders articulate the problem before they fall in love with a solution."**

---

## The 5 Discovery Phases

### Phase 1: Problem Space

**Purpose:** Deeply understand the problem being solved and who experiences it.

**Questions:**
- What problem are you trying to solve?
- Who experiences this problem most acutely?
- How do these people currently solve this problem (or cope without a solution)?
- How often do they encounter this problem?
- What is the cost of not solving this problem (time, money, frustration, missed opportunity)?
- How did you discover this problem? Personal experience? Observation? Research?
- Why hasn't this problem been solved well before?
- What makes this problem worth solving now?

**Capture:**
- Problem statement (one sentence)
- Problem severity assessment
- Current alternatives/workarounds
- Problem discovery origin story
- Timing factors

---

### Phase 2: Solution Exploration

**Purpose:** Explore the proposed solution and its differentiation.

**Questions:**
- What is your solution in one sentence?
- How does it solve the problem differently than existing alternatives?
- What is the core insight or innovation behind your approach?
- What does the solution look like to a user? Walk me through a typical use case.
- What is the minimum version that would still solve the core problem?
- What features are essential vs nice-to-have?
- What existing solutions or technologies are you building upon?
- What would success look like for a user of your product?

**Capture:**
- Solution statement (one sentence)
- Core insight/innovation
- User journey sketch
- MVP definition
- Feature prioritization (essential vs nice-to-have)

---

### Phase 3: Market Fit

**Purpose:** Assess the market opportunity and competitive landscape.

**Questions:**
- How big is the market of people with this problem?
- How would you describe your ideal first customers? Be specific.
- Where do these people gather (online and offline)?
- What are they currently paying for alternatives?
- Who are your direct competitors? Indirect competitors?
- Why would customers choose you over alternatives?
- What trends are making this market more attractive?
- Is this a vitamin (nice-to-have) or painkiller (must-have)?

**Capture:**
- Market size estimate (TAM, SAM, SOM if known)
- Ideal customer profile
- Customer acquisition channels
- Competitive landscape summary
- Differentiation factors
- Market timing factors

---

### Phase 4: Feasibility

**Purpose:** Assess the practical requirements and risks of building this product.

**Questions:**
- What technical capabilities are required to build this?
- Do you have access to these capabilities (team, tools, resources)?
- What is your unfair advantage (skills, access, insights)?
- What are the biggest risks to this project?
- What would need to be true for this to work?
- What assumptions are you making that you're least certain about?
- How would you test your riskiest assumption with minimal resources?
- What would prove you wrong? What would prove you right?

**Capture:**
- Technical requirements summary
- Resource assessment (team, tools, capital)
- Unfair advantage articulation
- Risk inventory
- Key assumptions list
- Validation experiment ideas

---

### Phase 5: Vision

**Purpose:** Establish the long-term vision and motivation.

**Questions:**
- If this succeeds wildly, what does the world look like in 5 years?
- What is your personal motivation for pursuing this?
- How does this connect to your skills, experiences, and passions?
- What legacy do you want this product to leave?
- What would you regret more: trying and failing, or never trying?
- Are you building a feature, a product, or a company?
- What is the 10x version of this idea?

**Capture:**
- Vision statement
- Founder motivation
- Founder-market fit assessment
- Ambition level (feature/product/company)
- North star articulation

---

## Output Format

### Product Ideation Brief

The output should be saved as `product/product-ideation-brief.md` with the following structure:

```markdown
# Product Ideation Brief

## Executive Summary
[2-3 sentence synthesis of the product opportunity]

## Problem Space
- **Problem Statement:** [one sentence]
- **Who Experiences It:** [target users]
- **Current Alternatives:** [how people solve it now]
- **Problem Severity:** [high/medium/low]
- **Why Now:** [timing factors]

## Solution Hypothesis
- **Solution Statement:** [one sentence]
- **Core Insight:** [the innovation]
- **MVP Definition:** [minimum viable product]
- **Essential Features:** [list]
- **Nice-to-Have Features:** [list]

## Market Assessment
- **Market Size:** [TAM/SAM/SOM or qualitative]
- **Ideal Customer:** [specific description]
- **Acquisition Channels:** [where to find them]
- **Competition:** [direct and indirect]
- **Differentiation:** [why you win]
- **Vitamin vs Painkiller:** [assessment]

## Feasibility
- **Technical Requirements:** [what's needed to build]
- **Resources Available:** [team, tools, capital]
- **Unfair Advantage:** [what you have that others don't]
- **Key Risks:** [biggest threats]
- **Riskiest Assumption:** [what to test first]
- **Validation Experiment:** [how to test it]

## Vision
- **5-Year Vision:** [what success looks like]
- **Founder Motivation:** [why you]
- **Ambition Level:** [feature/product/company]
- **North Star:** [guiding metric or outcome]

## Assessment

### Strengths
[List 3-5 strengths of this product idea]

### Concerns
[List 3-5 concerns or unknowns]

### Open Questions
[Questions that need answers before proceeding]

## Recommended Path

[Based on this discovery, recommend one of:]
- **Proceed to Brand Discovery:** Product is clear, ready for brand development
- **Conduct Customer Research:** Need to validate problem/solution with real users
- **Technical Validation:** Need to prove technical feasibility first
- **Market Research:** Need deeper competitive/market analysis
- **Pivot or Refine:** Significant concerns suggest revisiting the core idea

---
*Generated by LEGO Agent OS - Ideation Facilitator*
```

---

## Handoff Recommendations

Based on discovery outcomes, recommend handoffs to:

| Discovery Outcome | Recommended Handoff | Agent |
|-------------------|---------------------|-------|
| Product clarity achieved | Brand discovery | @brand-facilitator |
| Problem needs validation | Customer research | @user-researcher |
| Solution needs validation | Customer research | @user-researcher |
| Market unclear | Market research | @research-analyst |
| Technical questions | Technical assessment | @senior-architect |
| Business model unclear | Business strategy | @business-strategist |
| Ready to build | Product planning | @product-manager |

### Handoff Decision Tree

```
Is product concept clear and validated?
├── Yes, problem and solution are clear
│   ├── Has brand foundations → @brand-strategist
│   ├── Needs brand discovery first → @brand-facilitator
│   └── Ready to plan product → @product-manager
├── No, problem unclear
│   └── Needs customer research → @user-researcher
├── No, solution unclear
│   └── Needs technical validation → @senior-architect
├── No, market unclear
│   └── Needs market research → @research-analyst
└── No, business model unclear
    └── Needs business strategy → @business-strategist
```

---

## Session Best Practices

### Opening the Session
1. Explain the purpose: "We're going to clarify your product idea through structured questions"
2. Set expectations: "I'll ask questions to surface assumptions and risks - better to find them now"
3. Clarify scope: "This is about the product, not the brand. Brand comes after we know what we're building"

### During the Session
- Push back gently when solutions come before problems ("Let's stay with the problem a bit longer")
- Ask "why" repeatedly to get to root motivations
- Note when founders light up - passion signals commitment
- Challenge assumptions kindly ("What would need to be true for that to work?")
- Don't validate or invalidate - just capture and probe

### Closing the Session
1. Summarize the product concept as you understand it
2. Highlight the strongest points and biggest concerns
3. Identify the riskiest assumption to test
4. Explain handoff options based on findings
5. Acknowledge the courage it takes to examine ideas critically

---

## Red Flags to Surface

During discovery, gently surface these concerns if observed:

- **Solution-first thinking:** Founder can't articulate the problem clearly
- **Competitor blindness:** Unaware of or dismissive of alternatives
- **One-person market:** Problem only affects the founder
- **Feature, not product:** Idea is better as a feature of something else
- **Missing unfair advantage:** No clear reason why this founder should build this
- **Vitamin in a painkiller market:** Nice-to-have competing against must-haves
- **Timing issues:** Too early, too late, or dependent on external factors

Surface these respectfully - the goal is clarity, not discouragement.

---

## Quality Checklist

Before concluding discovery, verify:

- [ ] Problem statement is clear and specific
- [ ] Target user is defined (not "everyone")
- [ ] Current alternatives identified and understood
- [ ] Solution is differentiated from alternatives
- [ ] MVP scope is defined
- [ ] Market opportunity is articulated
- [ ] Key risks and assumptions are documented
- [ ] Riskiest assumption identified with validation approach
- [ ] Vision and motivation captured
- [ ] Handoff recommendation determined

---

## Agents Using This Skill

- **@ideation-facilitator** - Primary agent for product ideation interviews
- **@product-manager** - Reference for understanding product inputs
- **@brand-facilitator** - Receives handoffs when product is clear

---

## Related Skills

- `skill-feature-idea-validator.md` - Feature validation methodology
- `skill-market-research.md` - Market analysis frameworks
- `skill-business-strategy.md` - Business model thinking
- `skill-competitive-analysis.md` - Competitive landscape analysis
- `skill-brand-facilitation.md` - Brand discovery (comes after product)
