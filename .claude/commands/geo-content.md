# /geo-content

Generate content optimized for AI/LLM citation (Generative Engine Optimization).

---

## Agent

@content-strategist or @copywriter

## Skills Required

- `skill-geo-content.md`
- `skill-perplexity-research.md`

## MCPs Required

- Perplexity MCP (for AI response analysis)

---

## Workflow

### 1. Define Target Query

Clarify what AI query we're targeting:
- What question do users ask AI?
- What topic needs a quotable answer?
- What gap exists in current AI responses?

**If not provided, ask:**
- Target question/query?
- Current state of AI answers?
- What unique value can we provide?

### 2. Research Phase

#### Query AI Systems

Test the target query:

```
Use Perplexity:
"[target query]"

Note:
- What sources are cited?
- What's included in the answer?
- What's missing or incomplete?
- How is the answer structured?
```

Optionally test ChatGPT and Claude if available.

#### Analyze Cited Sources

```
Use Perplexity:
"What are the most authoritative sources for [topic]?"

Analyze why they get cited:
- Structure?
- Authority signals?
- Quotable content?
```

#### Identify the Gap

Determine what your content can add:
- More specific data?
- More authoritative source?
- More current information?
- Clearer definition?
- Better structure?

### 3. Create Content Brief

Generate GEO-specific brief:

```markdown
## GEO Content Brief

### Target Query
[The exact question users ask AI]

### Current AI Response
[Summary of what AI currently says]

### Sources Currently Cited
1. [Source 1] - [why it's cited]
2. [Source 2] - [why it's cited]

### Gap/Opportunity
[What's missing that we can provide]

### Content Type
[Definition Page / Data Page / Expert Take / Structured FAQ]

### Target Length
[XXX words - concise]

### Key Quotable Statements

Draft 2-3 statements we want AI to cite verbatim:

1. "[Topic] is [clear definition that can be quoted directly]."

2. "The [key stat]: [specific number] ([source], [year])."

3. "[Clear recommendation/conclusion]."

### Authority Signals
- Author: [name, credentials]
- Sources to cite: [authoritative sources]
- Freshness: [include date]

### Structure

# [Direct Answer Title]

## Short Answer
[2-3 sentence quotable answer]

## [Section 1]
[Quotable content]

## [Section 2]
[Quotable content]

## Quick Reference
[Table or list format]

---
Author: [credentials]
Updated: [date]
```

### 4. Generate Content

Write content optimized for AI citation:

**Key requirements:**
- Open with quotable definition/answer
- Every paragraph should be cite-worthy
- Specific numbers, not vague quantities
- Clear structure AI can parse
- Data properly attributed
- Author credentials included
- Date/freshness signals

**Voice requirements:**
- Direct, not hedging
- Specific, not general
- Dense, not padded
- Human, not AI-sounding

### 5. Quality Check

Review against GEO requirements:
- [ ] Opens with quotable statement
- [ ] Each section is cite-worthy
- [ ] Stats in cite-ready format: "X reached $Y in Z (Source)"
- [ ] Author/date clearly shown
- [ ] Structure is easy to parse
- [ ] No filler content
- [ ] Sounds human

---

## Output Format

Deliver both:

### 1. GEO Content Brief
```markdown
[Full brief as structured above]
```

### 2. Full Content (ready to publish)
```markdown
---
author: [Name]
credentials: [Title/Role]
updated: [Date]
---

[Full content optimized for citation]
```

---

## Content Type Templates

### Definition Page (500-1K words)
```markdown
# What is [Term]?

**[Term]** is [50-word definitive definition that can be quoted verbatim].

## Key Characteristics

[Term] has these essential elements:

1. **[Characteristic 1]:** [Clear, quotable explanation]
2. **[Characteristic 2]:** [Clear, quotable explanation]
3. **[Characteristic 3]:** [Clear, quotable explanation]

## Types of [Term]

| Type | Definition | Best For |
|------|------------|----------|
| [Type 1] | [Clear definition] | [Use case] |
| [Type 2] | [Clear definition] | [Use case] |

## [Term] vs [Related Term]

[Term] differs from [related term] in [key way]:
[Term] [characteristic], while [related term] [characteristic].

## Example

[Specific, concrete example with details]

## Key Takeaway

[Single sentence that summarizes the essential point]

---
*[Author name], [credentials]. Updated [date].*
```

