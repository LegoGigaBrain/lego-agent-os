# Skill: Perplexity Research

## Purpose

Leverage Perplexity AI's MCP server for intelligent web research, competitive intelligence, and fact-finding with citations. This skill enables agents to access real-time information with source attribution.

---

## Core Philosophy

**Research with receipts.** Every claim should have a source. Perplexity provides AI-powered search that returns not just answers, but the evidence behind them.

---

## MCP Tools Available

### 1. Direct Search (`perplexity_search`)

Quick web search with ranked results.

**Use When:**
- Finding specific facts
- Getting current information
- Quick competitive checks
- News and events

**Parameters:**
```
query: "search query here"
```

**Returns:**
- Ranked search results
- Titles, URLs, snippets
- Metadata

---

### 2. Conversational Query (`perplexity_chat`)

General-purpose AI with real-time web search using sonar-pro model.

**Use When:**
- Everyday research questions
- Conversational queries
- Synthesizing information
- Getting explanations

**Parameters:**
```
query: "your question here"
```

**Returns:**
- Conversational answer
- Web context integrated
- Citations

---

### 3. Deep Research (`perplexity_research`)

Comprehensive research using sonar-deep-research model.

**Use When:**
- Complex topics requiring depth
- Detailed investigation
- Comprehensive reports
- Multi-faceted questions

**Parameters:**
```
query: "complex research question"
```

**Returns:**
- Thorough analysis
- Multiple citations
- Detailed findings

---

### 4. Reasoning (`perplexity_reason`)

Advanced reasoning using sonar-reasoning-pro model.

**Use When:**
- Logical problems
- Complex analysis
- Decision-making support
- Step-by-step reasoning

**Parameters:**
```
query: "problem requiring reasoning"
```

**Returns:**
- Structured reasoning
- Step-by-step analysis
- Conclusions with support

---

## Research Patterns

### Competitive Intelligence

```
1. Initial scan:
   perplexity_search: "[competitor] company overview 2024"

2. Deep dive:
   perplexity_research: "What is [competitor]'s business model, pricing, and target market?"

3. Comparison:
   perplexity_reason: "Compare [our company] vs [competitor] positioning and strengths"
```

### Market Research

```
1. Market size:
   perplexity_research: "What is the TAM/SAM/SOM for [market] in 2024?"

2. Trends:
   perplexity_search: "[industry] trends 2024 2025"

3. Analysis:
   perplexity_reason: "What are the key growth drivers in [market]?"
```

### Fact-Checking

```
1. Verify claim:
   perplexity_search: "[specific claim] statistics source"

2. Cross-reference:
   perplexity_research: "What do multiple sources say about [claim]?"
```

### Current Events

```
1. Latest news:
   perplexity_search: "[topic] news this week"

2. Context:
   perplexity_chat: "What's happening with [topic] and why does it matter?"
```

---

## Query Optimization

### Good Queries

| Type | Good Query | Why |
|------|------------|-----|
| Specific | "Notion 2024 revenue ARR funding" | Specific metrics, timeframe |
| Comparative | "Figma vs Sketch market share 2024" | Clear comparison |
| Explanatory | "Why are B2B SaaS companies moving to PLG?" | Seeks reasoning |

### Bad Queries

| Type | Bad Query | Fix |
|------|-----------|-----|
| Vague | "Tell me about tech" | "What are the top enterprise SaaS trends in 2024?" |
| Too broad | "Marketing" | "What content marketing strategies work for B2B SaaS?" |
| Opinion-seeking | "Best CRM" | "What are the top-rated CRMs for SMBs by G2 reviews?" |

---

## Output Formatting

### Research Summary Template

```
## Research: [Topic]

### Key Findings

1. **[Finding 1]**
   - Evidence: [summary]
   - Source: [citation]

2. **[Finding 2]**
   - Evidence: [summary]
   - Source: [citation]

### Implications

[What this means for the task at hand]

### Sources

- [Source 1 title](url)
- [Source 2 title](url)
- [Source 3 title](url)
```

### Competitive Brief Template

```
## Competitor: [Name]

### Overview
[1-2 sentence summary]

### Key Facts
- Founded: [year]
- Funding: [amount]
- Headcount: [estimate]
- Revenue: [if available]

### Positioning
[How they position themselves]

### Strengths
- [Strength 1]
- [Strength 2]

### Weaknesses
- [Weakness 1]
- [Weakness 2]

### Sources
[Citations]
```

---

## Integration with Agents

### research-analyst
- Primary tool for all research tasks
- Use `perplexity_research` for deep dives
- Use `perplexity_search` for quick facts

### content-strategist
- Research content gaps: "What content does [competitor] publish about [topic]?"
- Trend research: "[industry] content trends 2024"

### marketing-strategist
- Market intelligence
- Campaign research
- Channel analysis

### brand-strategist
- Cultural research
- Positioning research
- Competitive positioning analysis

---

## Quality Checklist

Before delivering research:

- [ ] Sources are cited
- [ ] Information is current (check dates)
- [ ] Multiple sources corroborate key claims
- [ ] Findings are relevant to the task
- [ ] Implications are actionable

---

## Anti-Patterns

1. **No citations** — Always include sources
2. **Single source** — Cross-reference important claims
3. **Outdated info** — Verify currency
4. **Query dump** — Synthesize, don't just search
5. **Assumption as fact** — Label uncertainty

---

## Rate Limits & Best Practices

- Use `perplexity_search` for quick queries (lower cost)
- Reserve `perplexity_research` for complex topics
- Cache results when doing iterative work
- Batch related queries when possible
