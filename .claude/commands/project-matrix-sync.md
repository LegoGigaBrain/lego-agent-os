# project-matrix-sync

You are running the **Project Matrix Sync** workflow in LEGO Agent OS.

Goal:
Synchronize local project artifacts (specs, roadmap) to an existing Notion Project Matrix, and optionally create GitHub issues for flagged deliverables. This command reads from local files and writes to Notion.

Primary Agent:
- @context-steward

Supporting Agents:
- @senior-architect (for spec interpretation)

Skills:
- Project Matrix System (`.claude/skills/skill-project-matrix.md`)

Standards:
- `standards/docs/context-files.md`

---

## Prerequisites

1. **Project Matrix exists** — Run `/project-matrix` first to create the Notion workspace
2. **Notion MCP configured** — With write access to the workspace
3. **Local artifacts exist** — Specs in `docs/specs/`, roadmap in `docs/project/roadmap.md`

---

## Usage

```
/project-matrix-sync <scope>
```

**Scopes:**
- `specs` — Sync feature specs to Deliverables database
- `roadmap` — Sync roadmap to Milestones database
- `github` — Create GitHub issues for flagged deliverables
- `all` — Run specs, roadmap, and github in sequence

---

## Steps

### 1. Identify Project Matrix

Search Notion for the Project Matrix:
- Ask user for project name if not obvious
- Search for "[Project Name] Project Matrix"
- Verify the workspace exists

If not found:
- Inform user to run `/project-matrix` first
- Exit

---

### 2. Scope: `specs`

**Goal:** Import feature specifications as hierarchical Deliverables

#### 2.1 Scan Spec Folders

```
docs/specs/
├── user-auth/
│   ├── feature-spec.md
│   ├── tasks-breakdown.md
│   └── verification-checklist.md
├── payment-flow/
│   ├── feature-spec.md
│   ├── tasks-breakdown.md
│   └── verification-checklist.md
└── ...
```

For each folder in `docs/specs/*/`:

#### 2.2 Read Feature Spec

From `feature-spec.md`:
- Extract feature name (from title or folder name)
- Extract description (first paragraph or summary section)
- Note any priority indicators

#### 2.3 Parse Tasks Breakdown

From `tasks-breakdown.md`:

```markdown
# Tasks Breakdown – User Authentication

## 1. Backend
- [ ] Implement JWT token generation
- [ ] Add refresh token logic
- [ ] Create password reset flow

## 2. Frontend
- [ ] Build login form component
- [ ] Add error state handling

## 3. Testing
- [ ] Unit tests for auth service
- [ ] E2E login flow tests
```

**Parsing Rules:**
- `## N. SectionName` → Workstream assignment (Backend, Frontend, etc.)
- `- [ ] Task description` → Child Task deliverable
- `- [x] Task description` → Child Task, Status: Complete
- Feature folder name → Parent Feature deliverable

#### 2.4 Create/Update Notion Entries

**For each feature folder:**

1. **Check if Feature exists** in Deliverables database
   - Search by Title matching feature name
   - If exists → Update mode
   - If not → Create mode

2. **Create/Update Feature (Parent)**
   ```
   Title: [Feature Name]
   Type: Feature
   Status: Planned (or preserve existing)
   Spec Link: docs/specs/[feature]/feature-spec.md
   ```

3. **For each task in tasks-breakdown.md:**
   - Check if Task exists (by Title + Parent relation)
   - Create/Update Task (Child)
   ```
   Title: [Task description]
   Type: Task
   Parent: [Feature]
   Workstream: [Section header]
   Status: Planned (or Complete if [x])
   ```

#### 2.5 Handle Existing Tasks

- **New tasks** → Create
- **Existing tasks** → Update description if changed, preserve status
- **Removed tasks** → Do NOT delete (user may have customized)
- **Report:** List what was added/updated/skipped

---

### 3. Scope: `roadmap`

**Goal:** Import milestones from roadmap document

#### 3.1 Read Roadmap

From `docs/project/roadmap.md`:

