# Skill: SEO Content

## Purpose

Create content optimized for traditional search engine rankings. This skill defines the frameworks, formats, and best practices for content that ranks on Google, captures featured snippets, and drives organic traffic.

---

## Core Philosophy

**Rank in search. Sound like a human wrote it.**

SEO content must satisfy both algorithms and readers. The best SEO content is genuinely useful — search engines have evolved to reward content that truly serves user intent.

---

## SEO Content Framework

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         SEO CONTENT                                         │
│              "Rank in search. Sound like a human wrote it."                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  LENGTHS                              STYLES                                │
│  ───────                              ──────                                │
│  Pillar Guide     5-8K words          → Long-form, comprehensive            │
│  How-To           2-3K words          → Skimmable with clear H2s            │
│  Comparison       2.5-4K words        → Answer intent completely            │
│  Listicle         2-3K words          → Depth signals authority             │
│                                                                             │
│  RESEARCH                             STRUCTURE                             │
│  ────────                             ─────────                             │
│  → Analyze top 5 SERP results         → Keyword in title, H1, H2s           │
│  → Find gaps in existing content      → Match Featured Snippet format       │
│  → Answer all PAA questions           → FAQ section (schema-ready)          │
│                                                                             │
│  WIN CONDITION                                                              │
│  ─────────────                                                              │
│  → Page 1 ranking                                                           │
│  → Featured Snippet                                                         │
│  → Click-through + dwell time                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Content Types & Lengths

### Pillar Guide (5,000-8,000 words)

**Purpose:** Comprehensive resource that covers a topic exhaustively

**Structure:**
```
# [Ultimate/Complete/Definitive] Guide to [Topic]

## What is [Topic]?
[Definition - featured snippet opportunity]

## Why [Topic] Matters
[Context and importance]

## [Major Section 1]
### [Subsection 1.1]
### [Subsection 1.2]

## [Major Section 2]
### [Subsection 2.1]
### [Subsection 2.2]

## [Major Section 3]
...

## Common Mistakes to Avoid
[List of anti-patterns]

## Expert Tips
[Advanced insights]

## FAQ
[Schema-ready Q&A]

## Conclusion
[Summary + CTA]
```

**Best For:** High-volume keywords, building topical authority

---

### How-To Guide (2,000-3,000 words)

**Purpose:** Step-by-step instructions for completing a task

**Structure:**
```
# How to [Action] [Object] (Step-by-Step Guide)

## Quick Answer
[50-word summary - featured snippet target]

## What You'll Need
[Prerequisites, tools, requirements]

## Step 1: [Action]
[Detailed instructions]
[Screenshot/image if applicable]

## Step 2: [Action]
...

## Step N: [Action]
...

## Troubleshooting
[Common issues and fixes]

## FAQ
[Related questions]
```

**Best For:** Action-oriented queries, "how to" keywords

---

### Comparison Post (2,500-4,000 words)

**Purpose:** Compare options to help users make decisions

**Structure:**
```
# [Option A] vs [Option B]: [Year] Comparison

## Quick Verdict
[Clear recommendation + why]

## Comparison Table
| Feature | Option A | Option B |
|---------|----------|----------|

## [Option A] Overview
### Pros
### Cons
### Best For

## [Option B] Overview
### Pros
### Cons
### Best For

## Detailed Comparison

### [Criterion 1]
### [Criterion 2]
### [Criterion 3]

## Which Should You Choose?
[Decision framework]

## FAQ
```

**Best For:** "vs" keywords, buyer intent queries

---

### Listicle (2,000-3,000 words)

**Purpose:** Curated list of items, tools, tips, or examples

**Structure:**
```
# [Number] Best [Things] for [Purpose] ([Year])

## Our Top Picks
[Quick summary table]

## 1. [Item Name]
**Best for:** [Use case]
[Description]
**Pros:** [Bullet points]
**Cons:** [Bullet points]
**Pricing:** [If applicable]

## 2. [Item Name]
...

## How We Chose
[Methodology]

## FAQ
```

**Best For:** "best", "top", "list of" keywords

---

## Research Process

### 1. Keyword Analysis

Before writing:
- Primary keyword + search volume
- Secondary keywords (3-5)
- Long-tail variations
- Search intent (informational, commercial, transactional)

### 2. SERP Analysis

Analyze top 5 ranking results:
- Word count
- Structure/headings
- Topics covered
- Content gaps
- Featured snippet format

### 3. PAA (People Also Ask)

Find and answer all PAA questions:
- Screenshot PAA box
- List all questions
- Answer each in your content
- Use as FAQ section

