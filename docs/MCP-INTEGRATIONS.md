# MCP Integrations Guide

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         LEGO-OS MCP STACK                                   │
│              "External capabilities through standardized interfaces"        │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Overview

LEGO-OS integrates with external services via Model Context Protocol (MCP) servers. These extend agent capabilities beyond built-in tools.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│    RESEARCH STACK              CREATIVE STACK           AUTOMATION STACK   │
│    ──────────────              ──────────────           ────────────────   │
│                                                                             │
│    ┌──────────────┐            ┌──────────────┐         ┌──────────────┐   │
│    │  Perplexity  │            │  Replicate   │         │  Playwright  │   │
│    │  AI Search   │            │  Image Gen   │         │  Browser     │   │
│    └──────────────┘            └──────────────┘         └──────────────┘   │
│                                                                             │
│    ┌──────────────┐            ┌──────────────┐         ┌──────────────┐   │
│    │  Firecrawl   │            │    Glif      │         │    Notion    │   │
│    │  Scraping    │            │  Workflows   │         │  Databases   │   │
│    └──────────────┘            └──────────────┘         └──────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Installation

### Prerequisites

1. Node.js 18+
2. Claude Desktop or Claude Code
3. API keys for each service

### Configuration File Location

**Claude Desktop (Windows):**
```
%APPDATA%\Claude\claude_desktop_config.json
```

**Claude Desktop (macOS):**
```
~/Library/Application Support/Claude/claude_desktop_config.json
```

**Claude Code:**
```
.claude/settings.local.json (per-project)
~/.claude/settings.json (global)
```

---

## MCP Server Configurations

### Complete Configuration

```json
{
  "mcpServers": {
    "perplexity": {
      "command": "npx",
      "args": ["-y", "@anthropic/perplexity-mcp"],
      "env": {
        "PERPLEXITY_API_KEY": "your-perplexity-api-key"
      }
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": {
        "FIRECRAWL_API_KEY": "your-firecrawl-api-key"
      }
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "@anthropic/playwright-mcp"]
    },
    "replicate": {
      "command": "npx",
      "args": ["-y", "@gongrzhe/image-gen-server"],
      "env": {
        "REPLICATE_API_TOKEN": "your-replicate-api-token"
      }
    },
    "glif": {
      "command": "npx",
      "args": ["-y", "@glifxyz/glif-mcp-server"],
      "env": {
        "GLIF_API_TOKEN": "your-glif-api-token"
      }
    },
    "notion": {
      "command": "npx",
      "args": ["-y", "@anthropic/notion-mcp"],
      "env": {
        "NOTION_API_KEY": "your-notion-api-key"
      }
    }
  }
}
```

---

## Research Stack

### Perplexity MCP

**Purpose:** AI-powered web search with citations and reasoning

**Source:** [perplexityai/modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol)

**API Key:** [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api)

**Tools Provided:**

| Tool | Model | Use Case |
|------|-------|----------|
| `perplexity_search` | Search API | Quick web searches with results |
| `perplexity_chat` | sonar-pro | Conversational queries with web context |
| `perplexity_research` | sonar-deep-research | In-depth research with citations |
| `perplexity_reason` | sonar-reasoning-pro | Complex analysis and reasoning |

**Best For:**
- Competitive intelligence
- Market research
- Fact-checking
- Current events
- Quick answers with sources

**Agent Access:**
- `research-analyst` — Primary user
- `content-strategist` — Research for content
- `marketing-strategist` — Market intelligence
- `brand-strategist` — Cultural research

---

### Firecrawl MCP

**Purpose:** Deep web scraping with JavaScript rendering

