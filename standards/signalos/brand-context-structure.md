# Brand Context Structure Standard

> "Context is how Claude remembers. Structure is how it navigates."

---

## Purpose

This standard defines how to structure brand projects for optimal Claude context loading and sustainable documentation across sessions.

---

## Core Principle: Layered Context

Brand projects use **layered CLAUDE.md files** that provide:
1. **Quick context** at project root
2. **Focused context** in each domain folder
3. **Deep reference** in detailed files

---

## Required Folder Structure

Every brand project should follow this hierarchy:

```
projects/{{brand-slug}}/
├── CLAUDE.md                    # Root context (always read first)
├── session-log.md               # Running work log
├── notion-sync.md               # Notion integration status
│
├── brand/                       # Brand strategy and identity
│   ├── CLAUDE.md               # Brand folder quick context
│   ├── brand-bible.md          # Comprehensive reference
│   ├── brand-identity.md       # Core identity elements
│   ├── brand-voice.md          # Voice, tone, lexicon
│   ├── brand-archetypes.md     # Archetypal profile
│   └── visual-direction.md     # Visual brief
│
├── content/                     # Content strategy and production
│   ├── CLAUDE.md               # Content folder quick context
│   ├── content-strategy.md     # Pillars, arc, framework
│   └── content-clips.md        # Production assets
│
├── community/                   # Tribe and community
│   ├── CLAUDE.md               # Community folder quick context
│   ├── tribe-definition.md     # Audience tiers
│   └── community-language.md   # Community mechanics
│
└── foundations/                 # Deep reference (optional)
    ├── CLAUDE.md               # Foundations quick context
    └── [project-specific files]
```

---

## CLAUDE.md Requirements

### Root CLAUDE.md (Project Level)

Must include:
1. **Brand quote** - Signature quote that captures essence
2. **Critical rules** - Universal constraints (e.g., no em dashes)
3. **Quick identity** - Taglines, core concept, community terms
4. **Project structure** - Visual tree of folder layout
5. **Navigation table** - Task to file mapping
6. **Claude instructions** - What to do when working on this brand

### Folder CLAUDE.md (Domain Level)

Must include:
1. **Purpose statement** - What this domain covers
2. **File inventory** - Table of files with purpose and when to read
3. **Quick reference** - Most-used information at a glance
4. **Claude instructions** - Domain-specific guidance

---

## File Naming Conventions

| File | Purpose | Required |
|------|---------|----------|
| `CLAUDE.md` | Context loading | Yes |
| `brand-bible.md` | Comprehensive strategy | Yes |
| `brand-identity.md` | Core identity elements | Yes |
| `brand-voice.md` | Voice and tone | Yes |
| `session-log.md` | Work continuity | Yes |
| `notion-sync.md` | Notion integration | If using Notion |

---

## Context Loading Order

When Claude starts work on a brand:

1. **Read root CLAUDE.md** - Get brand overview
2. **Check session-log.md** - Understand recent work
3. **Navigate to relevant folder** - Based on task
4. **Read folder CLAUDE.md** - Get domain context
5. **Read specific file** - For detailed work

---

## Session Log Format

Each entry should include:

```markdown
### YYYY-MM-DD | [Brief Title]

**Session focus:**
[What was the main work?]

**Key insights:**
[What was discovered or decided?]

**Created/Updated:**
[List of files changed]

**Open threads:**
[What's next or unresolved?]
```

---

## Benefits

1. **Efficient context loading** - Claude reads only what's needed
2. **Session continuity** - Work doesn't get lost
3. **Scalable** - Same structure for all brands
4. **Team-friendly** - Anyone can navigate
5. **Notion-ready** - Structure maps to Notion workspace

---

## Anti-Patterns

- **Monolithic files** - One huge file with everything
- **No CLAUDE.md** - Missing context entry points
- **Flat structure** - All files in one folder
- **No session log** - Work history lost
- **Inconsistent naming** - Hard to navigate
