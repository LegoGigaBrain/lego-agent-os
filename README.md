LEGO Agent OS

A reusable multi-agent development operating system for Claude Code

This repository contains a complete multi-agent framework designed to help you build world-class software, protocols, and products using Claude Code.

## 📖 Getting Started

**New to LEGO OS?** Start here: [**docs/getting-started.md**](docs/getting-started.md)

### Common Starting Points

| What You Have | Start With | Command |
|--------------|------------|---------|
| Just an idea | Product Discovery | `/product-discovery` |
| Validated product, need brand | Brand Discovery | `/brand-discovery` |
| Brand ready, need features | Feature Planning | `/ralph-plan` |
| Specs ready, need code | Implementation | `/implement-feature` |

### Quick Decision Guide

```
Do you have a validated product idea?
├── NO → /product-discovery (clarify your idea first)
└── YES → Do you have brand foundations?
          ├── NO → /brand-discovery (build your brand)
          └── YES → /ralph-plan or /spec-and-plan (build features)
```

LEGO OS gives you:

Senior-level multi-agent teams

Template-driven product docs

Structured feature specifications

Standards-driven engineering workflows

Automatic context maintenance

Powerful multi-agent commands

Everything is orchestrated through Claude Code.

🚀 Quick Start
1. Open this folder in Claude Code

Claude automatically loads:

.claude/agents/

.claude/commands/

.claude/skills/

CLAUDE.base.md

all templates and standards

2. Initialize a project

Run:
/context-sync

This will:

generate mission, roadmap, tech-stack, changelog

create folder-level CLAUDE.md files

set up a clean project structure

ensure specs/templates align

3. Define your first feature
/spec-and-plan "booking flow v1"

This will generate:
docs/specs/booking-flow/
  feature-spec.md
  tasks-breakdown.md
  verification-checklist.md

4. Build it
/implement-feature

5. Review it
/code-review
/security-review
/smart-contract-review
/verify-implementation

🧱 Folder Structure

.claude/
  agents/
  commands/
  skills/
  review/

product-templates/
  mission.template.md
  roadmap.template.md
  tech-stack.template.md
  changelog.template.md

spec-templates/
  feature-spec.template.md
  tasks-breakdown.template.md
  verification-checklist.template.md

standards/
docs/
templates/
ai-docs/
prp-templates/
CLAUDE.base.md
README.md

🧠 Core Concepts

Agents = Senior specialists (architect, backend, solidity, security, UX, DeFi risk)

Skills = Standardized behaviors (security, testing, UI, auditing, writing)

Commands = Multi-agent workflows

Templates = Blueprint generators

Context Sync = Automated maintenance

LEGO OS turns Claude Code into a structured, disciplined engineering organization.

📦 Included Agents

Senior Architect

Backend Engineer

Frontend Engineer

Solidity Protocol Engineer

Security Auditor

UX/Product Strategist

Docs Writer

DeFi Risk Engineer

Ralph PRD Architect

PRP Analyst

Product Manager (NEW)

User Researcher (NEW)

Analytics Strategist (NEW)

...and more (34 total)

🔧 Included Skills

UI Product Design

Feature Idea Validation

Solidity Style & Security

Smart Contract Auditor

Test Author

Marketing Writer

Ralph Wiggum Iterative Development

PRPs Methodology (Issue Investigation & Debugging)

...plus mirrored global standards

🛠 Commands (Workflows)

/product-plan

/spec-and-plan

/context-sync

/smart-contract-review

/security-review

/verify-implementation

/write-docs

/gitbook-docs

/ralph-plan (generates PRD for autonomous development)

/prp-investigate

/prp-debug

/prp-fix

/ai-docs-sync (NEW)

/workflow-new-feature (NEW)

/workflow-bug-fix (NEW)

/workflow-brand-launch (NEW)

/workflow-smart-contract (NEW)

📘 Documentation

All LEGO OS system docs live under:
docs/lego-os/

Including:

overview

folder structure

agents

commands

review framework

context rules

PRPs integration

resource allocation (NEW)

Ralph Wiggum Canonical Workflow

agent registry (NEW)

escalation matrix (NEW)

🧩 Extend LEGO OS

You can add:

new agents

new standards

new skills

new commands

new templates

…all without breaking the OS.
