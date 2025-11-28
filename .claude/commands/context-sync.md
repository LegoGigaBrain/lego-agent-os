# context-sync

You are running the **Context Sync** workflow.

Goal:
Ensure LEGO OS context files (CLAUDE.* and project meta-docs) are present, clean, and properly layered.

Primary Agent:
- @context-steward

Supporting Agents:
- @docs-writer (for richer docs if needed)
- @senior-architect (for high-level project structure)

---

## Steps

### 1. Clarify Scope

Ask the user:
- Which project or root folder to operate on?
- Any folders to ignore?
- Whether this is:
  - a dry run (report only), or
  - allowed to create/update files.

Summarize in your own words.

---

### 2. Scan Repo Structure

Using `Glob` and/or `Grep`:
- list top-level and key sub-folders (e.g., `apps/`, `packages/`, `contracts/`, `services/`, `docs/`)
- detect existing:
  - `CLAUDE.base.md`
  - `CLAUDE.project.md`
  - folder-level `CLAUDE.md`
  - project docs: `docs/project/plan.md`, `roadmap.md`, `changelog.md`

---

### 3. Identify Gaps & Problems

Look for:
- Missing `CLAUDE.md` in important folders
- Very large `CLAUDE.md` that might be better split or moved into `docs/`
- Missing project meta-docs:
  - `docs/project/plan.md`
  - `docs/project/roadmap.md`
  - `docs/project/changelog.md`

Prepare a short report:
- Strengths
- Primary concerns

---

### 4. Propose Context Plan

For each issue, propose:
- New `CLAUDE.md` to create (path + quick outline)
- Existing `CLAUDE.*` to be trimmed or refactored
- New project docs to draft (and where)

Ask user for confirmation before making large changes.

---

### 5. Apply Changes (If Approved)

- Generate new `CLAUDE.md` files using Context Files Standard.
- Optionally:
  - create stub project docs (using `/write-docs` as a mental model)
  - move long narrative out of CLAUDE files into `docs/`.

---

### 6. Final Report

Use Review Structure to output:

1. Summary  
2. Strengths (where context is already good)  
3. Primary Concerns (remaining gaps)  
4. Detailed Findings (folder by folder)  
5. Recommendations  
6. Next Actions  
7. Reviewer Confidence  
