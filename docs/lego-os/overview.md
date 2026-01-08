# LEGO Agent OS – Overview

LEGO OS is a modular, multi-agent operating system for building software and brands with Claude Code.

It provides:
- A clean project structure
- World-class engineering standards
- Multi-agent roles organized by department
- Review workflows
- Brand strategy and marketing workflows
- Documentation tooling
- Context file organization
- Commands that orchestrate complex tasks

LEGO OS allows you to build scalable, maintainable, high-quality projects using Claude as a senior engineering and brand strategy team.

---

## Why LEGO OS?

Claude Code is powerful — but without structure, context becomes chaotic.
LEGO OS solves that by offering:

- **Separation of concerns** (agents, commands, skills)
- **Clear standards** (global, backend, frontend, design, security, SignalOS brand)
- **Layered context** (CLAUDE.base → project → folder → spec)
- **Formal review workflows** (code, design, security, architecture, UX)
- **Brand strategy workflows** (positioning, archetypes, tribe building)
- **Marketing workflows** (GTM, campaigns, growth loops)
- **Documentation pipeline** (write-docs, gitbook-docs)
- **Extensibility** (add new agents/skills for any future project)

LEGO OS = *"Build software and brands like a senior organization, using AI."*

---

## Core Concepts

### 🧱 1. Agents
Each agent represents a senior role, organized by department:

**Engineering**
- senior-architect
- backend-engineer
- solidity-protocol-engineer
- security-auditor
- defi-risk-engineer

**Design & UX**
- design-reviewer
- design-strategist
- visual-designer
- ux-product-strategist
- ux-writer

**Brand Strategy**
- brand-strategist
- archetype-analyst
- brand-identity-architect

**Marketing**
- marketing-strategist
- vibe-marketer
- growth-engineer

**Content & Social**
- content-strategist
- social-media-manager
- community-manager

**Communication Design**
- verbal-identity-designer
- copywriter

**Business Strategy & Research**
- business-strategist
- research-analyst

**Documentation & Context**
- docs-writer
- context-steward

They read standards and context, then act accordingly.

---

### 📜 2. Standards
Engineering, design, security, docs, and brand strategy —
centralized in `standards/`
and mirrored as `skills/` for agents to apply.

**Standard Categories:**
- `standards/global/*` – naming, code style, testing
- `standards/backend/*` – API design, data modelling
- `standards/frontend/*` – React, design system, design principles
- `standards/security/*` – secure coding
- `standards/docs/*` – documentation style, context files
- `standards/signalos/*` – brand strategy, tribe building, vibe marketing

This ensures consistency across all work.

---

### 🧩 3. Commands
Slash commands orchestrate multi-agent workflows:

**Review Commands**
- `/pragmatic-code-review`
- `/design-review`
- `/security-review`
- `/architecture-review`
- `/ux-review`
- `/spec-review`
- `/migration-review`
- `/smart-contract-review`
- `/smart-contract-audit`
- `/ux-copy-review`

**Brand Strategy Commands**
- `/brand-strategy`
- `/archetype-analysis`
- `/brand-positioning`
- `/onliness-statement`

**Marketing Commands**
- `/gtm-strategy`
- `/growth-review`
- `/campaign-plan`

**Content & Social Commands**
- `/content-strategy`
- `/social-strategy`
- `/community-strategy`

**Communication Design Commands**
- `/verbal-identity`
- `/naming`

**Design Commands**
- `/visual-identity`
- `/design-brief`

**Business Strategy Commands**
- `/business-strategy`
- `/market-research`
- `/competitive-analysis`

**Documentation Commands**
- `/write-docs`
- `/gitbook-docs`

**Context & Planning Commands**
- `/context-sync`
- `/product-plan`
- `/spec-and-plan`
- `/implement-feature`
- `/verify-implementation`

These are reusable across *all* projects.

---

### 🗂 4. Context Files (CLAUDE Files)

To avoid bloated root context:
- `CLAUDE.base.md` holds LEGO OS rules
- `CLAUDE.project.md` holds project intentions
- folder-level `CLAUDE.md` explain their subdomains
- `docs/project/{plan, roadmap, changelog}.md` capture evolving project knowledge

Agents read these **procedurally** in layers.

---

## Department Structure

LEGO OS organizes agents into functional departments:

| Department | Focus | Key Agents |
|------------|-------|------------|
| **Engineering** | Code, architecture, security | senior-architect, backend-engineer, security-auditor |
| **Design & UX** | Visual design, user experience | design-strategist, visual-designer, ux-product-strategist |
| **Brand Strategy** | Brand positioning, archetypes | brand-strategist, archetype-analyst |
| **Marketing** | GTM, growth, campaigns | marketing-strategist, vibe-marketer, growth-engineer |
| **Content & Social** | Content strategy, community | content-strategist, social-media-manager, community-manager |
| **Communication Design** | Verbal identity, copy | verbal-identity-designer, copywriter, ux-writer |
| **Business Strategy** | Strategy, research | business-strategist, research-analyst |
| **Documentation** | Docs, context management | docs-writer, context-steward |

---

## What LEGO OS Enables

- High-quality engineering at scale
- Comprehensive brand strategy
- Integrated marketing workflows
- Predictable workflows
- Senior-level code & design reviews
- Clean documentation
- Fast onboarding for new contributors
- Easy reuse across multiple projects
- GitBook-ready documentation

It becomes your **AI-native engineering and brand operating system**.