```markdown
# Roadmap

## Q1 2025 - Foundation
- User authentication system
- Basic payment integration
- Admin dashboard MVP

## Q2 2025 - Growth
- Multi-tenant support
- API v2 launch
- Mobile app beta

## Future
- AI features
- International expansion
```

**Parsing Rules:**
- `## Section Title` → Milestone name
- If contains date/quarter pattern → Extract as Target Date
- Bullet items → Link to Deliverables (if they exist)

#### 3.2 Create/Update Milestones

For each section:

1. **Check if Milestone exists** by name
2. **Create/Update:**
   ```
   Milestone: [Section Title]
   Target Date: [Extracted or null]
   Status: Not Started (or preserve)
   Description: [Bullet items as text]
   ```

3. **Link Deliverables:**
   - For each bullet item, search Deliverables by name
   - If found, add to Milestone.Deliverables relation

---

### 4. Scope: `github`

**Goal:** Create GitHub issues for flagged deliverables

#### 4.1 Query Flagged Deliverables

Search Notion Deliverables where:
- `Create GitHub Issue` = true (checked)
- `GitHub Issue` is empty (not yet created)

#### 4.2 Create GitHub Issues

For each flagged deliverable:

1. **Build issue content:**
   ```
   Title: [Deliverable Title]
   Body:
   ## Context
   [From Deliverable.Notes or linked spec]

   ## Linked
   - Notion: [Deliverable URL]
   - Spec: [Spec Link if exists]

   ## Status
   Priority: [Priority]
   Workstream: [Workstream]
   ```

2. **Create issue via gh CLI:**
   ```bash
   gh issue create --title "[Title]" --body "[Body]"
   ```

3. **Capture issue URL** from output

4. **Update Notion:**
   - Set `GitHub Issue` = [Issue URL]
   - Uncheck `Create GitHub Issue` (or set to "Synced" status)

#### 4.3 Report Results

```
Created GitHub Issues:
- #123: Implement JWT validation
- #124: Build login form component

Skipped (already have issues):
- Add refresh token logic (#120)

Errors:
- [Any failures]
```

---

### 5. Scope: `all`

Run in sequence:
1. `specs`
2. `roadmap`
3. `github`

Report combined results.

---

## Output Format

After sync, report:

```markdown
## Project Matrix Sync Complete

### Specs Synced
**Features:** 3 created, 2 updated
**Tasks:** 15 created, 8 updated, 3 skipped

| Feature | Tasks | Status |
|---------|-------|--------|
| User Auth | 7 | Synced |
| Payment Flow | 5 | Synced |
| Admin Dashboard | 6 | Updated |

### Roadmap Synced
**Milestones:** 2 created, 1 updated

| Milestone | Target | Deliverables Linked |
|-----------|--------|---------------------|
| Q1 2025 | Mar 31 | 8 |
| Q2 2025 | Jun 30 | 6 |

### GitHub Issues
**Created:** 5
**Skipped:** 2 (already exist)

### Next Steps
- Review imported deliverables in Notion
- Assign owners to tasks
- Set due dates on milestones
```

---

## Error Handling

### Spec Parsing Errors

If `tasks-breakdown.md` has unexpected format:
- Log warning
- Skip unparseable sections
- Continue with what's parseable
- Report in summary

### Notion API Errors

- Retry once on timeout
- Report failed items
- Continue with remaining items
- Provide recovery suggestions

### GitHub CLI Errors

- Check if `gh` is authenticated
- Report auth issues clearly
- Skip GitHub sync if not configured
- Suggest `gh auth login`

---

## Quality Checklist

Before sync:
- [ ] Project Matrix exists in Notion
- [ ] Spec folders have required files
- [ ] Roadmap follows expected format
- [ ] GitHub CLI authenticated (for github scope)

After sync:
- [ ] All features created with correct hierarchy
- [ ] Tasks linked to parent features
- [ ] Workstreams assigned from section headers
- [ ] Milestones have target dates where possible
- [ ] GitHub issues created and URLs stored

---

## Anti-Patterns

- Running sync before Project Matrix exists
- Syncing to wrong project (always confirm project name)
- Expecting sync to delete removed tasks (it won't, by design)
- Running github sync without `gh auth login`
- Over-syncing — run when meaningful changes exist, not constantly
