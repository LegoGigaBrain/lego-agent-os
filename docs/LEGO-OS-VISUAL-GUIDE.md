# LEGO-OS VISUAL GUIDE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              LEGO-OS                                        │
│         "Senior specialists as code. Standards as law."                     │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE CORE ARCHITECTURE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│    USER REQUEST                                                             │
│    "Build this feature" / "Review this code" / "Create brand strategy"     │
│                                                                             │
│                                    │                                        │
│                                    ▼                                        │
│    ┌────────────────────────────────────────────────────────────────┐      │
│    │                     CONTEXT LAYER                              │      │
│    │   CLAUDE.base.md → CLAUDE.project.md → folder/CLAUDE.md        │      │
│    │                          +                                      │      │
│    │   /standards/ (code, security, brand, docs)                    │      │
│    │                          +                                      │      │
│    │   /skills/ (reusable behaviors & checklists)                   │      │
│    └────────────────────────────────────────────────────────────────┘      │
│                                    │                                        │
│                                    ▼                                        │
│    ┌────────────────────────────────────────────────────────────────┐      │
│    │                     /COMMAND                                    │      │
│    │   Slash command routes to orchestrated workflow                 │      │
│    │   /code-review, /brand-strategy, /implement-feature...         │      │
│    └────────────────────────────────────────────────────────────────┘      │
│                                    │                                        │
│                                    ▼                                        │
│    ┌────────────────────────────────────────────────────────────────┐      │
│    │                     AGENT EXECUTION                             │      │
│    │   CLARIFY → EXPLORE → PLAN → EXECUTE → VALIDATE                 │      │
│    └────────────────────────────────────────────────────────────────┘      │
│                                    │                                        │
│                    ┌───────────────┼───────────────┐                       │
│                    ▼               ▼               ▼                       │
│              ┌──────────┐   ┌──────────┐   ┌──────────┐                    │
│              │  AGENT   │   │  SKILLS  │   │  TOOLS   │                    │
│              │          │   │          │   │          │                    │
│              │ 27       │   │ 54       │   │ Built-in │                    │
│              │ senior   │   │ reusable │   │ Read,    │                    │
│              │ specs    │   │ behaviors│   │ Write,   │                    │
│              │          │   │          │   │ Bash,    │                    │
│              │ (can     │   │ (auto-   │   │ Grep...  │                    │
│              │ delegate │   │ loaded   │   │          │                    │
│              │ to other │   │ by agent │   │ MCP:     │                    │
│              │ agents)  │   │ type)    │   │ Notion,  │                    │
│              │          │   │          │   │ Web...   │                    │
│              └──────────┘   └──────────┘   └──────────┘                    │
│                    │               │               │                       │
│                    └───────────────┼───────────────┘                       │
│                                    ▼                                        │
│    ┌────────────────────────────────────────────────────────────────┐      │
│    │                     STRUCTURED OUTPUT                           │      │
│    │   Summary → Changes → Testing → Risks/Follow-ups                │      │
│    └────────────────────────────────────────────────────────────────┘      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE AGENT UNIVERSE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           27 AGENTS                                         │
│                  "Each one a senior specialist"                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ENGINEERING                          BRAND & STRATEGY                      │
│  ────────────                         ────────────────                      │
│                                                                             │
│  ┌─────────────────────┐              ┌─────────────────────┐              │
│  │ senior-architect    │              │ brand-strategist    │              │
│  │ "System boundaries" │              │ "Signal decoder"    │              │
│  └─────────────────────┘              └─────────────────────┘              │
│           │                                    │                            │
│           ▼                                    ▼                            │
│  ┌─────────────────────┐              ┌─────────────────────┐              │
│  │ backend-engineer    │              │ content-strategist  │              │
│  │ solidity-engineer   │              │ marketing-strategist│              │
│  │ security-auditor    │              │ business-strategist │              │
│  └─────────────────────┘              └─────────────────────┘              │
│           │                                    │                            │
│           ▼                                    ▼                            │
│  ┌─────────────────────┐              ┌─────────────────────┐              │
│  │ code-reviewer       │              │ copywriter          │              │
│  │ design-reviewer     │              │ verbal-identity     │              │
│  │ security-reviewer   │              │ visual-designer     │              │
│  └─────────────────────┘              └─────────────────────┘              │
│           │                                    │                            │
│           ▼                                    ▼                            │
│  ┌─────────────────────┐              ┌─────────────────────┐              │
│  │ ux-product-strat    │              │ vibe-marketer       │              │
│  │ ux-writer           │              │ social-media-mgr    │              │
│  │ docs-writer         │              │ community-manager   │              │
│  └─────────────────────┘              └─────────────────────┘              │
│                                                                             │
│  SUPPORT AGENTS                                                             │
│  ──────────────                                                             │
│  context-steward · archetype-analyst · research-analyst · growth-engineer  │
│  defi-risk-engineer · brand-identity-architect · design-strategist         │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE WORKFLOW: CLARIFY → EXECUTE → VALIDATE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         AGENT EXECUTION LOOP                                │
│                                                                             │
│    1. CLARIFY                                                               │
│       │  Restate task                                                       │
│       │  Ask for missing context                                            │
│       │  Confirm scope                                                      │
│       ▼                                                                     │
│    2. EXPLORE                                                               │
│       │  Read relevant files                                                │
│       │  Understand current state                                           │
│       │  Identify dependencies                                              │
│       ▼                                                                     │
│    3. PLAN                                                                  │
│       │  Break into 3-7 bullets                                             │
│       │  Identify risks                                                     │
│       │  Get approval if needed                                             │
│       ▼                                                                     │
│    4. EXECUTE                                                               │
│       │  Small, reviewable steps                                            │
│       │  Apply standards                                                    │
│       │  Delegate to specialists when needed (@security-auditor)            │
│       ▼                                                                     │
│    5. VALIDATE                                                              │
│          Run checks/tests                                                   │
│          Summarize changes                                                  │
│          Note follow-ups                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE CONTEXT HIERARCHY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         CONTEXT LOADING                                     │
│                    "Right context, right granularity"                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    CLAUDE.base.md                    ← OS rules (global, immutable)         │
│         │                                                                   │
│         ▼                                                                   │
│    CLAUDE.project.md                 ← Project specifics                    │
│         │                                                                   │
│         ▼                                                                   │
│    docs/project/                                                            │
│    ├── mission.md                    ← Value proposition                    │
│    ├── roadmap.md                    ← Priorities & phases                  │
│    ├── tech-stack.md                 ← Technology choices                   │
│    └── changelog.md                  ← Historical changes                   │
│         │                                                                   │
│         ▼                                                                   │
│    folder/CLAUDE.md                  ← Local conventions                    │
│         │                                                                   │
│         ▼                                                                   │
│    docs/specs/<feature>/                                                    │
│    ├── feature-spec.md               ← Feature details                      │
│    ├── tasks-breakdown.md            ← Implementation tasks                 │
│    └── verification-checklist.md     ← Acceptance criteria                  │
│         │                                                                   │
│         ▼                                                                   │
│    Source Code                                                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE STANDARDS SYSTEM

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            STANDARDS                                        │
│                      "Standards > Agent preferences"                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    /standards/global/              /standards/backend/                      │
│    ├── naming.md                   ├── api-design.md                        │
│    ├── code-style.md               └── data-modelling.md                    │
│    └── testing-principles.md                                                │
│                                                                             │
│    /standards/frontend/            /standards/security/                     │
│    ├── design-system.md            └── secure-coding.md                     │
│    ├── react-components.md                                                  │
│    └── design-principles.md                                                 │
│                                                                             │
│    /standards/signalos/            /standards/docs/                         │
│    ├── transmission-framework.md   ├── context-files.md                     │
│    ├── brand-strategy.md           └── docs-style.md                        │
│    ├── vibe-marketing.md                                                    │
│    ├── cultural-brands.md                                                   │
│    └── tribe-building.md                                                    │
│                                                                             │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │  RULE: If instruction conflicts with standard,                  │     │
│    │        agent notifies user and asks which takes precedence      │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE SKILLS LIBRARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           54 SKILLS                                         │
│               "Reusable behaviors, auto-invoked by context"                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  CODE QUALITY                         REVIEW & DOCS                         │
│  ────────────                         ─────────────                         │
│  skill-naming-standards               skill-reviewer-voice                  │
│  skill-code-style-standards           skill-review-structure                │
│  skill-testing-standards              skill-review-dimensions               │
│  skill-backend-api-standards          skill-docs-style                      │
│  skill-data-modelling-standards       skill-gitbook-docs                    │
│  skill-react-components-standards                                           │
│  skill-design-system-standards                                              │
│  skill-secure-coding-standards                                              │
│                                                                             │
│  TECHNICAL CHECKLISTS                 BRAND & STRATEGY (SignalOS)           │
│  ────────────────────                 ───────────────────────────           │
│  skill-smart-contract-audit           skill-zag-positioning                 │
│  skill-backend-design-checklist       skill-brand-flip                      │
│  skill-ux-review-checklist            skill-brand-narrative                 │
│                                       skill-brand-archetypes                │
│                                       skill-brand-launch                    │
│                                       skill-onliness-statement              │
│                                       skill-tribe-building                  │
│                                       skill-copywriting                     │
│                                       skill-verbal-identity                 │
│                                       skill-visual-identity                 │
│                                       skill-content-strategy                │
│                                       skill-content-matrix                  │
│                                       skill-project-matrix                  │
│                                       skill-competitive-analysis            │
│                                       skill-market-research                 │
│                                       skill-campaign-architecture           │
│                                       skill-go-to-market                    │
│                                       skill-growth-loops                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE COMMAND SYSTEM

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          39+ COMMANDS                                       │
│                    "Multi-agent workflows as slash commands"                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  DEVELOPMENT                          PLANNING & SPECS                      │
│  ───────────                          ────────────────                      │
│  /implement-feature                   /spec-and-plan                        │
│  /code-review                         /product-plan                         │
│  /pragmatic-code-review               /context-sync                         │
│  /security-review                     /project-matrix                       │
│  /smart-contract-audit                /project-matrix-sync                  │
│  /architecture-review                                                       │
│  /design-review                       DOCUMENTATION                         │
│  /ux-review                           ─────────────                         │
│  /verify-implementation               /write-docs                           │
│                                       /gitbook-docs                         │
│                                       /ux-copy-review                       │
│                                                                             │
│  BRAND & MARKETING                    STRATEGY & RESEARCH                   │
│  ─────────────────                    ───────────────────                   │
│  /brand-strategy                      /competitive-analysis                 │
│  /brand-narrative                     /market-research                      │
│  /brand-positioning                   /archetype-analysis                   │
│  /content-strategy                                                          │
│  /content-matrix                                                            │
│  /marketing-strategy                                                        │
│  /campaign-plan                                                             │
│  /gtm-strategy                                                              │
│  /social-strategy                                                           │
│  /community-strategy                                                        │
│  /verbal-identity                                                           │
│  /visual-identity                                                           │
│  /design-brief                                                              │
│  /onliness-statement                                                        │
│  /naming                                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## SIGNALOS: THE BRAND OPERATING SYSTEM

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                             SignalOS                                        │
│              "Brands as programmable realities, not marketing"              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                         SYNC                                     │     │
│    │   Founder discovery → Extract core signal → Map cultural tension │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                        PROGRAM                                   │     │
│    │   Positioning → Language stack → Visual direction → Identity     │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                         EMIT                                     │     │
│    │   Execute through all channels → Content → Community → Culture   │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                                                             │
│  KEY FRAMEWORKS:                                                            │
│  ───────────────                                                            │
│  ZAG Positioning (17 checkpoints)    Brand Flip (I AM + POV)                │
│  Onliness Statement                  Archetypal Mapping (12 archetypes)     │
│  Language Stack                      Narrative Moat                         │
│  6 Laws of Cultural Brands           8 Commodity Traits                     │
│  Tribe Building                      Hero/Hub/Hygiene/Moment                │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## PROJECT MATRIX: NOTION INTEGRATION

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         PROJECT MATRIX                                      │
│                  "Notion-based project management"                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    DATABASES                          VIEWS                                 │
│    ─────────                          ─────                                 │
│    Strategy & Goals (OKRs)            Kanban (by status)                    │
│    Milestones (phases)                Timeline/Gantt (by dates)             │
│    Deliverables (features→tasks)      Calendar (due dates)                  │
│    Workstreams (parallel tracks)      By Workstream                         │
│    Team & Roles                                                             │
│    Decisions Log                                                            │
│                                                                             │
│    PROJECT PRESETS                                                          │
│    ───────────────                                                          │
│    ┌────────────┐  ┌────────────┐  ┌────────────┐  ┌────────────┐          │
│    │    CODE    │  │   BRAND    │  │  WEBSITE   │  │  PHYSICAL  │          │
│    │            │  │            │  │            │  │            │          │
│    │ Backend    │  │ Strategy   │  │ Discovery  │  │ Design     │          │
│    │ Frontend   │  │ Identity   │  │ Design     │  │ Procure    │          │
│    │ DevOps     │  │ Verbal     │  │ Dev        │  │ Build      │          │
│    │ QA         │  │ Visual     │  │ Launch     │  │ Install    │          │
│    └────────────┘  └────────────┘  └────────────┘  └────────────┘          │
│                                                                             │
│    COMMANDS:                                                                │
│    /project-matrix       → Create new Notion workspace                      │
│    /project-matrix-sync  → Sync specs/roadmap/issues to Notion              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## CONTENT MATRIX: NOTION CONTENT PRODUCTION

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         CONTENT MATRIX                                      │
│                 "Content production pipeline in Notion"                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                      CONTENT DATABASE                            │     │
│    │   Ideas → Drafts → Review → Scheduled → Published → Repurposed   │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│         ┌──────────────────────────┼──────────────────────────┐            │
│         ▼                          ▼                          ▼            │
│    ┌──────────┐            ┌──────────────┐           ┌──────────────┐     │
│    │ PILLARS  │            │   FORMATS    │           │  PLATFORMS   │     │
│    │          │            │              │           │              │     │
│    │ P1       │            │ Thread       │           │ Twitter/X    │     │
│    │ P2       │            │ Carousel     │           │ LinkedIn     │     │
│    │ P3       │            │ Reel/Short   │           │ Instagram    │     │
│    │ P4       │            │ Long-form    │           │ Newsletter   │     │
│    │ ...      │            │ Newsletter   │           │ Blog         │     │
│    └──────────┘            └──────────────┘           └──────────────┘     │
│                                                                             │
│    VIEWS: Calendar · Kanban · By Pillar · By Platform · By Format          │
│                                                                             │
│    COMMAND: /content-matrix → Create Notion content workspace               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## UNIFIED REVIEW STRUCTURE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        REVIEW OUTPUT FORMAT                                 │
│                 "All reviews follow the same structure"                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    1. SUMMARY              Brief overview (2-4 sentences)                   │
│       │                                                                     │
│       ▼                                                                     │
│    2. STRENGTHS            What's working well                              │
│       │                                                                     │
│       ▼                                                                     │
│    3. PRIMARY CONCERNS     Top blockers                                     │
│       │                                                                     │
│       ▼                                                                     │
│    4. DETAILED FINDINGS    Grouped by severity:                             │
│       │                    • Critical (must fix)                            │
│       │                    • Major (should fix)                             │
│       │                    • Minor (nice-to-have)                           │
│       ▼                                                                     │
│    5. IMPACT ANALYSIS      Business/user consequences                       │
│       │                                                                     │
│       ▼                                                                     │
│    6. RECOMMENDATIONS      Concrete next steps                              │
│       │                                                                     │
│       ▼                                                                     │
│    7. NEXT ACTIONS         Immediate tasks                                  │
│       │                                                                     │
│       ▼                                                                     │
│    8. CONFIDENCE LEVEL     High / Medium / Low                              │
│       │                                                                     │
│       ▼                                                                     │
│    9. DIMENSIONS SCORE     Correctness · Clarity · Maintainability ·        │
│                            Safety · Completeness · Impact                   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## AGENT DELEGATION PATTERN

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        MULTI-AGENT COORDINATION                             │
│                  "Any agent can delegate to specialists"                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                    PRIMARY AGENT                                 │     │
│    │              (leads the workflow)                                │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│              Reaches domain boundary (e.g., security-critical code)         │
│                                    │                                        │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │              @security-auditor                                   │     │
│    │              @code-reviewer                                      │     │
│    │              @ux-writer                                          │     │
│    │              (specialist reviews specific aspect)                │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│                        Returns findings to primary agent                    │
│                                    │                                        │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │              PRIMARY AGENT                                       │     │
│    │              (integrates feedback, continues)                    │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                                                             │
│    NOTATION: Use @agent-name to invoke specialist                           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## THE FOUR CORE TRUTHS

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         LEGO-OS PRINCIPLES                                  │
├────────────────────────────────────┬────────────────────────────────────────┤
│ Truth                              │ What It Means                          │
├────────────────────────────────────┼────────────────────────────────────────┤
│ Standards > Agent Preferences      │ If conflict, standards win. Always.    │
├────────────────────────────────────┼────────────────────────────────────────┤
│ Context at Right Granularity       │ Load only what's needed, when needed   │
├────────────────────────────────────┼────────────────────────────────────────┤
│ Specialists, Not Generalists       │ Each agent is a senior in one domain   │
├────────────────────────────────────┼────────────────────────────────────────┤
│ Structured Output, Every Time      │ Summary → Changes → Testing → Risks    │
└────────────────────────────────────┴────────────────────────────────────────┘
```

---

## THE COMPLETE FLOW

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            LEGO-OS FLOW                                     │
│                                                                             │
│    USER                                                                     │
│    "Help me build X"                                                        │
│         │                                                                   │
│         ▼                                                                   │
│    ┌──────────────────────────────────────────────────┐                    │
│    │  CONTEXT LAYER (auto-loaded)                     │                    │
│    │  CLAUDE.base → CLAUDE.project → /standards/      │                    │
│    └──────────────────────────────────────────────────┘                    │
│         │                                                                   │
│         ▼                                                                   │
│    ┌──────────────────────────────────────────────────┐                    │
│    │  /COMMAND invoked                                │                    │
│    │  Routes to appropriate workflow                  │                    │
│    └──────────────────────────────────────────────────┘                    │
│         │                                                                   │
│         ▼                                                                   │
│    ┌──────────────────────────────────────────────────┐                    │
│    │  AGENT LOOP                                      │                    │
│    │  clarify → explore → plan → execute → validate   │                    │
│    └──────────────────────────────────────────────────┘                    │
│         │                                                                   │
│         ├────────────────┬────────────────┐                                │
│         ▼                ▼                ▼                                │
│    ┌─────────┐      ┌─────────┐      ┌─────────┐                           │
│    │ AGENTS  │      │ SKILLS  │      │ TOOLS   │                           │
│    │ 27      │      │ 54      │      │ Read    │                           │
│    │ senior  │      │ reusable│      │ Write   │                           │
│    │ specs   │      │ behavior│      │ Bash    │                           │
│    │         │      │         │      │ Notion  │                           │
│    │ (can    │      │ (auto-  │      │ Web     │                           │
│    │ delegate│      │ loaded) │      │ ...     │                           │
│    │ @other) │      │         │      │         │                           │
│    └─────────┘      └─────────┘      └─────────┘                           │
│         │                │                │                                │
│         └────────────────┴────────────────┘                                │
│                          │                                                  │
│                          ▼                                                  │
│    ┌──────────────────────────────────────────────────┐                    │
│    │  STRUCTURED OUTPUT                               │                    │
│    │  Summary → Changes → Testing → Risks             │                    │
│    └──────────────────────────────────────────────────┘                    │
│                          │                                                  │
│                          ▼                                                  │
│                        USER                                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

MCP: Notion (Project Matrix, Content Matrix) · WebSearch · WebFetch
```

---

## QUICK REFERENCE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          QUICK REFERENCE                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  START A PROJECT          /product-plan → /project-matrix                   │
│  PLAN A FEATURE           /spec-and-plan                                    │
│  IMPLEMENT                /implement-feature                                │
│  REVIEW CODE              /code-review or /pragmatic-code-review            │
│  SECURITY CHECK           /security-review or /smart-contract-audit         │
│  BRAND WORK               /brand-strategy → /brand-narrative                │
│  CONTENT PLANNING         /content-strategy → /content-matrix               │
│  MARKETING                /marketing-strategy → /campaign-plan              │
│  SYNC CONTEXT             /context-sync                                     │
│                                                                             │
│  AGENT INVOCATION         @agent-name in any context                        │
│  SKILL LOADING            Automatic based on agent + command                │
│  STANDARD OVERRIDE        Ask user when conflict detected                   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```