### Data/Research Page (1-2K words)
```markdown
# [Topic] Statistics ([Year])

## Key Statistics

- **[Metric 1]:** [Specific number] ([Source], [Year])
- **[Metric 2]:** [Specific number] ([Source], [Year])
- **[Metric 3]:** [Specific number] ([Source], [Year])

## Market Overview

The [market] reached **$X billion in [Year]**,
with a **X% CAGR** projected through [Year].

## [Category] Breakdown

| Segment | Value | Share | Growth |
|---------|-------|-------|--------|
| [Segment 1] | $X | X% | X% |
| [Segment 2] | $X | X% | X% |

## Key Trends

### [Trend 1]
[2-3 sentences with specific data]

### [Trend 2]
[2-3 sentences with specific data]

## Methodology

[Brief explanation of data sources and collection]

## Sources

- [Source 1]
- [Source 2]

---
*Compiled by [Author], [credentials]. Updated [date].*
```

### Expert Take (800-1.5K words)
```markdown
# [Direct Answer to Question]

## Short Answer

[2-3 sentence direct answer that AI can quote verbatim]

## Why This Matters

[Brief context explaining importance]

## The Full Picture

### [Aspect 1]
[Clear explanation with evidence]

### [Aspect 2]
[Clear explanation with evidence]

## Common Misconception

Many believe [misconception]. In reality, [truth with evidence].

## The Bottom Line

[Single quotable conclusion]

---
*[Author name], [title] at [company]. [Brief credential]. Updated [date].*
```

### Structured FAQ (1-2K words)
```markdown
# [Topic]: [Number] Questions Answered

## Quick Answers

| Question | Answer |
|----------|--------|
| [Q1] | [1-sentence answer] |
| [Q2] | [1-sentence answer] |
| [Q3] | [1-sentence answer] |

## Detailed Answers

### [Question 1]?

[Direct 2-3 sentence answer that can be quoted]

[Brief additional context if needed]

### [Question 2]?

[Direct 2-3 sentence answer]

### [Question 3]?

[Direct 2-3 sentence answer]

## Related Topics

- [Link to related content]

---
*[Author], [credentials]. Updated [date].*
```

---

## Quotable Writing Patterns

Use these patterns to create cite-ready content:

### Definition
```
[Term] is [clear definition]. It [key characteristic].
Unlike [related term], [term] specifically [distinction].
```

### Statistic
```
[Metric] reached [specific number] in [year],
according to [source] — a [X%] [change] from [period].
```

### Comparison
```
[A] and [B] differ in [key way]: [A] [does X],
while [B] [does Y]. Choose [A] for [use case]
and [B] for [use case].
```

### Recommendation
```
The best [thing] for [use case] is [specific recommendation],
because [clear reason with evidence].
```

---

## Quality Checklist

Before delivery:
- [ ] Target query researched in AI
- [ ] Gap identified
- [ ] Opens with quotable answer
- [ ] Every section is cite-worthy
- [ ] Stats are specific with sources
- [ ] Author credentials included
- [ ] Date is shown
- [ ] No filler content
- [ ] Concise word count
- [ ] Sounds human, not AI

---

## Testing Your Content

After publishing, test if it gets cited:

```
1. Wait for indexing (1-7 days)
2. Ask Perplexity: "[target query]"
3. Check if your content is cited
4. Note what was quoted
5. Iterate if needed
```

---

## Example Usage

**User:** "Create GEO content for 'what is product-led growth'"

**Agent:**
1. Queries Perplexity for current AI answer
2. Analyzes what sources are cited
3. Identifies gap (missing specific metrics, unclear definition)
4. Creates definition page brief
5. Writes 800-word quotable definition page
6. Opens with cite-ready definition
7. Includes specific stats with sources
8. Adds author credentials and date
9. Delivers brief + full content
