# LEGO OS Commands

Slash commands orchestrate multi-agent workflows.
Use them to perform complex engineering and brand tasks consistently.

---

# Review Commands

## `/pragmatic-code-review`
Use for:
- reviewing PRs
- evaluating generated code
- checking logic correctness
- validating test coverage

**Agents:** pragmatic-code-reviewer, pragmatic-code-review-subagent

---

## `/design-review`
Use for:
- reviewing UI screens
- reviewing flows
- checking hierarchy, clarity, spacing
- validating design system usage

**Agents:** design-reviewer, ux-product-strategist

---

## `/ux-review`
Use for:
- evaluating task flows
- identifying friction or confusion
- improving onboarding

**Agents:** ux-product-strategist, design-reviewer

---

## `/ux-copy-review`
Use for:
- reviewing microcopy
- validating brand voice in UI
- checking error messages, CTAs, notifications

**Agents:** ux-writer

---

## `/security-review`
Use for:
- sensitive logic
- auth
- payments
- smart contract interactions

**Agents:** security-auditor, security-review-agent

---

## `/smart-contract-review`
Use for:
- token contracts
- escrow pools
- liquidity mechanics
- role permissions
- invariant checks

**Agents:** solidity-protocol-engineer, security-auditor

---

## `/smart-contract-audit`
Use for:
- comprehensive contract audits
- DeFi mechanism review
- economic risk assessment

**Agents:** security-auditor, solidity-protocol-engineer, defi-risk-engineer

---

## `/architecture-review`
Use for:
- microservice boundaries
- event flows
- system decomposition
- API design
- scalability concerns

**Agents:** senior-architect, backend-engineer, security-auditor

---

## `/spec-review`
Use for:
- validating feature specifications
- checking completeness & clarity
- ensuring feasibility
- aligning engineering with product intent

**Agents:** senior-architect, ux-product-strategist

---

## `/migration-review`
Use for:
- database schema changes
- backfills
- type changes
- index additions
- data migrations at scale

**Agents:** backend-engineer, senior-architect

---

# Brand Strategy Commands

## `/brand-strategy`
Use for:
- full brand strategy development
- founder signal decoding
- brand belief system creation
- SignalOS™ SYNC → PROGRAM → EMIT workflow

**Agents:** brand-strategist, archetype-analyst, brand-identity-architect

---

## `/archetype-analysis`
Use for:
- mapping brand to Jungian archetypes
- identifying primary and shadow archetypes
- ensuring archetypal consistency

**Agents:** archetype-analyst, brand-strategist

---

## `/brand-positioning`
Use for:
- competitive positioning
- Zag framework application
- differentiation strategy

**Agents:** brand-strategist, brand-identity-architect

---

## `/onliness-statement`
Use for:
- creating unique positioning statement
- "Only [brand] does X" formulation
- radical differentiation

**Agents:** brand-strategist

---

# Marketing Commands

## `/gtm-strategy`
Use for:
- go-to-market planning
- launch strategy
- channel selection
- market entry approach

**Agents:** marketing-strategist, brand-strategist, growth-engineer

---

## `/growth-review`
Use for:
- growth loop assessment
- funnel analysis
- viral mechanics review
- retention strategy

**Agents:** growth-engineer, marketing-strategist

---

## `/campaign-plan`
Use for:
- campaign architecture
- Signal Cascade planning
- content calendar
- channel orchestration

**Agents:** marketing-strategist, vibe-marketer, content-strategist

---

# Content & Social Commands

## `/content-strategy`
Use for:
- content pillar development
- editorial calendar creation
- content-brand alignment

**Agents:** content-strategist, brand-strategist

---

## `/social-strategy`
Use for:
- platform strategy
- social content planning
- engagement approach
- platform-specific playbooks

**Agents:** social-media-manager, content-strategist, vibe-marketer

---

## `/community-strategy`
Use for:
- tribe building
- community architecture
- engagement rituals
- member journey design

**Agents:** community-manager, brand-strategist

---

# Communication Design Commands

## `/verbal-identity`
Use for:
- voice and tone guidelines
- language system design
- brand lexicon creation
- messaging architecture

**Agents:** verbal-identity-designer, brand-strategist, copywriter

---

## `/naming`
Use for:
- brand naming
- product naming
- feature naming
- naming system development

**Agents:** verbal-identity-designer, copywriter, brand-identity-architect

---

# Design Commands

## `/visual-identity`
Use for:
- visual identity development
- logo direction
- color system
- typography selection
- imagery guidelines

**Agents:** design-strategist, visual-designer, brand-identity-architect

---

## `/design-brief`
Use for:
- design direction documents
- creative briefs
- project kickoff materials

**Agents:** design-strategist, brand-strategist

---

# Business Strategy Commands

## `/business-strategy`
Use for:
- strategic planning
- where-to-play / how-to-win decisions
- competitive strategy
- strategic roadmap

**Agents:** business-strategist, research-analyst, brand-strategist

---

## `/market-research`
Use for:
- market sizing (TAM/SAM/SOM)
- customer research
- trend analysis
- opportunity assessment

**Agents:** research-analyst, business-strategist

---

## `/competitive-analysis`
Use for:
- competitor profiling
- competitive landscape mapping
- battlecard development
- whitespace identification

**Agents:** research-analyst, business-strategist, brand-strategist

---

# Documentation Commands

## `/write-docs`
Use for:
- READMEs
- how-to guides
- technical docs
- onboarding
- reference docs

**Agents:** docs-writer

---

## `/gitbook-docs`
Use for:
- GitBook-ready pages
- navigation design
- content migration
- concept/guide/reference combo pages

**Agents:** docs-writer

---

# Context & Planning Commands

## `/context-sync`
Use for:
- scanning repo for missing CLAUDE files
- updating context where outdated
- maintaining plan/roadmap/changelog

**Agents:** context-steward

---

## `/product-plan`
Use for:
- generating mission, roadmap, tech-stack, changelog
- project-level documentation
- strategic alignment

**Agents:** context-steward, senior-architect

---

## `/spec-and-plan`
Use for:
- feature specification creation
- task breakdown
- verification checklist generation

**Agents:** senior-architect, ux-product-strategist

---

## `/implement-feature`
Use for:
- feature implementation from specs
- code generation
- test creation

**Agents:** backend-engineer, senior-architect

---

## `/verify-implementation`
Use for:
- checking code against verification checklists
- ensuring spec compliance
- quality validation

**Agents:** pragmatic-code-reviewer, senior-architect

---

# Command Summary by Category

| Category | Commands |
|----------|----------|
| **Review** | `/pragmatic-code-review`, `/design-review`, `/ux-review`, `/ux-copy-review`, `/security-review`, `/smart-contract-review`, `/smart-contract-audit`, `/architecture-review`, `/spec-review`, `/migration-review` |
| **Brand Strategy** | `/brand-strategy`, `/archetype-analysis`, `/brand-positioning`, `/onliness-statement` |
| **Marketing** | `/gtm-strategy`, `/growth-review`, `/campaign-plan` |
| **Content & Social** | `/content-strategy`, `/social-strategy`, `/community-strategy` |
| **Communication** | `/verbal-identity`, `/naming` |
| **Design** | `/visual-identity`, `/design-brief` |
| **Business Strategy** | `/business-strategy`, `/market-research`, `/competitive-analysis` |
| **Documentation** | `/write-docs`, `/gitbook-docs` |
| **Context & Planning** | `/context-sync`, `/product-plan`, `/spec-and-plan`, `/implement-feature`, `/verify-implementation` |

**Total: 37 commands**
