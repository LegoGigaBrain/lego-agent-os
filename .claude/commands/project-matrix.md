# project-matrix

You are running the **Project Matrix** workflow in LEGO Agent OS.

Goal:
Create or update a comprehensive Notion-based project management workspace that tracks strategy, goals, milestones, deliverables, team roles, and decisions. The system adapts to project type (Code, Brand, Website/App, Physical) with appropriate presets.

Primary Agent:
- @context-steward

Supporting Agents:
- @senior-architect (for code projects)
- @brand-strategist (for brand projects)
- @business-strategist (for strategic planning)

Skills:
- Project Matrix System (`.claude/skills/skill-project-matrix.md`)

Standards:
- `standards/docs/context-files.md`

---

## Prerequisites

Before running this command, ensure:

1. **Notion MCP is configured** — The Notion MCP server must be connected with write access
2. **Project name is known** — You'll need to identify the project for workspace naming
3. **Project type is clear** — Code, Brand, Website/App, or Physical

---

## Steps

### 1. Gather Project Information

Ask:
- What is the project name?
- What type of project is this?
  - **Code** — Software development (GitHub + Notion hybrid)
  - **Brand** — Brand strategy/identity work (Notion only)
  - **Website/App** — Web project with design + dev (Hybrid)
  - **Physical** — Physical build/architecture (Notion only)
- Does a Project Matrix already exist for this project?
- Workstream mode preference?
  - **Simple** — Workstreams as tags (default, recommended for small teams)
  - **Advanced** — Workstreams as separate database (for parallel teams with different owners)

---

### 2. Check for Existing Project Matrix

Search Notion for "[Project Name] Project Matrix":

**If Found → Update Mode:**
- Preserve existing content
- Add missing databases or properties
- Update project config if type changed
- Add new views if missing

**If Not Found → Create Mode:**
- Create new parent page
- Build full database architecture
- Set up all relations
- Configure views
- Apply project type presets

---

### 3. Apply Project Type Presets

Based on project type, configure:

#### Code Project

```
Workstreams: Backend, Frontend, DevOps, QA
Deliverable Types: Spec, PR, Release, Hotfix
Status Flow: Planned → In Dev → Review → Shipped
GitHub Integration: Enabled
```

#### Brand Project

```
Workstreams: Strategy, Identity, Verbal, Visual
Deliverable Types: Document, Asset, Guideline
Status Flow: Draft → Review → Approved → Live
GitHub Integration: Disabled
```

#### Website/App Project

```
Workstreams: Discovery, Design, Dev, Launch
Deliverable Types: Wireframe, Design, Build, Content
Status Flow: Concept → Design → Build → QA → Live
GitHub Integration: Enabled
```

#### Physical Project

```
Workstreams: Design, Procurement, Build, Install
Deliverable Types: Drawing, Order, Photo, Report
Status Flow: Design → Approved → In Progress → Complete
GitHub Integration: Disabled
```

---

### 4. Create Project Matrix Structure

Build this architecture in Notion:

```
[Project Name] Project Matrix (Parent Page)
│
├── Project Overview (page)
│   └── Mission, success criteria, project config
│
├── Strategy & Goals (database)
│   └── OKRs, key results, metrics
│
├── Milestones (database)
│   └── Major phases with target dates
│
├── Workstreams (database) [if Advanced mode]
│   └── Parallel tracks with owners
│
├── Deliverables (database)
│   └── Features (parents) + Tasks (children)
│
├── Team & Roles (database)
│   └── People + responsibilities
│
├── Decisions Log (database)
│   └── Key decisions with context
│
└── Views
    ├── Kanban (by status)
    ├── Timeline (Gantt)
    ├── Calendar (due dates)
    └── By Workstream
```

---

### 5. Create Database Schemas

#### Deliverables Database

| Property | Type | Options |
|----------|------|---------|
| Title | Title | — |
| Type | Select | Feature, Task |
| Parent | Relation (self) | For hierarchy |
| Status | Select | Project-type specific |
| Priority | Select | High, Medium, Low |
| Start Date | Date | — |
| Due Date | Date | — |
| Actual Completion | Date | — |
| Workstream | Relation or Multi-select | Mode-dependent |
| Milestone | Relation | To Milestones |
| Owner | Person | — |
| GitHub Issue | URL | Code projects only |
| Spec Link | URL | — |
| Create GitHub Issue | Checkbox | Code projects only |
| Notes | Text | — |

#### Milestones Database

| Property | Type | Options |
|----------|------|---------|
| Milestone | Title | — |
| Target Date | Date | — |
| Status | Select | Not Started, In Progress, Complete, Delayed |
| Deliverables | Relation | To Deliverables |
| Description | Text | — |

#### Strategy & Goals Database

| Property | Type | Options |
|----------|------|---------|
| Goal | Title | — |
| Type | Select | OKR, Key Result, Metric |
| Target | Text | — |
| Current | Text | — |
| Status | Select | Not Started, On Track, At Risk, Achieved |
| Owner | Person | — |

