# Context Files Standard (CLAUDE Files)

We use `CLAUDE.*` files to give Claude Code structured, layered context.

---

## 1. Types of context files

- **Root OS file:**
  - `CLAUDE.base.md`
  - Defines global LEGO OS rules, standards, and behaviours.

- **Project-level file:**
  - e.g., `CLAUDE.project.md` or `CLAUDE.vlossom.md`
  - Describes the specific project:
    - mission
    - domain concepts
    - key constraints
    - links to roadmap/plan/docs.

- **Folder-level files:**
  - `path/to/folder/CLAUDE.md`
  - Describe:
    - purpose of that folder
    - key files
    - local conventions
    - how this folder relates to the rest of the project.

---

## 2. Goals

- Avoid overloading root `CLAUDE.base.md` with project-specific details.
- Keep context **local** and **discoverable**:
  - when working in `contracts/`, read `contracts/CLAUDE.md`.
  - when working in `apps/web/`, read `apps/web/CLAUDE.md`.

---

## 3. Suggested Content for Folder-level `CLAUDE.md`

Each folder’s `CLAUDE.md` should briefly cover:

1. **Purpose**
   - What lives in this folder?
   - What problem does it solve?

2. **Key Files**
   - Pointers to main entrypoints or important modules.

3. **Local Conventions**
   - Naming patterns, architectural patterns, tech choices.

4. **Dependencies**
   - Which other folders or services this code depends on.

5. **Gotchas / Notes**
   - Any special constraints, legacy quirks, or things to be careful about.

Keep it short and link to deeper docs when necessary.

---

## 4. Procedural Reading Order for Project Context

When performing work in a project, agents should aim to read:

1. Root OS context:
   - `CLAUDE.base.md`

2. Project context:
   - `CLAUDE.project.md` (or equivalent)

3. Project meta-docs (if they exist):
   - `docs/project/plan.md`
   - `docs/project/roadmap.md`
   - `docs/project/changelog.md`

4. Local folder context:
   - `path/to/folder/CLAUDE.md`

5. Relevant specs:
   - under `docs/specs/` or `specs/`

This creates a **stacked, layered view** from global → project → local → feature.
