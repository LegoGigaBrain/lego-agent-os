# Skill: Decision Framework

> 6 methods for making better decisions with AI assistance.

## Purpose

Not all decisions are equal. A social media post needs different rigor than a product pivot. This skill provides 6 decision-making methods matched to different scenarios, so you always use the right level of analysis.

**Core principle:** Match decision rigor to decision stakes.

---

## The 6 Decision Methods

```
┌─────────────────────────────────────────────────────────────────────────┐
│                       DECISION FRAMEWORK                                │
│                                                                         │
│   ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐        │
│   │  SPECIALIZED    │  │   AI PING       │  │ RECOMMENDATION  │        │
│   │    AGENTS       │  │     PONG        │  │    REQUEST      │        │
│   │                 │  │                 │  │                 │        │
│   │ Multiple expert │  │ Multi-model     │  │ "Just tell me   │        │
│   │ perspectives    │  │ validation      │  │  what to do"    │        │
│   └─────────────────┘  └─────────────────┘  └─────────────────┘        │
│                                                                         │
│   ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐        │
│   │  CONSTRAINT     │  │    MARKET       │  │  FUTURE SELF    │        │
│   │    FILTER       │  │   VALIDATION    │  │    CHECK        │        │
│   │                 │  │                 │  │                 │        │
│   │ "What can I     │  │ External data   │  │ Long-term       │        │
│   │  actually do?"  │  │ to validate     │  │ perspective     │        │
│   └─────────────────┘  └─────────────────┘  └─────────────────┘        │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Quick Reference Matrix

| Method | When to Use | Time Required | Best For |
|--------|-------------|---------------|----------|
| **Specialized Agents** | Too many options, need validation | 15-30 min | Creative decisions, strategy |
| **AI Ping Pong** | High-stakes, need external critique | 30-60 min | Content, important comms |
| **Recommendation Request** | Overwhelmed, need synthesis | 5-10 min | Quick decisions, tiebreakers |
| **Constraint Filter** | Prioritize by what's doable NOW | 10-15 min | Resource-limited situations |
| **Market Validation** | Positioning/messaging decisions | 30-60 min | Go-to-market, competitive |
| **Future Self Check** | Strategic long-term decisions | 15-20 min | Career, business direction |

---

## Method 1: Specialized Agents

> Spin up 3-5 task-based expert perspectives.

### When to Use
- Evaluating creative options (headlines, designs, angles)
- Strategy decisions with multiple valid approaches
- Need to stress-test an idea from different viewpoints
- Too close to the problem to see clearly

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│                  SPECIALIZED AGENTS                         │
│                                                             │
│   Your Decision/Options                                     │
│          │                                                  │
│          ├──► Agent 1: [Domain Expert]                      │
│          │         "From a [X] perspective..."              │
│          │                                                  │
│          ├──► Agent 2: [Different Domain]                   │
│          │         "Considering [Y]..."                     │
│          │                                                  │
│          ├──► Agent 3: [Contrarian/Devil's Advocate]        │
│          │         "The risk here is..."                    │
│          │                                                  │
│          ├──► Agent 4: [End User/Customer]                  │
│          │         "As a customer, I'd..."                  │
│          │                                                  │
│          └──► Agent 5: [Industry Specific]                  │
│                    "In [industry], this means..."           │
│                                                             │
│   Synthesis: Where do they AGREE? That's signal.            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Example Agent Sets

**For Marketing Decisions:**
- SEO Expert
- Conversion Specialist
- Brand Strategist
- Target Customer Persona
- Competitor Analyst

**For Product Decisions:**
- UX Designer
- Engineer (feasibility)
- Product Manager
- End User
- Business Analyst

**For Content Decisions:**
- Editor
- SEO Specialist
- Target Reader
- Social Media Manager
- Subject Matter Expert

### Prompt Template

```
I need to decide between these options:

Option A: [description]
Option B: [description]
Option C: [description]