**Source:** [firecrawl/firecrawl-mcp-server](https://github.com/firecrawl/firecrawl-mcp-server)

**API Key:** [firecrawl.dev/app/api-keys](https://www.firecrawl.dev/app/api-keys)

**Tools Provided:**

| Tool | Purpose |
|------|---------|
| `firecrawl_scrape` | Scrape single URL to markdown |
| `firecrawl_crawl` | Crawl entire site |
| `firecrawl_extract` | Extract structured data |
| `firecrawl_search` | Search and scrape results |

**Best For:**
- Competitor website analysis
- Content scraping for research
- Structured data extraction
- SEO audits
- Price monitoring

**Agent Access:**
- `research-analyst` — Competitive scraping
- `content-strategist` — Content audits
- `seo-specialist` — SEO analysis
- `vibe-marketer` — Trend research

---

## Creative Stack

### Replicate MCP

**Purpose:** AI image generation (Flux, SDXL, etc.)

**Source:** [GongRzhe/Image-Generation-MCP-Server](https://github.com/GongRzhe/Image-Generation-MCP-Server)

**API Key:** [replicate.com/account/api-tokens](https://replicate.com/account/api-tokens)

**Tools Provided:**

| Tool | Purpose |
|------|---------|
| `generate_image` | Generate images from text prompts |
| `generate_variations` | Create variations of existing images |

**Parameters:**
- `prompt` — Text description
- `aspect_ratio` — 1:1, 16:9, 9:16, 4:3, 3:4
- `num_outputs` — 1-4 images
- `output_format` — webp, png, jpg

**Best For:**
- Social media graphics
- Marketing visuals
- Concept visualization
- Product mockups

**Agent Access:**
- `visual-designer` — Primary user
- `vibe-marketer` — Social content
- `ai-creative-strategist` — Creative direction

---

### Glif MCP

**Purpose:** Pre-built AI creative workflows

**Source:** [glifxyz/glif-mcp-server](https://github.com/glifxyz/glif-mcp-server)

**API Key:** [glif.app/settings](https://glif.app/settings)

**Tools Provided:**

| Tool | Purpose |
|------|---------|
| `run_glif` | Execute a specific workflow |
| `search_glifs` | Find workflows by keyword |
| `get_glif_info` | Get workflow details |
| `list_featured` | Browse featured workflows |
| `list_my_glifs` | Access personal workflows |

**Best For:**
- Complex image generation pipelines
- Meme creation
- Style transfers
- Custom creative workflows
- Video thumbnail generation

**Agent Access:**
- `visual-designer` — Creative execution
- `ai-creative-strategist` — Workflow orchestration
- `vibe-marketer` — Meme/trend content

---

## Automation Stack

### Playwright MCP

**Purpose:** Browser automation and interaction

**Source:** [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp)

**No API Key Required** (runs locally)

**Tools Provided:**

| Tool | Purpose |
|------|---------|
| `playwright_navigate` | Go to URL |
| `playwright_click` | Click element |
| `playwright_fill` | Fill form fields |
| `playwright_screenshot` | Capture page |
| `playwright_get_text` | Extract text content |

**Best For:**
- Authenticated scraping
- Form automation
- UI testing
- Screenshot capture
- Interactive site navigation

**Agent Access:**
- `research-analyst` — Authenticated research
- `security-auditor` — Security testing
- `qa-engineer` — UI testing

---

### Notion MCP

**Purpose:** Database and page management

**Source:** Built-in or @anthropic/notion-mcp

**API Key:** [notion.so/my-integrations](https://www.notion.so/my-integrations)

**Tools Provided:**

| Tool | Purpose |
|------|---------|
| `notion_create_page` | Create new pages |
| `notion_update_page` | Update existing pages |
| `notion_query_database` | Query database entries |
| `notion_create_database` | Create new databases |
| `notion_add_entry` | Add database entries |

**Best For:**
- Project Matrix management
- Content Matrix operations
- Documentation storage
- Task tracking
- Knowledge base

**Agent Access:**
- `context-steward` — Project Matrix
- `vibe-marketer` — Content Matrix
- `content-strategist` — Editorial planning

---

## Agent-MCP Matrix

Which agents can use which MCPs:

| Agent | Perplexity | Firecrawl | Replicate | Glif | Playwright | Notion |
|-------|------------|-----------|-----------|------|------------|--------|
| research-analyst | ✅ | ✅ | | | ✅ | |
| content-strategist | ✅ | ✅ | | | | ✅ |
| marketing-strategist | ✅ | ✅ | | | | |
| brand-strategist | ✅ | | | | | |
| vibe-marketer | ✅ | ✅ | ✅ | ✅ | | ✅ |
| visual-designer | | | ✅ | ✅ | | |
| ai-creative-strategist | ✅ | | ✅ | ✅ | | |
| context-steward | | | | | | ✅ |
| security-auditor | | | | | ✅ | |

---

## Workflow Examples

### Research Workflow

```
1. Perplexity: "Who are the top 5 competitors in X space?"
   └── Returns: Summary with citations

2. Firecrawl: Scrape competitor websites
   └── Returns: Structured content

3. Perplexity: "Analyze these competitor positioning statements"
   └── Returns: Comparative analysis
```

### Creative Workflow

```
1. AI Creative Strategist: Develop creative brief
   └── Returns: Visual direction, style guide

2. Replicate: Generate image options
   └── Returns: Multiple images

3. Glif: Run enhancement workflow
   └── Returns: Polished final images
```

### Content Research Workflow

```
1. Perplexity: "What topics are trending in X industry?"
   └── Returns: Trend report

2. Firecrawl: Scrape top-ranking articles
   └── Returns: Content structure analysis

3. Perplexity: "What questions do people ask about X?"
   └── Returns: FAQ opportunities
```

---

## Troubleshooting

### Common Issues

**"MCP server not found"**
- Ensure Node.js 18+ is installed
- Run `npx -y [package]` manually to verify
- Check command path in config

**"API key invalid"**
- Verify key in env section
- Check for trailing whitespace
- Ensure key has correct permissions

**"Connection timeout"**
- Check internet connection
- Verify service status
- Increase timeout in config

### Verification

Test each MCP is working:

```bash
# Test Perplexity
npx -y @anthropic/perplexity-mcp --test

# Test Firecrawl
npx -y firecrawl-mcp --test

# Test Playwright
npx -y @anthropic/playwright-mcp --test
```

---

## Security Notes

1. **Never commit API keys** to version control
2. **Use environment variables** or secure config
3. **Rotate keys regularly**
4. **Monitor usage** for unexpected activity
5. **Limit agent access** to necessary MCPs only

---

## Adding New MCPs

When adding a new MCP to LEGO-OS:

1. Add configuration to this document
2. Update Agent-MCP Matrix
3. Update relevant agent files with MCP in `tools:` field
4. Create skill file if needed for complex workflows
5. Update Visual Guide documentation
