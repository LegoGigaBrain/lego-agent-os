# Getting Started with LEGO Agent OS

Welcome to LEGO Agent OS — a modular, multi-agent operating system for building software and brands with Claude Code.

This guide helps you find the right starting point based on what you have and what you want to achieve.

---

## What Do You Have?

Use this decision tree to find your entry point:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        WHAT DO YOU HAVE?                                │
└─────────────────────────────────────────────────────────────────────────┘
                                   │
        ┌──────────────────────────┼──────────────────────────┐
        │                          │                          │
        ▼                          ▼                          ▼
   ┌─────────┐              ┌─────────────┐            ┌──────────────┐
   │ An Idea │              │ A Validated │            │ An Existing  │
   │  Only   │              │   Product   │            │    Brand     │
   └────┬────┘              └──────┬──────┘            └──────┬───────┘
        │                          │                          │
        ▼                          ▼                          ▼
┌───────────────┐          ┌───────────────┐          ┌───────────────┐
│   PATH A:     │          │   PATH B:     │          │   PATH C:     │
│   /product-   │          │   /brand-     │          │   /content-   │
│   discovery   │          │   discovery   │          │   strategy    │
└───────┬───────┘          └───────┬───────┘          └───────┬───────┘
        │                          │                          │
        │                          │                          │
        ▼                          ▼                          ▼
   Need to                   Ready to                   Ready to
   validate                  articulate                 produce
   the problem?              brand foundations?         content?
        │                          │                          │
        └──────────┬───────────────┘                          │
                   │                                          │
                   ▼                                          │
        ┌─────────────────┐                                   │
        │ Do you need to  │                                   │
        │ build software? │                                   │
        └────────┬────────┘                                   │
                 │                                            │
        ┌────────┴────────┐                                   │
        │                 │                                   │
        ▼                 ▼                                   │
   ┌─────────┐       ┌─────────┐                              │
   │   YES   │       │   NO    │◄─────────────────────────────┘
   └────┬────┘       └────┬────┘
        │                 │
        ▼                 ▼
┌───────────────┐  ┌───────────────┐
│   PATH D:     │  │   PATH E:     │
│   /ralph-plan │  │   /campaign-  │
│   or          │  │   plan        │
│   /spec-and-  │  │               │
│   plan        │  │               │
└───────────────┘  └───────────────┘
```

### Path Descriptions

| Path | You Have | You Want | Start With |
|------|----------|----------|------------|
| **A: Product Discovery** | An idea, but unclear on problem/solution | Validated product concept | `/product-discovery` |
| **B: Brand Discovery** | A validated product, no brand identity | Articulated brand foundations | `/brand-discovery` |
| **C: Content Production** | An existing brand with strategy | Content at scale | `/content-strategy` |
| **D: Software Development** | Brand + product specs | Working software | `/ralph-plan` or `/spec-and-plan` |
| **E: Marketing Launch** | Brand + content ready | Market presence | `/campaign-plan` or `/gtm-strategy` |

---

## Discovery → Execution Flow

LEGO Agent OS separates **discovery** (understanding) from **execution** (doing):

```
┌─────────────────────────────────────────────────────────────────────────┐
│                          DISCOVERY PHASE                                │
│                    (Facilitators ask questions)                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   /product-discovery          /brand-discovery                          │
│         │                           │                                   │
│         ▼                           ▼                                   │
│   ┌─────────────────┐         ┌─────────────────┐                       │
│   │ @ideation-      │         │ @brand-         │                       │
│   │ facilitator     │────────►│ facilitator     │                       │
│   └─────────────────┘         └─────────────────┘                       │
│         │                           │                                   │
│         ▼                           ▼                                   │
│   product-ideation-           brand-discovery-                          │
│   brief.md                    brief.md                                  │
│                                                                         │
└────────────────────────────────┬────────────────────────────────────────┘
                                 │
                          (Living Documents)
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                          EXECUTION PHASE                                │
│                    (Executors build things)                             │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Brand Execution              Software Execution                       │
│         │                           │                                   │
│         ▼                           ▼                                   │
│   ┌─────────────────┐         ┌─────────────────┐                       │
│   │ /brand-strategy │         │ /ralph-plan     │                       │
│   │ /verbal-identity│         │ /spec-and-plan  │                       │
│   │ /visual-identity│         │ /implement-     │                       │
│   └─────────────────┘         │  feature        │                       │
│         │                     └─────────────────┘                       │
│         ▼                           │                                   │
│   ┌─────────────────┐               ▼                                   │
│   │ @brand-strategist│        ┌─────────────────┐                       │
│   │ @verbal-identity-│        │ @ralph-loop-    │                       │
│   │  designer        │        │  architect      │                       │
│   │ @visual-designer │        │ @senior-architect│                      │
│   └─────────────────┘         │ @backend-engineer│                      │
│                               └─────────────────┘                       │
│                                                                         │
│   Content Execution            Marketing Execution                      │
│         │                           │                                   │
│         ▼                           ▼                                   │
│   ┌─────────────────┐         ┌─────────────────┐                       │
│   │ /content-strategy│        │ /gtm-strategy   │                       │
│   │ /social-strategy │        │ /campaign-plan  │                       │
│   └─────────────────┘         │ /growth-review  │                       │
│         │                     └─────────────────┘                       │
│         ▼                           │                                   │
│   ┌─────────────────┐               ▼                                   │
│   │ @content-strategist│      ┌─────────────────┐                       │
│   │ @copywriter      │        │ @marketing-     │                       │
│   │ @social-media-   │        │  strategist     │                       │
│   │  manager         │        │ @growth-engineer│                       │
│   └─────────────────┘         └─────────────────┘                       │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Key Concepts