Analyze each option from 5 expert perspectives:

1. **[Expert Type 1]** - Focus on [their domain]
2. **[Expert Type 2]** - Focus on [their domain]
3. **[Expert Type 3]** - Focus on [their domain]
4. **[Expert Type 4]** - Focus on [their domain]
5. **Devil's Advocate** - What could go wrong?

For each expert:
- State their recommendation (A, B, or C)
- Give 2-3 sentence reasoning
- Rate confidence (High/Medium/Low)

Then synthesize:
- Where do experts AGREE? (Strong signal)
- Where do they DISAGREE? (Needs more thought)
- Final recommendation with reasoning
```

### Interpreting Results

| Agreement Level | Action |
|-----------------|--------|
| 5/5 agree | Strong signal, proceed confidently |
| 4/5 agree | Good signal, note the dissent |
| 3/5 agree | Weak signal, dig deeper on disagreements |
| No consensus | Need more information or reframe the question |

---

## Method 2: AI Ping Pong

> Multi-model validation for high-stakes content.

### When to Use
- Content that will be widely seen
- Important communications (investors, press, legal)
- Can't afford errors or embarrassment
- Need confidence before shipping

### The Process

See `skill-ai-ping-pong.md` for full workflow.

**Quick version:**
```
Claude (Create) → Gemini (Critique) → Claude (Refine) → GPT-4 (Validate) → Perplexity (Fact-check)
```

### Shortened Ping Pong Options

| Stakes | Sequence |
|--------|----------|
| Medium | Claude → GPT-4 → Claude |
| High | Claude → Gemini → Claude → GPT-4 |
| Critical | Full 5-step + human review |

---

## Method 3: Recommendation Request

> "I'm overwhelmed. Just tell me what to do."

### When to Use
- Decision fatigue
- Too many options, analysis paralysis
- Need a tiebreaker
- Trust AI judgment for this category

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│               RECOMMENDATION REQUEST                        │
│                                                             │
│   Context dump                                              │
│        │                                                    │
│        ▼                                                    │
│   "Given all this, what would YOU recommend?"               │
│        │                                                    │
│        ▼                                                    │
│   AI gives ONE clear recommendation                         │
│        │                                                    │
│        ▼                                                    │
│   You decide: Accept, reject, or probe deeper               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Prompt Template

```
I need to make a decision and I'm stuck. Here's the situation:

**Context:**
[Dump everything relevant - background, constraints, options, concerns]

**The Decision:**
[What specifically needs to be decided]

**My Leaning:**
[If you have one, state it. If not, say "genuinely unsure"]

**What I Need:**
Give me ONE clear recommendation. Not "it depends" - an actual decision.

Format:
1. Your recommendation (one sentence)
2. Why (3 bullets max)
3. What could go wrong (1-2 risks to watch)
4. Confidence level (High/Medium/Low)
```

### When NOT to Use This

- Decisions with major irreversible consequences
- Situations requiring domain expertise you can't verify
- When you're looking for permission vs. guidance
- Legal, medical, or financial decisions (get real experts)

---

## Method 4: Constraint Filter

> Prioritize by what's actually doable NOW.

### When to Use
- Limited time, budget, or resources
- Long list of potential actions
- Need to focus on highest-leverage moves
- Feeling scattered or overwhelmed by options

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│                  CONSTRAINT FILTER                          │
│                                                             │
│   All Options                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Filter 1: TIME                          │               │
│   │ "What can I do in [timeframe]?"         │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Filter 2: RESOURCES                     │               │
│   │ "What do I have to work with?"          │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Filter 3: DEPENDENCIES                  │               │
│   │ "What requires nothing else first?"     │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Filter 4: IMPACT                        │               │
│   │ "What moves the needle most?"           │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   Prioritized, Actionable List                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Prompt Template

```
I have these potential actions/options:

[List all options]

