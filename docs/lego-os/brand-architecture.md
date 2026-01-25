# Brand Architecture

Brand architecture defines how a company organizes and structures its brands. LEGO Agent OS supports multiple brand architecture models, enabling agencies to manage single brands, brand portfolios, or complex multi-brand organizations.

---

## Why Brand Architecture Matters

Before executing brand work, you need clarity on:

1. **How many brands?** — Single brand vs. portfolio
2. **How related?** — Shared identity vs. independent identities
3. **How structured?** — Centralized assets vs. distributed systems

Brand architecture decisions affect:
- Folder structure in your project
- How agents analyze brand relationships
- Which brand documents agents reference
- How consistency is maintained across brands

---

## Architecture Models

### 1. Branded House

**Definition:** One master brand applied across all products and services. Sub-brands exist as descriptive extensions of the parent.

**Example:** Google

```
Google
├── Google Search
├── Google Maps
├── Google Cloud
├── Google Workspace
└── Google Ads
```

**Characteristics:**
- Strong parent brand equity
- Consistent visual identity across all offerings
- Products inherit brand trust
- Unified brand voice and values

**Folder Structure:**

```
brand/
├── brand-strategy.md           # Single brand strategy
├── verbal-identity.md          # Unified voice
├── visual-identity.md          # Consistent visual system
├── brand-discovery-brief.md    # One discovery brief
│
├── products/                   # Product-specific content
│   ├── search/
│   │   └── product-messaging.md
│   ├── maps/
│   │   └── product-messaging.md
│   └── cloud/
│       └── product-messaging.md
│
└── content/                    # Unified content library
    ├── content-pillars.md
    └── content-calendar.md
```