### 4. Content Gap Analysis

What's missing from top results:
- Topics not covered
- Outdated information
- Poor user experience
- Unanswered questions

---

## On-Page SEO Requirements

### Title Tag
```
[Primary Keyword] - [Modifier] | [Brand]
Example: "How to Start a Podcast - Complete Guide 2024 | Riverside"
```

**Rules:**
- Primary keyword near front
- Under 60 characters
- Include year if applicable
- Compelling for clicks

### Meta Description
```
[Hook/Promise]. [What you'll learn]. [CTA].
```

**Rules:**
- Under 160 characters
- Include primary keyword naturally
- Clear value proposition
- Call to action

### H1 Tag
- One H1 per page
- Contains primary keyword
- Matches search intent
- Compelling headline

### H2/H3 Structure
- H2s for major sections
- Include secondary keywords in H2s
- H3s for subsections
- Logical hierarchy

### Internal Links
- Link to related content
- Use descriptive anchor text
- 3-5 internal links minimum
- Link to pillar content

### External Links
- Link to authoritative sources
- Open in new tab
- Relevant and current
- 2-3 external links

---

## Featured Snippet Optimization

### Paragraph Snippet
```
[Question as H2]

[40-60 word answer that directly answers the question,
formatted as a single paragraph, starting with the key
definition or answer.]
```

### List Snippet
```
## How to [Do Thing]

1. [Step one]
2. [Step two]
3. [Step three]
...
```

### Table Snippet
```
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Data     | Data     | Data     |
```

---

## Schema Markup

### FAQ Schema
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [{
    "@type": "Question",
    "name": "Question text?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "Answer text."
    }
  }]
}
```

### HowTo Schema
```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "How to...",
  "step": [{
    "@type": "HowToStep",
    "name": "Step name",
    "text": "Step description"
  }]
}
```

---

## Voice Guidelines

### Kill These Words
- "Delve"
- "Comprehensive"
- "Landscape"
- "In today's world"
- "It's important to note"
- "At the end of the day"

### Add These Elements
- Specific numbers: "$47,329" not "lots of money"
- Real examples: named companies, products
- Personal opinions: "I recommend" not "it is recommended"
- Limitations: honest about what doesn't work
- Dates: keep content current

### Test
**"Would I say this out loud to a smart friend?"**
- If yes → keep it
- If no → rewrite it

---

## Quality Checklist

### Pre-Writing
- [ ] Primary keyword defined
- [ ] Secondary keywords listed
- [ ] Search intent understood
- [ ] Top 5 SERP analyzed
- [ ] Content gaps identified
- [ ] PAA questions collected

### Writing
- [ ] Title tag optimized
- [ ] Meta description compelling
- [ ] H1 contains keyword
- [ ] H2s include secondary keywords
- [ ] Answers search intent completely
- [ ] Featured snippet opportunity targeted
- [ ] Internal links included
- [ ] External links to authority sources
- [ ] FAQ section added

### Post-Writing
- [ ] Word count meets target
- [ ] Readability score checked
- [ ] Schema markup ready
- [ ] No keyword stuffing
- [ ] Sounds human, not AI
- [ ] Provides genuine value

---

## Output Format

### SEO Content Brief
```
## SEO Content Brief: [Topic]

### Target Keyword
Primary: [keyword] - [volume] - [difficulty]
Secondary: [list]

### Search Intent
[Informational/Commercial/Transactional]

### Content Type
[Pillar/How-To/Comparison/Listicle]

### Target Length
[X,XXX words]

### Title Tag
[Optimized title]

### Meta Description
[Optimized description]

### Structure
[H1, H2, H3 outline]

### Competitor Analysis
[Key findings]

### Content Gaps to Fill
[What to include that others miss]

### PAA Questions to Answer
[List of questions]

### Featured Snippet Target
[Format and question to target]
```

---

## Anti-Patterns

1. **Keyword stuffing** — Natural usage only
2. **Thin content** — Meet depth expectations
3. **Duplicate content** — Original value always
4. **Clickbait titles** — Deliver on promises
5. **Ignoring intent** — Match what searchers want
6. **Wall of text** — Use formatting for scannability
7. **Outdated info** — Keep content current
8. **AI slop** — Edit for human voice

---

## Integration

### Commands
- `/seo-content` — Generate SEO-optimized content
- `/content-strategy` — Plan content pillars

### Agents
- `content-strategist` — Primary user
- `copywriter` — Execution support
- `research-analyst` — SERP analysis

### MCPs
- `Perplexity` — Research and fact-checking
- `Firecrawl` — Competitor content analysis
