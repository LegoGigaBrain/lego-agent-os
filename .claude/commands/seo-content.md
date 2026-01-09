# /seo-content

Generate content optimized for traditional search engine rankings.

---

## Agent

@content-strategist or @copywriter

## Skills Required

- `skill-seo-content.md`
- `skill-perplexity-research.md`
- `skill-firecrawl-scraping.md`

## MCPs Required

- Perplexity MCP (for SERP research)
- Firecrawl MCP (for competitor analysis)

---

## Workflow

### 1. Define Target

Clarify the SEO goal:
- What keyword(s) are we targeting?
- What is the search intent?
- What content type is appropriate?

**If not provided, ask:**
- Primary keyword?
- Target audience?
- Business goal for this content?

### 2. Research Phase

#### Keyword Analysis
```
Use Perplexity:
- "[keyword] search volume"
- "[keyword] related keywords"
- "[keyword] search intent"
```

#### SERP Analysis
```
Use Perplexity:
- "What are the top results for [keyword]?"
- Analyze: structure, word count, topics covered
```

#### Competitor Content Analysis
```
Use Firecrawl:
- Scrape top 3-5 ranking pages
- Extract: headings, word counts, topics
- Identify: gaps and opportunities
```

#### PAA Collection
```
Use Perplexity:
- "What questions do people ask about [keyword]?"
- Collect all PAA questions
```

### 3. Create Content Brief

Generate brief using this structure:

```markdown
## SEO Content Brief

### Target Keyword
- Primary: [keyword]
- Volume: [if found]
- Intent: [informational/commercial/transactional]

### Secondary Keywords
- [keyword 2]
- [keyword 3]
- [keyword 4]

### Search Intent
[What does the searcher want to accomplish?]

### Content Type
[Pillar Guide / How-To / Comparison / Listicle]

### Target Length
[X,XXX words]

### Title Tag (under 60 chars)
[Primary Keyword] - [Modifier] | [Brand]

### Meta Description (under 160 chars)
[Hook]. [Value proposition]. [CTA].

### Content Structure

# H1: [Title with keyword]

## H2: [Section 1 - include secondary keyword]
### H3: [Subsection]
### H3: [Subsection]

## H2: [Section 2]
...

## H2: FAQ
### [PAA Question 1]
### [PAA Question 2]
...

### Competitor Insights
| Competitor | Word Count | Unique Angle |
|------------|------------|--------------|
| [URL 1] | [count] | [what they do well] |
| [URL 2] | [count] | [what they do well] |

### Content Gaps to Fill
- [Gap 1 - what competitors miss]
- [Gap 2]
- [Gap 3]

### PAA Questions to Answer
1. [Question]?
2. [Question]?
3. [Question]?

### Featured Snippet Target
- Format: [paragraph/list/table]
- Target question: [question]
- Answer format: [how to structure answer]

### Internal Links
- Link to: [related content]
- Link from: [existing content that should link here]

### External Link Suggestions
- [Authority source to cite]
- [Data source to reference]
```

### 4. Generate Content

Write the full content following:
- Structure from brief
- SEO requirements from skill
- Voice guidelines (human, not AI)

**Key requirements:**
- Keyword in title, H1, first paragraph
- Secondary keywords in H2s
- Answer all PAA questions
- Include FAQ with schema-ready format
- Featured snippet opportunity targeted
- 3-5 internal links
- 2-3 external authority links

### 5. Optimize

Review and refine:
- [ ] Title tag under 60 characters
- [ ] Meta description under 160 characters
- [ ] H1 contains primary keyword
- [ ] H2s contain secondary keywords
- [ ] Featured snippet formatted correctly
- [ ] FAQ ready for schema markup
- [ ] No keyword stuffing
- [ ] Reads naturally
- [ ] Provides genuine value

---

## Output Format

Deliver both:

### 1. Content Brief (for review/approval)
```markdown
[Full brief as structured above]
```

### 2. Full Content (ready to publish)
```markdown
---
title: [SEO title]
description: [Meta description]
keywords: [keyword list]
---

[Full article content]
```

---

## Content Type Templates

### Pillar Guide (5-8K words)
```
# The [Ultimate/Complete] Guide to [Topic]

[Introduction with keyword in first 100 words]

## What is [Topic]?
[Definition paragraph - featured snippet target]

## Why [Topic] Matters
[Context and importance]

## [Major Section 1]
[Comprehensive coverage]

## [Major Section 2]
[Comprehensive coverage]

## [Major Section 3]
[Comprehensive coverage]

## Common Mistakes to Avoid
[List format]

## Expert Tips
[Advanced insights]

## FAQ
[All PAA questions answered]

## Conclusion
[Summary + CTA]
```

### How-To (2-3K words)
```
# How to [Action] [Object] ([Year] Guide)

## Quick Answer
[50-word featured snippet target]

## What You'll Need
[Prerequisites]

## Step 1: [Action]
[Detailed instructions]

## Step 2: [Action]
...

## Troubleshooting
[Common issues]

## FAQ
[Related questions]
```

### Comparison (2.5-4K words)
```
# [A] vs [B]: Which is Better? ([Year])

## Quick Verdict
[Clear recommendation]

## Comparison Table
[Feature comparison]

## [A] Overview
[Pros, cons, best for]

## [B] Overview
[Pros, cons, best for]

## Detailed Comparison
[By criterion]

## Which Should You Choose?
[Decision framework]

## FAQ
```

### Listicle (2-3K words)
```
# [Number] Best [Things] for [Purpose] ([Year])

## Our Top Picks
[Quick summary table]

## 1. [Item]
[Details, pros, cons]

## 2. [Item]
...

## How We Chose
[Methodology]

## FAQ
```

---

## Quality Checklist

Before delivery:
- [ ] Keyword research completed
- [ ] SERP analysis done
- [ ] Competitor content analyzed
- [ ] All PAA questions answered
- [ ] Featured snippet targeted
- [ ] Title/meta optimized
- [ ] Structure follows template
- [ ] Word count meets target
- [ ] Links included (internal + external)
- [ ] FAQ section complete
- [ ] Voice is human, not AI
- [ ] Content provides genuine value

---

## Example Usage

**User:** "Write SEO content for 'how to start a podcast'"

**Agent:**
1. Researches keyword via Perplexity
2. Analyzes top 5 SERP results
3. Scrapes competitor content via Firecrawl
4. Collects all PAA questions
5. Creates comprehensive brief
6. Writes 2,500-word how-to guide
7. Optimizes for featured snippet
8. Delivers brief + full content