#### Team & Roles Database

| Property | Type | Options |
|----------|------|---------|
| Name | Title | — |
| Role | Select | Project-specific roles |
| Responsibilities | Text | — |
| Workstreams | Relation | To Workstreams (if Advanced) |

#### Workstreams Database (Advanced Mode Only)

| Property | Type | Options |
|----------|------|---------|
| Workstream | Title | — |
| Owner | Person | — |
| Status | Select | Active, Paused, Complete |
| Description | Text | — |

#### Decisions Log Database

| Property | Type | Options |
|----------|------|---------|
| Decision | Title | — |
| Context | Text | — |
| Options Considered | Text | — |
| Rationale | Text | — |
| Date | Date | — |
| Owner | Person | — |
| Status | Select | Proposed, Accepted, Revisiting |
| Related Deliverables | Relation | To Deliverables |

---

### 6. Configure Views

#### Kanban View

- Group by: Status
- Sort by: Priority (High first), Due Date
- Show: Title, Owner, Due Date, Workstream

#### Timeline View

- Start: Start Date
- End: Due Date
- Group by: Milestone or Workstream
- Show: Title, Status, Owner

#### Calendar View

- Date: Due Date
- Include: Milestones + Deliverables
- Color by: Status

#### By Workstream View

- Filter by Workstream
- Group by Status
- Create one view per workstream OR use filter dropdown

---

### 7. Add Sample Entries

Create template entries to demonstrate proper usage:

**Sample Milestone:**
```
Milestone: MVP Launch
Target Date: [2 months from now]
Status: Not Started
Description: First public release with core features
```

**Sample Feature (Parent):**
```
Title: User Authentication
Type: Feature
Status: Planned
Priority: High
Milestone: MVP Launch
Workstream: Backend
```

**Sample Task (Child):**
```
Title: Implement JWT validation
Type: Task
Parent: User Authentication
Status: Planned
Priority: High
Workstream: Backend
```

**Sample Decision:**
```
Decision: Use JWT for authentication
Context: Need stateless auth for API scalability
Options Considered: Session-based auth, JWT, OAuth-only
Rationale: JWT allows horizontal scaling without session store
Status: Accepted
```

---

### 8. Document Project Configuration

In the Project Overview page, document:

```markdown
# [Project Name] Project Matrix

## Project Configuration

- **Project Type:** [Code/Brand/Website/Physical]
- **Workstream Mode:** [Simple/Advanced]
- **GitHub Integration:** [Enabled/Disabled]
- **Created:** [Date]

## Success Criteria

[What does success look like for this project?]

## Key Contacts

| Role | Person |
|------|--------|
| Project Lead | [Name] |
| [Other roles] | [Names] |

## Related Resources

- Spec files: `docs/specs/`
- Roadmap: `docs/project/roadmap.md`
- [Other links]
```

---

## Output Deliverables

1. **Notion Workspace** — Complete Project Matrix structure
2. **All Databases** — Configured with correct schemas and relations
3. **Views** — Kanban, Timeline, Calendar configured
4. **Sample Entries** — Templates demonstrating proper format
5. **Project Overview** — Configuration documented

---

## Quality Checklist

Before completion:

**Structure Quality**
- [ ] All databases created with correct schemas
- [ ] Relations properly linked (Deliverables ↔ Milestones, etc.)
- [ ] Self-relation on Deliverables for hierarchy
- [ ] Project type presets applied

**Usability**
- [ ] Views configured and working
- [ ] Sample entries demonstrate proper usage
- [ ] Status options match project type
- [ ] Workstream mode correctly implemented

**Configuration**
- [ ] Project Overview documents setup
- [ ] GitHub properties visible only for Code/Website projects
- [ ] Team & Roles ready for population

---

## Update Mode Behavior

When updating an existing Project Matrix:

1. **Preserve all existing content** — Never delete user data
2. **Add missing databases** — If schema has expanded
3. **Add missing properties** — To existing databases
4. **Update views** — If new view types added
5. **Update project config** — If type changed (with user confirmation)

---

## Handoff Guidance

After Project Matrix creation:

**To Team:**
- Project Matrix URL
- How to add deliverables
- Status workflow explanation
- When to use Decisions Log

**To context-steward:**
- Project Matrix is operational
- Can now run `/project-matrix-sync` to populate from specs

**For ongoing use:**
- Use `/project-matrix-sync specs` to import feature specs
- Use `/project-matrix-sync roadmap` to sync milestones
- Use `/project-matrix-sync github` to create issues (Code projects)

---

## Anti-Patterns

- Creating matrix before project scope is clear
- Over-complicating with Advanced mode for small projects
- Not updating status (system loses trust)
- Skipping Decisions Log (losing "why" context)
- Duplicate tracking in Notion AND GitHub without clear ownership
