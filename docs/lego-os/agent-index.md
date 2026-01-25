# Agent Index

> Comprehensive index of all agents in LEGO Agent OS, organized by department.

## Quick Reference

| Department | Agent Count | Primary Focus |
|------------|-------------|---------------|
| [Engineering](#engineering) | 9 | Backend, smart contracts, security, architecture |
| [Strategy](#strategy) | 3 | Business strategy, brand/product discovery |
| [Brand](#brand) | 4 | Brand strategy, identity, verbal systems |
| [Design](#design) | 4 | Visual design, UX strategy, AI creative |
| [Content](#content) | 3 | Content strategy, copywriting, UX writing |
| [Marketing](#marketing) | 5 | Campaigns, growth, social, community |
| [Research](#research) | 2 | Market research, user research |
| [Product](#product) | 2 | Product strategy, UX flows |
| [Analytics](#analytics) | 1 | Measurement frameworks, KPIs |
| [Operations](#operations) | 3 | Context management, PRD generation, debugging |

---

## Engineering

### @senior-architect
**System architecture, boundaries, and high-level design decisions.**

| Attribute | Value |
|-----------|-------|
| Primary Skill | skill-backend-design-checklist |
| Key Commands | `/architecture-review`, `/spec-and-plan`, `/migration-review` |
| Escalation Target | Yes (receives escalations from other engineers) |
| When to Use | System architecture decisions, module boundaries, technical tradeoffs, when other engineers are blocked |

---

### @backend-engineer
**Design, implement, and maintain backend services, APIs, and data models.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-backend-api-standards, skill-data-modelling-standards, skill-testing-standards |
| Key Commands | `/implement-feature`, `/pragmatic-code-review` |
| Escalates To | @senior-architect, @security-auditor |
| When to Use | API development, database work, backend services, Node.js/TypeScript implementation |

---

### @solidity-protocol-engineer
**Design and implement secure, gas-aware smart contracts and tests.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-solidity-style-security, skill-smart-contract-auditor |
| Key Commands | `/implement-feature`, `/smart-contract-review` |
| Escalates To | @senior-architect, @security-auditor, @defi-risk-engineer |
| When to Use | Smart contract development, Solidity implementation, protocol design, EVM development |

---

### @security-auditor
**Perform focused security reviews and threat modeling for changes.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-secure-coding-standards, skill-smart-contract-auditor |
| Key Commands | `/security-review`, `/smart-contract-review`, `/smart-contract-audit` |
| Escalation Target | Yes (final authority on security decisions) |
| When to Use | Security-sensitive code, smart contract audits, vulnerability assessment, threat modeling |

---

### @defi-risk-engineer
**Designs DeFi mechanisms, liquidity flows, and risk parameters; evaluates economic and regulatory risk.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-smart-contract-auditor, skill-smart-contract-audit-checklist |
| Key Commands | `/smart-contract-review` |
| Escalation Target | Yes (for DeFi-specific risk decisions) |
| When to Use | DeFi mechanisms, liquidity flows, risk parameters, economic/regulatory risk, oracle design |

---

### @pragmatic-code-reviewer
**Senior-level code reviewer focused on correctness, clarity, maintainability, and safety.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-code-style-standards, skill-review-structure, skill-review-dimensions |
| Key Commands | `/pragmatic-code-review`, `/code-review` |
| When to Use | Code review, PR review, code quality assessment |

---

### @pragmatic-code-reviewer-subagent
**Supports the primary code reviewer with focused analysis, pattern detection, and suggestions.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-review-structure, skill-review-dimensions |
| Key Commands | (Internal only - not directly invocable) |
| When to Use | Supporting the primary code reviewer with focused analysis |

---

### @security-review-agent
**Security specialist for focused security reviews and threat modeling.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-secure-coding-standards |
| Key Commands | `/security-review` |
| When to Use | Focused security reviews, threat modeling for changes |

---

### @design-reviewer
**Perform structured, senior-level design reviews for UX flows, UI screens, and component implementations.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-design-principles, skill-ux-review-checklist, skill-design-system-standards |
| Key Commands | `/design-review` |
| When to Use | Design review for UX flows, UI screens, component implementations |

---

## Strategy

### @brand-facilitator
**Brand discovery facilitator who interviews founders through structured brand discovery to uncover brand foundations before strategy execution.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-brand-facilitation, skill-customer-design |
| Key Commands | `/brand-discovery` |
| Escalates To | @brand-strategist, @verbal-identity-designer, @visual-designer |
| When to Use | Brand discovery sessions, founder interviews to uncover brand foundations before strategy execution |

---

### @ideation-facilitator
**Product discovery facilitator who interviews founders through structured ideation sessions to clarify product concepts before brand development.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-product-ideation |
| Key Commands | `/product-discovery` |
| Escalates To | @brand-facilitator, @user-researcher, @research-analyst, @senior-architect, @business-strategist, @product-manager |
| When to Use | Product discovery sessions, clarifying product concepts before brand development |

---

### @business-strategist
**Senior business strategist who develops business strategy, market positioning, competitive analysis, and strategic planning.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-business-strategy, skill-competitive-analysis, skill-market-research |
| Key Commands | `/business-strategy`, `/competitive-analysis`, `/market-research` |
| When to Use | Business strategy, market positioning, competitive analysis, strategic planning |

---

## Brand

### @brand-strategist
**Senior brand strategist who decodes founder signals and architects belief-aligned brand systems using the SignalOS methodology.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-zag-positioning, skill-brand-flip, skill-onliness-statement, skill-brand-narrative |
| Key Commands | `/brand-strategy`, `/brand-positioning`, `/onliness-statement`, `/archetype-analysis`, `/brand-narrative` |
| When to Use | Brand strategy, positioning, founder discovery, cultural tension mapping, brand systems |

---

### @archetype-analyst
**Specialist in Jungian archetypes who maps brands and founders to archetypal patterns for deeper resonance and consistency.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-brand-archetypes |
| Key Commands | `/archetype-analysis` |
| When to Use | Jungian archetype mapping for brands and founders |

---

### @brand-identity-architect
**Brand system designer who translates brand strategy into comprehensive identity systems including naming, visual direction, and brand architecture.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-naming-systems, skill-visual-identity, skill-brand-launch |
| Key Commands | `/naming`, `/visual-identity` |
| When to Use | Brand identity systems, naming, visual direction, brand architecture |

---

### @verbal-identity-designer
**Language architect who designs verbal identity systems including voice, tone, vocabulary, and messaging architecture.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-verbal-identity, skill-copywriting |
| Key Commands | `/verbal-identity` |
| When to Use | Verbal identity systems, voice, tone, vocabulary, messaging architecture |

---

## Design

### @design-strategist
**Design strategist who translates brand strategy into visual direction, provides creative briefs, and ensures design work is strategically grounded.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-design-direction, skill-design-principles, skill-visual-identity |
| Key Commands | `/design-brief` |
| When to Use | Visual direction, creative briefs, strategic design grounding |

---

### @visual-designer
**Visual designer who creates brand identity systems, marketing materials, and visual assets aligned with brand strategy. Integrates with AI Creative Stack for image generation.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-visual-identity, skill-image-prompts, skill-replicate-image-gen, skill-ai-creative-stack |
| Key Commands | `/visual-identity`, `/generate-image`, `/creative-brief` |
| When to Use | Brand identity systems, marketing materials, visual assets, AI image generation |

---

### @ai-creative-strategist
**AI creative director who orchestrates end-to-end creative production using the AI Creative Stack — from strategic briefs through image generation to video production.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-ai-creative-stack, skill-replicate-image-gen, skill-glif-workflows, skill-image-prompts |
| Key Commands | `/generate-image`, `/creative-brief` |
| When to Use | AI creative production, image generation, video production |

---

### @ux-product-strategist
**Design user flows, UX states, and product copy that align with the product strategy.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-product-designer-ui, skill-feature-idea-validator, skill-ux-review-checklist |
| Key Commands | `/ux-review`, `/design-review`, `/spec-and-plan` |
| When to Use | User flows, UX states, product copy, product strategy alignment |

---

## Content

### @content-strategist
**Senior content strategist who designs content systems, editorial calendars, and content pillars that amplify brand signal and serve the tribe.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-content-strategy, skill-editorial-calendar, skill-content-matrix |
| Key Commands | `/content-strategy`, `/content-matrix` |
| When to Use | Content systems, editorial calendars, content pillars, content strategy |

---

### @copywriter
**Strategic copywriter who writes compelling copy across all touchpoints, from headlines to long-form, that converts attention into action.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-copywriting, skill-marketing-writer |
| Key Commands | (Works through other workflows) |
| When to Use | Compelling copy across touchpoints, headlines, long-form, conversion copy |

---

### @ux-writer
**Senior UX writer who enforces brand voice across microcopy - notifications, errors, empty states, onboarding, CTAs, and transactional messaging.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-ux-writing-brand-voice, skill-copywriting |
| Key Commands | `/ux-copy-review` |
| When to Use | Microcopy, notifications, errors, empty states, onboarding, CTAs, transactional messaging |

---

## Marketing

### @marketing-strategist
**Senior marketing strategist who designs campaign architecture, growth loops, and go-to-market strategies aligned with brand signal.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-campaign-architecture, skill-go-to-market, skill-growth-loops, skill-channel-strategy |
| Key Commands | `/gtm-strategy`, `/campaign-plan` |
| When to Use | Campaign architecture, growth loops, go-to-market strategies |

---

### @vibe-marketer
**Rapid-execution content marketer who ships trend-native content fast, iterates based on signal, and creates platform-specific campaigns.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-vibe-marketing, skill-content-matrix, skill-ai-creative-stack |
| Key Commands | `/content-matrix` |
| When to Use | Rapid content execution, trend-native content, platform-specific campaigns |

---

### @growth-engineer
**Growth systems architect who designs sustainable growth loops, optimizes funnels, and builds data-driven acquisition and retention engines.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-growth-loops, skill-channel-strategy |
| Key Commands | `/growth-review` |
| When to Use | Growth loops, funnel optimization, acquisition/retention engines |

---

### @social-media-manager
**Social media strategist who designs platform strategies, manages community engagement, and builds tribe presence across social channels.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-social-media-strategy, skill-content-strategy |
| Key Commands | `/social-strategy` |
| When to Use | Platform strategies, community engagement, social presence |

---

### @community-manager
**Community builder who nurtures tribe spaces, facilitates member engagement, and grows loyal communities that embody the brand.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-community-management, skill-tribe-building |
| Key Commands | `/community-strategy` |
| When to Use | Community building, member engagement, tribe cultivation |

---

## Research

### @research-analyst
**Research analyst who conducts market research, competitive analysis, customer research, and trend analysis to inform strategic decisions.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-market-research, skill-competitive-analysis, skill-perplexity-research, skill-firecrawl-scraping |
| Key Commands | `/market-research`, `/competitive-analysis` |
| When to Use | Market research, competitive analysis, customer research, trend analysis |

---

### @user-researcher
**User researcher who designs and conducts research studies, synthesizes findings, and surfaces actionable customer insights.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-user-research, skill-market-research, skill-competitive-analysis |
| Key Commands | (Works through other workflows) |
| When to Use | User interviews, usability testing, research synthesis, customer insights |

---

## Product

### @product-manager
**Product manager who translates strategy into specs, prioritizes features, and aligns teams around product roadmap.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-product-management, skill-feature-idea-validator, skill-business-strategy |
| Key Commands | `/spec-and-plan`, `/product-plan` |
| When to Use | Product strategy, roadmap planning, feature prioritization, requirements definition |

---

### @ux-product-strategist
*See [Design](#design) section - this agent bridges product and design.*

---

## Analytics

### @analytics-strategist
**Analytics strategist who designs measurement frameworks, defines KPIs, and builds dashboards that drive data-informed decisions.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-measurement-frameworks, skill-data-modelling-standards, skill-business-strategy |
| Key Commands | (Works through other workflows) |
| When to Use | Measurement frameworks, KPI definition, dashboard design, data-driven decision making |

---

## Operations

### @context-steward
**Keeps CLAUDE context files and project meta-docs tidy, up-to-date, and properly layered. Manages Project Matrix Notion workspaces.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-project-matrix |
| Key Commands | `/context-sync`, `/project-matrix-sync` |
| When to Use | CLAUDE context files, project meta-docs, Notion workspace management |

---

### @ralph-loop-architect
**Designs PRDs and user stories for canonical Ralph Wiggum autonomous development.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-ralph-wiggum |
| Key Commands | `/ralph-plan` |
| When to Use | PRD generation for Ralph Wiggum canonical workflow, story sizing, autonomous development preparation |

---

### @prp-analyst
**Issue investigation and root cause analysis specialist who applies the PRPs methodology for systematic debugging and fix planning.**

| Attribute | Value |
|-----------|-------|
| Primary Skills | skill-prps-methodology |
| Key Commands | `/prp-investigate`, `/prp-debug`, `/prp-fix` |
| When to Use | Bug investigation, debugging, root cause analysis using PRPs methodology |

---

## Agent Selection Guide

### By Task Type

| Task | Recommended Agent(s) |
|------|---------------------|
| "I have an idea but haven't validated it" | @ideation-facilitator |
| "I need to discover my brand foundations" | @brand-facilitator |
| "I need brand strategy and positioning" | @brand-strategist |
| "I need to build an API" | @backend-engineer |
| "I need smart contract development" | @solidity-protocol-engineer |
| "I need a security audit" | @security-auditor |
| "I need to review code" | @pragmatic-code-reviewer |
| "I need content strategy" | @content-strategist |
| "I need rapid marketing content" | @vibe-marketer |
| "I need to plan a feature" | @ralph-loop-architect |
| "I'm debugging a bug" | @prp-analyst |

### By Workflow Phase

```
Discovery Phase:
  @ideation-facilitator → @brand-facilitator

Strategy Phase:
  @brand-strategist → @verbal-identity-designer → @visual-designer

Execution Phase:
  @content-strategist → @copywriter → @vibe-marketer
  @senior-architect → @backend-engineer → @pragmatic-code-reviewer
```

---

## Related Documentation

- [Skills Index](./skills-index.md) - Comprehensive index of all skills
- [Workflow Paths](./workflow-paths.md) - Complete workflow diagrams
- [Facilitator Layer](./facilitator-layer.md) - How facilitators work
- [Getting Started](../getting-started.md) - Entry point selection guide
