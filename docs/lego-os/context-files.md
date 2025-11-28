# Context Files (CLAUDE Files)

CLAUDE files are structured context documents that give agents layered understanding of your project.

---

## Purpose

- Avoid context overload  
- Keep global OS rules separate from project rules  
- Maintain folder-level clarity  
- Make onboarding easy  
- Ensure agents always read context in the correct order  

---

## Types of Context Files

### 1. Global OS Context
`CLAUDE.base.md`  
Defines:
- OS rules  
- agent behaviour  
- global standards  
- review philosophy  

---

### 2. Project Context
`CLAUDE.project.md`  
Defines:
- project mission  
- constraints  
- vocabulary  
- key components  
- links to roadmap, plan, changelog  

---

### 3. Folder-Level Context
`path/to/folder/CLAUDE.md`  
Defines:
- purpose of that folder  
- key files  
- local conventions  
- dependencies (imports, services)  
- things to be careful about  

Short, precise, linked to deeper docs.

---

### 4. Project Meta-Docs

docs/project/
plan.md
roadmap.md
changelog.md


These track:
- strategic direction  
- what is being built next  
- what changed when  

Agents read these *before* working on features.

---

## Procedural Reading Order

Agents read context in layers:

1. `CLAUDE.base.md` — OS-level rules  
2. `CLAUDE.project.md` — project definitions  
3. `docs/project/plan.md`  
4. `docs/project/roadmap.md`  
5. `docs/project/changelog.md`  
6. folder-level `CLAUDE.md`  
7. standards  
8. specs  
9. code  

This builds a stacked, hierarchical understanding.

---

## When to Add a New CLAUDE File

Add `CLAUDE.md` to a folder when:
- it contains domain logic  
- it has reusable code  
- it has multiple submodules  
- it has conventions or footguns  
- it’s easy to misunderstand  

Examples:
- `/contracts/`  
- `/apps/web/`  
- `/packages/ui/`  
- `/services/booking/`  

---

## Keeping Context Fresh

Use `/context-sync` to:
- identify missing CLAUDE files  
- regenerate outdated ones  
- move long context into docs  
- ensure consistent layering  
