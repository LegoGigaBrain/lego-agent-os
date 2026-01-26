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

## `/brand-narrative`
Use for:
- origin story development
- brand mythology creation
- narrative moat documentation
- story principles and storytelling guidelines

**Agents:** brand-strategist, archetype-analyst, copywriter

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

## `/content-matrix`
Use for:
- creating Notion-based content production systems
- building cross-platform content workflows
- setting up platform-specific databases (X, Instagram, TikTok, LinkedIn, Facebook, Blog)
- enabling vibe-marketer content execution

**Agents:** content-strategist, vibe-marketer, social-media-manager

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

## `/generate-image`
Use for:
- AI image generation with Replicate/Flux
- social media graphics
- marketing visuals
- product mockups
- concept visualization

**Agents:** ai-creative-strategist, visual-designer, vibe-marketer

---

## `/creative-brief`
Use for:
- end-to-end creative production workflow
- AI Creative Stack orchestration
- multi-option image generation
- video production briefing

**Agents:** ai-creative-strategist, visual-designer

---

# Content Optimization Commands

## `/seo-content`
Use for:
- search-optimized content creation
- keyword research and clustering
- on-page SEO optimization
- content gap analysis
- SERP feature targeting

**Agents:** content-strategist, research-analyst

---

## `/geo-content`
Use for:
- AI/LLM citation optimization (GEO)
- optimizing content for AI answer engines
- improving discoverability in Perplexity, ChatGPT, Gemini
- authority signal building
- structured content for LLM retrieval

**Agents:** content-strategist, research-analyst

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

## `/project-matrix`
Use for:
- creating Notion-based project management workspaces
- setting up strategy, goals, milestones, deliverables tracking
- configuring project-type specific workflows (Code, Brand, Website, Physical)
- establishing team roles and decisions log

**Agents:** context-steward, senior-architect, brand-strategist

---

## `/project-matrix-sync`
Use for:
- syncing local specs to Notion Deliverables database
- importing roadmap milestones to Notion
- creating GitHub issues for flagged deliverables
- keeping local artifacts and Notion in sync

**Agents:** context-steward, senior-architect

---

# PRPs Issue & Debug Commands

## `/prp-investigate`
Use for:
- analyzing GitHub issues systematically
- mapping issues to codebase locations
- forming and testing hypotheses about root cause
- producing investigation reports

**Agents:** prp-analyst, senior-architect

**Output:** Investigation report at `docs/prps/issues/`

---

## `/prp-debug`
Use for:
- structured root cause analysis
- hypothesis-driven debugging
- isolating bugs to specific file:line
- documenting debug process

**Agents:** prp-analyst

**Output:** Debug report at `docs/prps/reports/debug/`

---

## `/prp-fix`
Use for:
- implementing fixes based on investigation/debug reports
- routing to appropriate workflow (direct, `/spec-and-plan`, or `/ralph-loop`)
- verifying fixes and documenting changes

**Agents:** prp-analyst, backend-engineer, senior-architect

**Output:** Fix report at `docs/prps/issues/completed/`

---

# Automation Commands

## `/ralph-plan`
Use for:
- generating PRD.md with user stories and checkboxes
- creating progress.txt for learnings accumulation
- preparing for autonomous Ralph Wiggum execution
- story sizing and dependency ordering

**The Workflow:**
1. Ideate with Claude (describe what you want to build)
2. Run `/ralph-plan` to generate PRD.md and progress.txt
3. Run the script in terminal: `./scripts/ralph/ralph.ps1 -MaxIterations 25`
4. Review results back in Claude Code

**Output:**
- `PRD.md` - User stories with `[ ]` checkboxes
- `progress.txt` - Learnings log (append-only)
- Suggested iteration count

**Key Rule:** Each story must be completable in ONE context window (~10 min of AI work).

---

## `/ralph-loop` (DEPRECATED)

**This command has been deprecated.** The plugin-based approach continues in the same session with compaction, causing context rot.

**Use the canonical workflow instead:**
1. Run `/ralph-plan` to generate files
2. Run in terminal: `./scripts/ralph/ralph.ps1 -MaxIterations 25`

The canonical approach spawns a **fresh Claude Code instance** per iteration.

See: `.claude/skills/skill-ralph-wiggum.md` for full documentation.

---

## Ralph Advanced Features

**Parallel Execution:**
```powershell
./scripts/ralph/ralph.ps1 -Parallel -Workers 3
```

**Webhook Notifications:**
Configure in `.ralph/config.yaml` for Discord/Slack alerts.

**Playwright Integration:**
Enable browser testing for UI tasks in config.

**Config File:**
```bash
mkdir -p .ralph
cp scripts/ralph/config.template.yaml .ralph/config.yaml
```

---

# Command Summary by Category

| Category | Commands |
|----------|----------|
| **Review** | `/pragmatic-code-review`, `/design-review`, `/ux-review`, `/ux-copy-review`, `/security-review`, `/smart-contract-review`, `/smart-contract-audit`, `/architecture-review`, `/spec-review`, `/migration-review` |
| **Brand Strategy** | `/brand-strategy`, `/archetype-analysis`, `/brand-positioning`, `/onliness-statement`, `/brand-narrative` |
| **Marketing** | `/gtm-strategy`, `/growth-review`, `/campaign-plan` |
| **Content & Social** | `/content-strategy`, `/social-strategy`, `/community-strategy`, `/content-matrix` |
| **Communication** | `/verbal-identity`, `/naming` |
| **Design** | `/visual-identity`, `/design-brief`, `/generate-image`, `/creative-brief` |
| **Content Optimization** | `/seo-content`, `/geo-content` |
| **Business Strategy** | `/business-strategy`, `/market-research`, `/competitive-analysis` |
| **Documentation** | `/write-docs`, `/gitbook-docs` |
| **Context & Planning** | `/context-sync`, `/product-plan`, `/spec-and-plan`, `/implement-feature`, `/verify-implementation`, `/project-matrix`, `/project-matrix-sync` |
| **PRPs Issue & Debug** | `/prp-investigate`, `/prp-debug`, `/prp-fix` |
| **Automation** | `/ralph-plan`, `/ralph-loop` (deprecated) |

**Total: 52 commands**