**Agent Behavior:**
- All agents reference the single `brand-strategy.md`
- @verbal-identity-designer creates one voice guide used everywhere
- @copywriter applies consistent voice across products
- Product-specific messaging extends (doesn't override) parent brand

**When to Use:**
- Strong corporate brand with high recognition
- Products benefit from parent brand trust
- Consistent customer experience is critical
- Operational efficiency is prioritized

---

### 2. House of Brands

**Definition:** A portfolio of distinct, independently positioned brands. The parent company is invisible to consumers.

**Example:** Procter & Gamble (P&G)

```
P&G (corporate, not consumer-facing)
├── Tide (laundry)
├── Pampers (baby care)
├── Gillette (grooming)
├── Oral-B (dental)
└── Olay (skincare)
```

**Characteristics:**
- Each brand has its own identity
- No visible parent brand connection
- Brands can target different segments
- Brands can compete in same category
- Risk isolation (one brand's crisis doesn't affect others)

**Folder Structure:**

```
portfolio/
├── portfolio-strategy.md       # Overall portfolio strategy
│
├── tide/
│   ├── brand/
│   │   ├── brand-strategy.md
│   │   ├── verbal-identity.md
│   │   ├── visual-identity.md
│   │   └── brand-discovery-brief.md
│   └── content/
│       └── content-pillars.md
│
├── pampers/
│   ├── brand/
│   │   ├── brand-strategy.md
│   │   ├── verbal-identity.md
│   │   ├── visual-identity.md
│   │   └── brand-discovery-brief.md
│   └── content/
│       └── content-pillars.md
│
├── gillette/
│   └── brand/
│       └── ...
│
└── shared/                     # Shared resources (internal only)
    ├── research/
    └── templates/
```

**Agent Behavior:**
- Agents work within a specific brand folder
- Each brand has complete, independent documentation
- @brand-strategist analyzes each brand separately
- @research-analyst may analyze portfolio-level trends
- No cross-brand voice or identity sharing

**When to Use:**
- Serving fundamentally different customer segments
- Operating in multiple unrelated categories
- Acquisitions with strong existing brand equity
- Risk isolation is important
- Brands need to compete with each other

---

### 3. Endorsed Brands

**Definition:** Sub-brands that carry their own identity but are endorsed by a parent brand. The parent provides credibility while sub-brands have distinct positioning.

**Example:** Marriott

```
Marriott (endorsing parent)
├── The Ritz-Carlton by Marriott
├── W Hotels by Marriott
├── Courtyard by Marriott
├── Residence Inn by Marriott
└── Fairfield by Marriott
```

**Characteristics:**
- Sub-brands have distinct personalities
- Parent brand provides trust endorsement
- "by [Parent]" or "[Parent] Presents" naming
- Sub-brands can target different segments
- Shared loyalty programs, systems, standards

**Folder Structure:**

```
brand/
├── parent/
│   ├── brand-strategy.md           # Parent brand core
│   ├── endorsement-guidelines.md   # How endorsement appears
│   ├── shared-values.md            # Values all brands share
│   └── visual-identity.md          # Parent visual standards
│
├── sub-brands/
│   ├── ritz-carlton/
│   │   ├── brand-strategy.md       # Distinct luxury positioning
│   │   ├── verbal-identity.md      # Elegant, refined voice
│   │   ├── visual-identity.md      # Extends parent + unique elements
│   │   └── brand-discovery-brief.md
│   │
│   ├── w-hotels/
│   │   ├── brand-strategy.md       # Distinct lifestyle positioning
│   │   ├── verbal-identity.md      # Bold, contemporary voice
│   │   ├── visual-identity.md      # Distinct visual with endorsement
│   │   └── brand-discovery-brief.md
│   │
│   └── courtyard/
│       └── brand/
│           └── ...
│
└── shared/
    ├── loyalty-program/
    └── service-standards/
```

**Agent Behavior:**
- Agents reference both parent and sub-brand documents
- @brand-strategist ensures sub-brand aligns with parent values
- @visual-designer incorporates endorsement mark consistently
- @verbal-identity-designer creates distinct voice within parent guardrails
- Shared standards are inherited, not duplicated

**When to Use:**
- Sub-brands need distinct personalities
- Parent brand trust accelerates new offerings
- Different price points or segments within related category
- Want benefits of both brand house and house of brands

---

### 4. Hybrid Architecture

**Definition:** A combination of architectures where some brands are tightly integrated (branded house) while others are independent (house of brands) or endorsed.

**Example:** Virgin

```
Virgin (parent)
├── Virgin Atlantic (endorsed - travel)
├── Virgin Mobile (endorsed - telecom)
├── Virgin Galactic (endorsed - space)
├── Virgin Hotels (endorsed - hospitality)
│
└── Virgin Investments (house of brands)
    ├── Portfolio companies with no Virgin branding
    └── Separate identity investments
```

**Characteristics:**
- Multiple architecture patterns coexist
- Strategic decisions about brand connection
- Flexibility to acquire without rebranding
- Core brand where it adds value
- Separate brands where independence needed

**Folder Structure:**

```
portfolio/
├── virgin-core/
│   ├── brand-strategy.md           # Core Virgin brand
│   ├── verbal-identity.md          # Virgin voice
│   ├── visual-identity.md          # Virgin visual system
│   └── licensing-guidelines.md     # Rules for Virgin endorsement
│
├── endorsed/                       # Brands using Virgin name
│   ├── virgin-atlantic/
│   │   ├── brand/
│   │   └── content/
│   ├── virgin-mobile/
│   │   ├── brand/
│   │   └── content/
│   └── virgin-hotels/
│       ├── brand/
│       └── content/
│
├── independent/                    # Brands without Virgin
│   ├── company-a/
│   │   ├── brand/                  # Completely independent
│   │   └── content/
│   └── company-b/
│       ├── brand/
│       └── content/
│
└── shared/
    ├── portfolio-strategy.md       # How all pieces fit together
    └── architecture-map.md         # Visual map of brand relationships
```

**Agent Behavior:**
- Agents must first identify which architecture pattern applies
- @brand-strategist checks `architecture-map.md` before work
- Endorsed brands reference parent + own docs
- Independent brands only reference their own docs
- Portfolio-level analysis considers all brands

**When to Use:**
- Complex organizations with history of acquisitions
- Different strategic needs across business units
- Gradual transitions between architectures
- Flexibility is more valuable than consistency

---

## Agent Behavior for Portfolio Analysis

When working with multi-brand organizations, agents exhibit specific behaviors:

### Discovery Phase

| Agent | Single Brand | Multi-Brand |
|-------|--------------|-------------|
| @ideation-facilitator | Standard discovery | Ask about portfolio context |
| @brand-facilitator | Standard discovery | Ask about brand architecture |
| @user-researcher | One customer set | Multiple customer sets |

### Strategy Phase

| Agent | Single Brand | Multi-Brand |
|-------|--------------|-------------|
| @brand-strategist | Create strategy | Create strategy + portfolio fit analysis |
| @research-analyst | Market research | Competitive analysis across portfolio |
| @business-strategist | Business strategy | Portfolio strategy + cannibalization analysis |

### Execution Phase

| Agent | Single Brand | Multi-Brand |
|-------|--------------|-------------|
| @verbal-identity-designer | One voice | Voice per brand + consistency checks |
| @visual-designer | One system | System per brand + shared elements |
| @content-strategist | One content strategy | Content strategy per brand |

### Portfolio-Specific Questions

When agents detect multi-brand context, they ask:

1. **Architecture Type:** "Is this a branded house, house of brands, endorsed, or hybrid?"
2. **Brand Relationship:** "How does this brand relate to the parent/siblings?"
3. **Shared Elements:** "What elements are shared across brands?"
4. **Differentiation:** "How is this brand distinct from siblings?"
5. **Cannibalization:** "Could this brand compete with siblings?"

---

## Relevant Commands

| Command | Description | Best For |
|---------|-------------|----------|
| `/brand-discovery` | Single brand discovery | Any architecture (per brand) |
| `/brand-strategy` | Brand strategy development | Individual brand in any architecture |
| `/verbal-identity` | Voice and language design | Individual brand voice |
| `/visual-identity` | Visual system design | Individual brand visuals |
| `/competitive-analysis` | Market positioning analysis | Understanding brand differentiation |
| `/market-research` | Market and customer research | Portfolio-level insights |

### Multi-Brand Workflow

For house of brands or hybrid architectures:

1. **Portfolio Strategy** — Define overall portfolio strategy first
2. **Per-Brand Discovery** — Run `/brand-discovery` for each brand
3. **Per-Brand Strategy** — Develop each brand with appropriate commands
4. **Consistency Check** — Review shared elements and differentiation
5. **Documentation** — Maintain architecture map and guidelines

---

## Choosing Your Architecture

| Factor | Branded House | House of Brands | Endorsed | Hybrid |
|--------|---------------|-----------------|----------|--------|
| Brand equity sharing | High | None | Moderate | Varies |
| Marketing efficiency | High | Low | Moderate | Moderate |
| Target flexibility | Low | High | Moderate | High |
| Risk isolation | Low | High | Moderate | High |
| Acquisition flexibility | Low | High | Moderate | High |
| Complexity | Low | Moderate | Moderate | High |

### Decision Questions

1. **How related are your offerings?** — Related → Branded House, Unrelated → House of Brands
2. **Does parent brand add value?** — Yes → Endorsed or Branded House
3. **Do brands need to compete?** — Yes → House of Brands
4. **How important is risk isolation?** — Critical → House of Brands
5. **Do you acquire often?** — Yes → House of Brands or Hybrid

---

## Setting Up Your Brand Architecture

### Step 1: Determine Architecture Type

Answer the decision questions above or run `/brand-discovery` with portfolio context.

### Step 2: Create Folder Structure

Use the appropriate folder structure template from this document.

### Step 3: Create Core Documents

- For Branded House: Single brand folder with product sub-folders
- For House of Brands: Portfolio folder with independent brand folders
- For Endorsed: Parent folder + sub-brand folders
- For Hybrid: Portfolio strategy + mixed structures

### Step 4: Document Relationships

Create an `architecture-map.md` that visualizes:
- Which brands exist
- How they relate to each other
- What's shared vs. independent
- How endorsement appears (if applicable)

### Step 5: Configure Agent Context

Agents will ask about architecture when they detect:
- Multiple brand folders
- Portfolio-level documents
- References to parent/sibling brands

---

## Related Documentation

- [Facilitator Layer](./facilitator-layer.md) — Discovery before strategy
- [Workflow Paths](./workflow-paths.md) — Complete workflow options
- [Getting Started](../getting-started.md) — Choose your entry point
