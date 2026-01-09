# Skill: Firecrawl Web Scraping

## Purpose

Leverage Firecrawl's MCP server for deep web scraping, content extraction, and site crawling. This skill enables agents to extract structured data from websites, including JavaScript-rendered content.

---

## Core Philosophy

**Scrape smart, not hard.** Firecrawl handles the complexity of modern web pages — JavaScript rendering, pagination, rate limiting — so you can focus on extracting value.

---

## MCP Tools Available

### 1. Single Page Scrape (`firecrawl_scrape`)

Scrape a single URL and convert to clean markdown.

**Use When:**
- Extracting specific page content
- Getting article text
- Competitor page analysis
- Landing page teardowns

**Parameters:**
```
url: "https://example.com/page"
formats: ["markdown", "html", "text"]  // optional
```

**Returns:**
- Clean markdown content
- Extracted metadata
- Links found

---

### 2. Site Crawl (`firecrawl_crawl`)

Crawl an entire website or section.

**Use When:**
- Full site content audit
- Competitor content inventory
- Documentation scraping
- Blog archive extraction

**Parameters:**
```
url: "https://example.com"
limit: 100  // max pages
include_patterns: ["/blog/*"]  // optional
exclude_patterns: ["/admin/*"]  // optional
```

**Returns:**
- Array of scraped pages
- Site structure
- All extracted content

---

### 3. Structured Extraction (`firecrawl_extract`)

Extract structured data from pages using schemas.

**Use When:**
- Extracting product data
- Scraping pricing tables
- Getting team/contact info
- Structured content extraction

**Parameters:**
```
url: "https://example.com/pricing"
schema: {
  "plans": [{
    "name": "string",
    "price": "string",
    "features": ["string"]
  }]
}
```

**Returns:**
- Structured JSON data
- Matches your schema

---

### 4. Search & Scrape (`firecrawl_search`)

Search web and scrape top results.

**Use When:**
- Finding and analyzing top content
- Competitive research
- Content gap analysis

**Parameters:**
```
query: "best CRM for startups 2024"
limit: 10
```

**Returns:**
- Search results
- Scraped content from each

---

## Scraping Patterns

### Competitor Analysis

```
1. Landing page:
   firecrawl_scrape: "https://competitor.com"
   → Extract: headline, value prop, CTAs

2. Pricing:
   firecrawl_extract: "https://competitor.com/pricing"
   → Schema: plans, prices, features

3. Blog inventory:
   firecrawl_crawl: "https://competitor.com/blog"
   → limit: 50
   → Get: all blog post titles, topics, dates
```

### Content Audit

```
1. Crawl content:
   firecrawl_crawl: "https://example.com/resources"
   → Get all content pages

2. Analyze structure:
   → Extract: titles, categories, word counts
   → Identify: content pillars, gaps
```

### SEO Research

```
1. Search top results:
   firecrawl_search: "target keyword"
   → Scrape top 10 results

2. Analyze:
   → Word counts
   → Heading structure
   → Topics covered
   → Internal links
```

### Pricing Intelligence

```
firecrawl_extract: "https://competitor.com/pricing"
schema: {
  "product_name": "string",
  "plans": [{
    "name": "string",
    "price_monthly": "string",
    "price_annual": "string",
    "features": ["string"],
    "limitations": ["string"]
  }],
  "enterprise": "boolean",
  "free_trial": "boolean"
}
```

---

## Extraction Schemas

### Pricing Page Schema
```json
{
  "plans": [{
    "name": "string",
    "price": "string",
    "billing_period": "string",
    "features": ["string"],
    "cta_text": "string"
  }],
  "has_free_tier": "boolean",
  "has_enterprise": "boolean"
}
```

### Team Page Schema
```json
{
  "team_members": [{
    "name": "string",
    "title": "string",
    "bio": "string",
    "linkedin": "string"
  }],
  "total_headcount": "number"
}
```

### Blog Post Schema
```json
{
  "title": "string",
  "author": "string",
  "date": "string",
  "category": "string",
  "read_time": "string",
  "summary": "string",
  "headings": ["string"]
}
```

### Product Page Schema
```json
{
  "product_name": "string",
  "tagline": "string",
  "key_features": ["string"],
  "integrations": ["string"],
  "social_proof": {
    "testimonials": "number",
    "logos": ["string"]
  }
}
```

---

## Output Formatting

### Scrape Summary Template

```
## Scraped: [URL]

### Page Type
[Landing / Blog / Pricing / etc.]

### Key Content

**Headline:** [main headline]

**Value Proposition:** [core message]

**Key Sections:**
1. [Section 1]
2. [Section 2]

### CTAs Found
- [CTA 1]
- [CTA 2]

### Links
- Internal: [count]
- External: [count]

### Raw Content
[Full markdown content below]
```

### Content Inventory Template

```
## Content Inventory: [Site]

### Summary
- Total pages: [count]
- Content types: [list]
- Date range: [oldest] to [newest]

### By Type

| Type | Count | Topics |
|------|-------|--------|
| Blog | [n] | [topics] |
| Case Study | [n] | [industries] |
| Guide | [n] | [themes] |

### Notable Patterns
[Observations about content strategy]
```

---

## Integration with Agents

### research-analyst
- Competitor website analysis
- Market research scraping
- Content audits

### content-strategist
- Competitor content inventory
- Content gap analysis
- Topic research

### vibe-marketer
- Trend research
- Competitor social proof scraping
- Landing page teardowns

### seo-specialist
- SERP analysis
- Competitor SEO audit
- Content structure analysis

---

## Ethical Scraping

### Do
- Respect robots.txt
- Rate limit requests
- Cache results
- Use for research purposes
- Attribute sources

### Don't
- Scrape personal data
- Overwhelm servers
- Scrape behind authentication (without permission)
- Republish scraped content as-is
- Ignore terms of service

---

## Quality Checklist

Before using scraped data:

- [ ] URL is publicly accessible
- [ ] Content is relevant to task
- [ ] Data is properly structured
- [ ] No personal data extracted
- [ ] Source is attributed

---

## Anti-Patterns

1. **Scraping everything** — Be targeted, scrape what you need
2. **No structure** — Use schemas for structured data
3. **Ignoring rate limits** — Don't overwhelm sites
4. **Raw dump** — Synthesize scraped content
5. **Stale data** — Note when content was scraped

---

## Troubleshooting

### "Page not scraping correctly"
- Some pages block scrapers
- Try with different user agent
- Check if JavaScript rendering is needed

### "Missing content"
- Dynamic content may need wait time
- Check if content is in iframe
- Verify URL is correct

### "Rate limited"
- Reduce request frequency
- Implement delays between requests
- Use crawl with lower limit