### Facilitators vs. Executors

LEGO Agent OS has two types of agents:

| Aspect | Facilitators | Executors |
|--------|-------------|-----------|
| **Purpose** | Interview and discover | Build and create |
| **Primary Tool** | Questions | Actions |
| **Output** | Discovery briefs | Deliverables |
| **Examples** | @brand-facilitator, @ideation-facilitator | @brand-strategist, @backend-engineer |
| **Commands** | /brand-discovery, /product-discovery | /brand-strategy, /implement-feature |

**Facilitators** help you articulate what you already know but haven't yet expressed. They ask structured questions and document your answers.

**Executors** take documented foundations and create deliverables. They apply methodologies and produce artifacts.

### Living Documents

Discovery briefs are **living documents** that:
- Capture founder knowledge in one place
- Serve as input for multiple execution workflows
- Get updated as understanding evolves
- Prevent context loss between sessions

Key living documents:
- `product/product-ideation-brief.md` — Product concept and validation
- `brand/brand-discovery-brief.md` — Brand foundations
- `brand/brand-strategy.md` — Full brand strategy
- `docs/project/project-plan.md` — Development roadmap

### Agent Handoffs

Agents don't work in isolation. They hand off to each other:

```
@ideation-facilitator
        │
        │ "Product validated, ready for brand"
        ▼
@brand-facilitator
        │
        │ "Brand foundations documented"
        ▼
@brand-strategist
        │
        │ "Strategy complete, ready for identity"
        ├────────────────┬────────────────┐
        ▼                ▼                ▼
@verbal-identity   @visual-designer   @content-strategist
```

Handoffs are documented in discovery briefs under "Recommended Next Steps."

---

## Quick Commands

### Discovery Commands (Start Here)

| Command | Purpose | Output |
|---------|---------|--------|
| `/product-discovery` | Clarify product concept before brand | product-ideation-brief.md |
| `/brand-discovery` | Articulate brand foundations | brand-discovery-brief.md |

### Brand Execution Commands

| Command | Purpose | Output |
|---------|---------|--------|
| `/brand-strategy` | Full brand strategy from brief | brand-strategy.md |
| `/verbal-identity` | Voice, tone, messaging | verbal-identity-system.md |
| `/visual-identity` | Visual direction and systems | visual-identity-brief.md |
| `/naming` | Name development | naming-candidates.md |

### Content & Marketing Commands