My constraints:
- **Time:** [hours/days available]
- **Budget:** [if relevant]
- **Team:** [just me / have help]
- **Dependencies:** [what's already in place, what's not]

Filter these options:

1. **Eliminate** anything that can't happen within my constraints
2. **Rank** remaining options by impact-to-effort ratio
3. **Identify** the ONE thing I should do first
4. **Sequence** the rest in logical order

Output a prioritized action list with:
- What to do
- Why this order
- Time estimate for each
- Dependencies between items
```

### The 2x2 Matrix Shortcut

For quick filtering, plot options on:

```
                    HIGH IMPACT
                         │
         ┌───────────────┼───────────────┐
         │               │               │
         │   DO LATER    │   DO FIRST    │
         │   (Schedule)  │   (Priority)  │
         │               │               │
HIGH ────┼───────────────┼───────────────┼──── LOW
EFFORT   │               │               │    EFFORT
         │   ELIMINATE   │   QUICK WINS  │
         │   (Not worth) │   (Do now)    │
         │               │               │
         └───────────────┼───────────────┘
                         │
                    LOW IMPACT
```

---

## Method 5: Market Validation

> Use external data to validate positioning/messaging.

### When to Use
- Deciding between positioning angles
- Choosing messaging for campaigns
- Validating product-market fit assumptions
- Competitive positioning decisions

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│                 MARKET VALIDATION                           │
│                                                             │
│   Your Hypothesis/Options                                   │
│        │                                                    │
│        ├──► Competitor Analysis                             │
│        │    "What are others saying?"                       │
│        │                                                    │
│        ├──► Customer Language Mining                        │
│        │    "How do customers describe this?"               │
│        │                                                    │
│        ├──► Search/Social Signals                           │
│        │    "What's the market searching for?"              │
│        │                                                    │
│        └──► Gap Analysis                                    │
│             "What's NOT being said?"                        │
│                                                             │
│   Synthesis: Evidence-backed recommendation                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Prompt Template (with Perplexity)

```
I'm deciding between these positioning angles:

Angle A: [description]
Angle B: [description]
Angle C: [description]

Research and validate:

1. **Competitor Check**
   - Who else uses similar positioning?
   - What's saturated vs. differentiated?

2. **Customer Language**
   - Search reviews, forums, social for how customers describe this problem
   - What words/phrases do THEY use?

3. **Search Signals**
   - What are people searching for in this space?
   - Any keyword opportunities that align with one angle?

4. **Gap Analysis**
   - What's NO ONE saying that could work?
   - Any contrarian positioning opportunities?

Based on market evidence, recommend which angle and why.
```

### Data Sources to Check

- **Reviews:** G2, Capterra, Amazon, App Store
- **Forums:** Reddit, Quora, industry forums
- **Social:** Twitter/X, LinkedIn comments
- **Search:** Google autocomplete, Ahrefs, SEMrush
- **Competitors:** Website copy, ads, positioning

---

## Method 6: Future Self Check

> Long-term perspective for strategic decisions.

### When to Use
- Career decisions
- Business direction choices
- Partnerships and commitments
- Anything with long-term consequences

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│                  FUTURE SELF CHECK                          │
│                                                             │
│   Current Decision                                          │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ 10-10-10 Framework                      │               │
│   │                                         │               │
│   │ How will I feel about this decision:    │               │
│   │ • 10 minutes from now?                  │               │
│   │ • 10 months from now?                   │               │
│   │ • 10 years from now?                    │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Regret Minimization                     │               │
│   │                                         │               │
│   │ "When I'm 80, which choice would I      │               │
│   │  regret NOT taking?"                    │               │
│   └─────────────────────────────────────────┘               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────────────────────────────────────┐               │
│   │ Reversibility Check                     │               │
│   │                                         │               │
│   │ "Can I undo this if wrong?"             │               │
│   │ • Reversible → Bias toward action       │               │
│   │ • Irreversible → More analysis needed   │               │
│   └─────────────────────────────────────────┘               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Prompt Template

```
I'm facing this decision:

