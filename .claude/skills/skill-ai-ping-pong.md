# Skill: AI Ping Pong

> Multi-model validation workflow for high-stakes decisions and content.

## Purpose

When output quality matters most, use multiple AI models as checks and balances. Each model has different strengths, biases, and blind spots. Running content through a deliberate sequence catches errors, improves quality, and builds confidence.

**Use when:**
- High-stakes content (launches, legal, financial)
- Important strategic decisions
- Content that will be widely distributed
- Anything you can't afford to get wrong

---

## Core Philosophy

> "One AI gives you an answer. Multiple AIs give you confidence."

Single-model outputs have blind spots:
- Claude: Can be overly cautious, verbose
- GPT: Can hallucinate confidently, miss nuance
- Gemini: Strong on facts, weaker on creativity
- Perplexity: Great for research, not generation

**The solution:** Chain them deliberately, using each model's strength.

---

## The Standard Ping Pong Sequence

```
┌─────────────────────────────────────────────────────────────────┐
│                    AI PING PONG WORKFLOW                        │
│                                                                 │
│   ┌──────────────┐                                              │
│   │ CLAUDE OPUS  │  STEP 1: CREATE                              │
│   │              │  Generate initial output                     │
│   │  (Creative)  │  Best for: nuanced writing, strategy        │
│   └──────┬───────┘                                              │
│          │                                                      │
│          ▼                                                      │
│   ┌──────────────┐                                              │
│   │ GEMINI PRO   │  STEP 2: CRITIQUE                            │
│   │              │  Identify weaknesses, factual issues         │
│   │  (Analytical)│  Best for: logic gaps, fact-checking        │
│   └──────┬───────┘                                              │
│          │                                                      │
│          ▼                                                      │
│   ┌──────────────┐                                              │
│   │ CLAUDE OPUS  │  STEP 3: REFINE                              │
│   │              │  Incorporate critique, improve               │
│   │  (Creative)  │  Best for: synthesis, polish                │
│   └──────┬───────┘                                              │
│          │                                                      │
│          ▼                                                      │
│   ┌──────────────┐                                              │
│   │ GPT-4        │  STEP 4: VALIDATE                            │
│   │              │  Fresh eyes, catch remaining issues          │
│   │  (Balanced)  │  Best for: general quality check            │
│   └──────┬───────┘                                              │
│          │                                                      │
│          ▼                                                      │
│   ┌──────────────┐                                              │
│   │ PERPLEXITY   │  STEP 5: FACT-CHECK                          │
│   │              │  Verify claims, check sources                │
│   │  (Research)  │  Best for: citations, accuracy              │
│   └──────┬───────┘                                              │
│          │                                                      │
│          ▼                                                      │
│   ┌──────────────┐                                              │
│   │    HUMAN     │  STEP 6: FINAL APPROVAL                      │
│   │              │  Make the call                               │
│   └──────────────┘                                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Model Strengths Reference

| Model | Best For | Watch Out For |
|-------|----------|---------------|
| **Claude Opus/Sonnet** | Nuanced writing, strategy, following complex instructions | Can be verbose, overly cautious |
| **GPT-4/4o** | Balanced output, code, general tasks | Confident hallucinations |
| **Gemini Pro** | Factual accuracy, analytical tasks, math | Less creative flair |
| **Perplexity** | Real-time research, fact-checking, citations | Not for generation |
| **Llama/Mistral** | Fast iteration, cost-effective bulk | Quality varies |

---

## Ping Pong Prompts

### Step 1: Create (Claude)

```
You are creating [CONTENT TYPE] for [AUDIENCE/PURPOSE].

Context:
[RELEVANT BACKGROUND]

Requirements:
[SPECIFIC REQUIREMENTS]

Create a high-quality first draft. Focus on:
- Clarity and impact
- Accurate information
- Appropriate tone

Output the draft with clear sections.
```

### Step 2: Critique (Gemini)

```
You are a critical reviewer. Analyze this content:

---
[PASTE DRAFT FROM STEP 1]
---

Provide a structured critique:

1. **Factual Accuracy**
   - Any claims that need verification?
   - Potential inaccuracies?

2. **Logic & Structure**
   - Are arguments sound?
   - Is the flow logical?

3. **Completeness**
   - What's missing?
   - What's unnecessary?

4. **Tone & Clarity**
   - Appropriate for audience?
   - Any confusing sections?

5. **Specific Issues**
   - List line-by-line problems

Be thorough but constructive. The goal is improvement, not destruction.
```

### Step 3: Refine (Claude)

```
Here is the original draft:

---
[ORIGINAL DRAFT]
---

Here is the critique:

---
[CRITIQUE FROM STEP 2]
---

Refine the draft by:
1. Addressing each critique point
2. Maintaining the original strengths
3. Improving overall quality

For each major change, briefly note what you changed and why.

Output the refined version.
```

### Step 4: Validate (GPT-4)

```
Review this content with fresh eyes:

---
[REFINED DRAFT FROM STEP 3]
---

As a final quality check:

1. **Overall Assessment**
   - Does this achieve its purpose?
   - Would you trust/use this?

2. **Remaining Issues**
   - Anything that still feels off?
   - Final polish suggestions?

3. **Confidence Score**
   - Rate 1-10 with explanation

4. **Final Recommendations**
   - Ship as-is, minor edits, or needs more work?

Be honest. This is the last check before human review.
```

### Step 5: Fact-Check (Perplexity)

```
Fact-check the following content:

---
[CONTENT TO VERIFY]
---

For each factual claim:
1. Verify accuracy
2. Provide source if available
3. Flag anything unverifiable

