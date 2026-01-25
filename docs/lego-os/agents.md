# LEGO OS Agents

Agents are senior roles implemented as Claude context files.
Each agent embodies a discipline, applies standards, and participates in workflows.

---

# Engineering Agents

## senior-architect
- maintains high-level system clarity
- defines boundaries between services
- identifies architectural risks
- systems thinking, high-level design

Works with:
- `/architecture-review`
- `/spec-review`

---

## backend-engineer
- designs APIs
- implements backend logic
- ensures correct data modelling
- applies backend standards and secure coding

Works with:
- `/architecture-review`
- `/pragmatic-code-review`

---

## solidity-protocol-engineer
- designs smart contracts
- implements gas-aware patterns
- reviews state machines & invariants

Works with:
- `/smart-contract-review`
- `/smart-contract-audit`

---

## security-auditor
- performs security audits
- analyzes threat models
- evaluates permission boundaries

Works with:
- `/security-review`
- `/smart-contract-review`

---

## defi-risk-engineer
- designs DeFi mechanisms
- evaluates liquidity flows
- assesses economic and regulatory risk

Works with:
- `/smart-contract-audit`
- `/security-review`

---

# Design & UX Agents

## design-reviewer
- checks UI/UX against design principles
- ensures visual consistency & clarity
- validates design system usage

Works with:
- `/design-review`

---

## design-strategist
- provides design direction
- creates design briefs
- aligns visual strategy with brand

Works with:
- `/design-brief`
- `/visual-identity`

---

## visual-designer
- executes visual design
- creates brand assets
- maintains visual consistency

Works with:
- `/visual-identity`
- `/design-brief`

---

## ux-product-strategist
- evaluates flows
- aligns UX with product intent
- reduces friction & confusion

Works with:
- `/ux-review`
- `/design-review`

---

## ux-writer
- writes microcopy
- enforces brand voice in UI
- creates error messages, CTAs, onboarding copy

Works with:
- `/ux-copy-review`

---

# Brand Strategy Agents

## brand-strategist
- decodes founder signals
- architects belief-aligned brand systems
- applies SignalOS™ methodology (SYNC → PROGRAM → EMIT)

Works with:
- `/brand-strategy`
- `/brand-positioning`
- `/onliness-statement`

---

## archetype-analyst
- maps brands to Jungian archetypes
- identifies archetypal patterns
- ensures archetypal consistency

Works with:
- `/archetype-analysis`
- `/brand-strategy`

---

## brand-identity-architect
- translates strategy into identity systems
- creates naming conventions
- designs brand architecture

Works with:
- `/brand-strategy`
- `/naming`
- `/visual-identity`

---

# Marketing Agents

## marketing-strategist
- designs campaign architecture
- creates go-to-market strategies
- aligns marketing with brand signal

Works with:
- `/gtm-strategy`
- `/campaign-plan`

---

## vibe-marketer
- executes rapid content
- creates platform-native content
- surfs trends and cultural moments

Works with:
- `/campaign-plan`
- `/social-strategy`

---

## growth-engineer
- designs growth loops
- builds viral mechanics
- optimizes conversion funnels

Works with:
- `/growth-review`
- `/gtm-strategy`

---

# Content & Social Agents

## content-strategist
- designs content pillars
- creates editorial calendars
- aligns content with brand strategy

Works with:
- `/content-strategy`

---

## social-media-manager
- manages platform presence
- creates platform-specific content
- engages with audience

Works with:
- `/social-strategy`
- `/content-strategy`

---

## community-manager
- builds and nurtures tribes
- manages community health
- facilitates member engagement

Works with:
- `/community-strategy`

---

# Communication Design Agents

## verbal-identity-designer
- creates voice and tone guidelines
- designs language systems
- builds brand lexicon

Works with:
- `/verbal-identity`
- `/naming`

---

## copywriter
- writes strategic copy
- creates headlines, taglines, body copy
- applies copywriting frameworks (AIDA, PAS, 4Cs)

Works with:
- `/naming`
- `/verbal-identity`
- `/campaign-plan`

---

# Business Strategy & Research Agents

## business-strategist
- develops business strategy
- makes where-to-play/how-to-win choices
- creates strategic roadmaps

Works with:
- `/business-strategy`
- `/competitive-analysis`

---

## research-analyst
- conducts market research
- performs competitive analysis
- gathers customer insights

Works with:
- `/market-research`
- `/competitive-analysis`

---

# Documentation & Context Agents

## docs-writer
- writes documentation
- writes GitBook pages
- constructs developer onboarding

Works with:
- `/write-docs`
- `/gitbook-docs`

---

## context-steward
- manages CLAUDE files
- ensures folder-level context is fresh
- syncs project plan, roadmap, changelog

Works with:
- `/context-sync`

---

# Code Review Agents

## pragmatic-code-reviewer
- performs senior-level code reviews
- focuses on correctness, clarity, maintainability
- identifies security issues

Works with:
- `/pragmatic-code-review`

---

## pragmatic-code-review-subagent
- supports primary code reviewer
- performs focused analysis
- detects patterns

Works with:
- `/pragmatic-code-review`

---

## security-review-agent
- performs security-focused reviews
- identifies vulnerabilities
- suggests mitigations

Works with:
- `/security-review`

---

# PRPs Investigation Agents

## prp-analyst
- investigates GitHub issues systematically
- performs hypothesis-driven debugging
- applies PRPs (Product Requirement Prompts) methodology
- maps issues to codebase locations
- produces investigation and debug reports

Works with:
- `/prp-investigate`
- `/prp-debug`
- `/prp-fix`

---

# Automation Agents

## ralph-loop-architect
- generates PRDs for canonical Ralph Wiggum autonomous development
- sizes user stories to fit ONE context window (~10 min)
- orders stories by dependencies (schema first, UI last)
- estimates iteration counts based on story complexity
- creates PRD.md with checkboxes and progress.txt for learnings

Works with:
- `/ralph-plan`

**Canonical Workflow:**
1. Ideate with Claude (clarifying questions)
2. Run `/ralph-plan` to generate PRD.md + progress.txt
3. Run in terminal: `./scripts/ralph/ralph.ps1 -MaxIterations 25`
4. Review results with `/security-review`, `/pragmatic-code-review`

---

# How Agents Work Together

Agents collaborate inside commands.

**Example: `/brand-strategy`** activates:
- brand-strategist (primary)
- archetype-analyst
- brand-identity-architect

**Example: `/gtm-strategy`** activates:
- marketing-strategist (primary)
- brand-strategist
- growth-engineer

**Example: `/architecture-review`** activates:
- senior-architect
- backend-engineer
- security-reviewer
- docs-writer (for notes)

---

# Agent Summary by Department

| Department | Agents |
|------------|--------|
| **Engineering** | senior-architect, backend-engineer, solidity-protocol-engineer, security-auditor, defi-risk-engineer |
| **Design & UX** | design-reviewer, design-strategist, visual-designer, ux-product-strategist, ux-writer |
| **Brand Strategy** | brand-strategist, archetype-analyst, brand-identity-architect |
| **Marketing** | marketing-strategist, vibe-marketer, growth-engineer |
| **Content & Social** | content-strategist, social-media-manager, community-manager |
| **Communication Design** | verbal-identity-designer, copywriter |
| **Business Strategy** | business-strategist, research-analyst |
| **Documentation** | docs-writer, context-steward |
| **Code Review** | pragmatic-code-reviewer, pragmatic-code-review-subagent, security-review-agent |
| **PRPs Investigation** | prp-analyst |
| **Automation** | ralph-loop-architect |

**Total: 31 agents**