[Describe the decision and options]

Help me think through this with long-term perspective:

**10-10-10 Analysis:**
For each option, how will I likely feel:
- 10 minutes after deciding?
- 10 months from now?
- 10 years from now?

**Regret Minimization:**
Imagine I'm 80, looking back. Which choice would I regret NOT taking? Why?

**Reversibility Assessment:**
- Is this reversible? How easily?
- What's the cost of being wrong?
- What's the cost of NOT deciding?

**Values Alignment:**
- Which option best aligns with who I want to become?
- What would [person I admire] do?

Based on this analysis, what's the wise choice?
```

### The Bezos "Regret Minimization Framework"

Jeff Bezos on leaving a hedge fund to start Amazon:

> "I wanted to project myself forward to age 80... I knew that when I was 80, I was not going to regret having tried this. I was not going to regret trying to participate in this thing called the Internet that I thought was going to be a really big deal. I knew that if I failed, I wouldn't regret that. But I knew the one thing I might regret is not ever having tried."

Apply this: Which option would you regret NOT trying?

---

## Decision Method Selection Flowchart

```
START: I need to make a decision
│
├─► Is this content/creative output?
│   │
│   ├─► YES: Is it high-stakes?
│   │   │
│   │   ├─► YES → AI PING PONG
│   │   └─► NO  → Quick create + review
│   │
│   └─► NO: Continue
│
├─► Do I have too many options?
│   │
│   ├─► YES: Need expert perspectives?
│   │   │
│   │   ├─► YES → SPECIALIZED AGENTS
│   │   └─► NO  → CONSTRAINT FILTER
│   │
│   └─► NO: Continue
│
├─► Is this about positioning/messaging?
│   │
│   ├─► YES → MARKET VALIDATION
│   └─► NO: Continue
│
├─► Is this a long-term strategic choice?
│   │
│   ├─► YES → FUTURE SELF CHECK
│   └─► NO: Continue
│
├─► Am I just stuck/overwhelmed?
│   │
│   ├─► YES → RECOMMENDATION REQUEST
│   └─► NO  → Maybe don't need a framework, just decide
│
└─► Default: Start with CONSTRAINT FILTER to clarify options
```

---

## Combining Methods

For important decisions, combine methods:

### Example: Major Product Decision

1. **Constraint Filter** - Eliminate unfeasible options
2. **Specialized Agents** - Get expert perspectives on remaining options
3. **Market Validation** - Check external data
4. **Future Self Check** - Long-term implications
5. **Final synthesis** - Make the call

### Example: Critical Content Launch

1. **Specialized Agents** - Review content from multiple angles
2. **AI Ping Pong** - Multi-model validation
3. **Market Validation** - Check positioning against competitors
4. **Human review** - Final approval

---

## Anti-Patterns

### ❌ Analysis Paralysis
Using all 6 methods for every decision. Match rigor to stakes.

### ❌ Decision Avoidance
Using frameworks to postpone deciding. Set a decision deadline.

### ❌ Ignoring Intuition
Frameworks inform but don't replace judgment. If something feels wrong, probe deeper.

### ❌ Outsourcing Responsibility
AI helps you decide. It doesn't decide for you. Own the outcome.

### ❌ One-Size-Fits-All
Same method for every decision. Different situations need different approaches.

---

## Quick Reference Card

| Situation | Method | Time |
|-----------|--------|------|
| "I have 5 options and can't choose" | Specialized Agents | 20 min |
| "This content needs to be perfect" | AI Ping Pong | 45 min |
| "Just tell me what to do" | Recommendation Request | 5 min |
| "I'm overwhelmed with possibilities" | Constraint Filter | 15 min |
| "Is this positioning right?" | Market Validation | 45 min |
| "Is this the right direction for my life?" | Future Self Check | 20 min |

---

*Better decisions don't require more time. They require the right framework for the situation.*