Focus on:
- Statistics and numbers
- Named entities (people, companies, dates)
- Technical claims
- Market/industry assertions

Output a verification report.
```

---

## Shortened Sequences

Not every task needs 5 models. Use these abbreviated flows:

### Quick Validation (2-step)
```
Claude (Create) → GPT-4 (Validate)
```
**Use for:** Standard content, internal docs, low-stakes output

### Fact-Heavy Content (3-step)
```
Claude (Create) → Perplexity (Fact-check) → Claude (Refine)
```
**Use for:** Research reports, data-driven content, claims-heavy copy

### Strategic Decisions (3-step)
```
Claude (Analyze) → Gemini (Critique) → Claude (Synthesize)
```
**Use for:** Business strategy, important decisions, complex analysis

### Creative Content (3-step)
```
Claude (Create) → GPT-4 (Critique) → Claude (Polish)
```
**Use for:** Marketing copy, creative writing, brand content

---

## Implementation Patterns

### Pattern 1: Sequential File-Based

Save each step to a file, reference in next step:

```
/project
  /ping-pong
    01-draft-claude.md
    02-critique-gemini.md
    03-refined-claude.md
    04-validated-gpt4.md
    05-factcheck-perplexity.md
    06-final.md
```

### Pattern 2: Inline Conversation

Keep everything in one conversation, clearly marking model transitions:

```
## Step 1: Claude Draft
[output]

## Step 2: Gemini Critique
[switch to Gemini, paste draft, get critique]

## Step 3: Claude Refinement
[switch back to Claude, paste both, refine]
...
```

### Pattern 3: Parallel Critique

For efficiency, run critiques in parallel:

```
                    ┌─► Gemini (Logic)
                    │
Claude (Create) ────┼─► GPT-4 (Quality)
                    │
                    └─► Perplexity (Facts)
                              │
                              ▼
                    Claude (Synthesize all feedback)
```

---

## When to Use Full vs. Abbreviated

| Scenario | Sequence | Why |
|----------|----------|-----|
| Product launch copy | Full 5-step | High visibility, can't afford errors |
| Internal memo | 2-step Quick | Low stakes, speed matters |
| Investor deck | Full 5-step | High stakes, needs to be bulletproof |
| Social post | 2-step Quick | Fast iteration, easy to fix |
| Legal/compliance content | Full 5-step + human legal review | Risk mitigation |
| Blog post | 3-step Creative | Quality matters but not critical |
| Technical docs | 3-step Fact-Heavy | Accuracy essential |
| Strategic decision | 3-step Strategic | Need multiple perspectives |

---

## Cost Considerations

| Step | Model | Approx Cost (per 1K tokens) |
|------|-------|----------------------------|
| Create | Claude Opus | $0.015 / $0.075 |
| Critique | Gemini Pro | $0.00125 / $0.005 |
| Refine | Claude Opus | $0.015 / $0.075 |
| Validate | GPT-4 | $0.03 / $0.06 |
| Fact-check | Perplexity | API varies |

**Full sequence for 2K token doc:** ~$0.30-0.50

**Tip:** Use Claude Sonnet ($0.003/$0.015) for Create/Refine steps when budget-conscious. Reserve Opus for truly critical content.

---

## Quality Metrics

Track these to measure ping pong effectiveness:

1. **Error catch rate** - Issues found in critique steps
2. **Revision delta** - How much changed between drafts
3. **Final confidence** - Validator's score
4. **Human override rate** - How often human changes final output
5. **Time to final** - Total workflow duration

---

## Anti-Patterns

### ❌ Skipping Human Review
AI consensus doesn't equal correctness. Always have human final approval for high-stakes content.

### ❌ Using Same Model for Create + Critique
Defeats the purpose. Same biases reviewing same biases.

### ❌ Ignoring Critique
If you're not going to address feedback, don't request it.

### ❌ Over-Engineering Low-Stakes Content
A social post doesn't need 5 models. Match rigor to risk.

### ❌ Blind Trust in Fact-Check
Perplexity can miss things. For critical facts, verify manually.

---

## Integration with Other Skills

- **copywriting** → Use ping pong for high-stakes sales copy
- **brand-strategy** → Validate strategic decisions
- **content-atomizer** → Quality-check before atomizing
- **email-sequences** → Validate welcome/sales sequences
- **seo-content** → Fact-check claims before publishing

---

## Quick Start

### Minimal Viable Ping Pong

1. Create in Claude
2. Paste to GPT-4: "Critique this. What's wrong? What's missing?"
3. Return to Claude: "Here's the critique. Refine accordingly."
4. Human review and ship

### Full Production Ping Pong

1. Brief → Claude creates draft
2. Draft → Gemini critiques logic/facts
3. Draft + Critique → Claude refines
4. Refined → GPT-4 validates
5. Claims → Perplexity fact-checks
6. Human reviews, approves, ships

---

## Prompt Templates Library

### Universal Critique Prompt
```
Review this [CONTENT TYPE] critically:

[CONTENT]

Evaluate:
1. Does it achieve [GOAL]?
2. Is it appropriate for [AUDIENCE]?
3. What's weak or missing?
4. What would make it significantly better?
5. Confidence score (1-10) with reasoning

Be constructive but honest.
```

### Universal Synthesis Prompt
```
Here is the original:
[ORIGINAL]

Here is feedback from [MODEL]:
[FEEDBACK]

Create an improved version that:
1. Addresses each feedback point
2. Preserves what worked
3. Maintains the original intent

Note significant changes made.
```

---

*Multiple perspectives, one outcome. Ping pong your way to quality.*