| Command | Purpose | Output |
|---------|---------|--------|
| `/content-strategy` | Content pillars and calendar | content-strategy.md |
| `/social-strategy` | Platform-specific social plans | social-strategy.md |
| `/campaign-plan` | Campaign architecture | campaign-plan.md |
| `/gtm-strategy` | Go-to-market planning | gtm-strategy.md |

### Software Development Commands

| Command | Purpose | Output |
|---------|---------|--------|
| `/ralph-plan` | Generate PRD for autonomous dev | PRD.md + progress.txt |
| `/spec-and-plan` | Technical spec and implementation plan | spec.md |
| `/implement-feature` | Build a feature | Working code |
| `/workflow-new-feature` | End-to-end feature workflow | Complete feature |

### Review Commands

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/code-review` | Code quality review | After implementation |
| `/security-review` | Security assessment | Before deployment |
| `/design-review` | Design quality review | After design work |
| `/architecture-review` | Architecture assessment | Before major changes |

---

## Common Starting Scenarios

### "I have an idea for an app"
1. Start with `/product-discovery` to validate and clarify
2. Then `/brand-discovery` to define brand foundations
3. Then `/brand-strategy` to develop full strategy
4. Then `/ralph-plan` to generate development PRD

### "I have a business but no brand identity"
1. Start with `/brand-discovery` to articulate foundations
2. Then `/brand-strategy` for full strategy
3. Then `/verbal-identity` and `/visual-identity`

### "I need to build a feature"
1. Start with `/spec-and-plan` for technical specification
2. Then `/implement-feature` or `/ralph-plan` for development
3. Then `/code-review` and `/security-review`

### "I need to launch a brand"
1. Use `/workflow-brand-launch` for the complete workflow
2. This orchestrates: brand strategy → verbal identity → visual identity → content strategy

### "I need to fix a bug"
1. Start with `/prp-investigate` to understand the issue
2. Then `/prp-debug` for root cause analysis
3. Then `/prp-fix` to implement the fix

---

## Need Help?

### Documentation
- [Overview](lego-os/overview.md) — System architecture and concepts
- [Agents](lego-os/agents.md) — All available agents
- [Commands](lego-os/commands.md) — All available commands
- [Folder Structure](lego-os/folder-structure.md) — Project organization

### Getting Context
- Run `/context-sync` to update context files
- Check `CLAUDE.base.md` for system rules
- Check `CLAUDE.project.md` for project-specific context

### Troubleshooting
- **Agent not responding as expected?** Check the agent's skill file in `.claude/skills/`
- **Command not working?** Verify prerequisites are met (check command file)
- **Need different output?** Many commands accept parameters or can be customized

### Extending LEGO OS
- Add new agents in `.claude/agents/`
- Add new skills in `.claude/skills/`
- Add new commands in `.claude/commands/`
- Update `.claude/agent-registry.json` to register new components

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                    LEGO OS QUICK REFERENCE                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  DISCOVERY (ask questions, document answers)                │
│  ─────────                                                  │
│  /product-discovery  →  product-ideation-brief.md           │
│  /brand-discovery    →  brand-discovery-brief.md            │
│                                                             │
│  BRAND EXECUTION (create brand assets)                      │
│  ──────────────                                             │
│  /brand-strategy     →  brand-strategy.md                   │
│  /verbal-identity    →  verbal-identity-system.md           │
│  /visual-identity    →  visual-identity-brief.md            │
│                                                             │
│  SOFTWARE EXECUTION (build features)                        │
│  ─────────────────                                          │
│  /ralph-plan         →  PRD.md (for autonomous dev)         │
│  /spec-and-plan      →  spec.md                             │
│  /implement-feature  →  working code                        │
│                                                             │
│  CONTENT EXECUTION (produce content)                        │
│  ─────────────────                                          │
│  /content-strategy   →  content-strategy.md                 │
│  /campaign-plan      →  campaign-plan.md                    │
│                                                             │
│  REVIEWS (quality gates)                                    │
│  ───────                                                    │
│  /code-review        →  review findings                     │
│  /security-review    →  security assessment                 │
│  /design-review      →  design feedback                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```
