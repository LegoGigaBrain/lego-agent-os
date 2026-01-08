# Skill: Project Matrix System

## Purpose

Design and operate a comprehensive Notion-based project management system that transforms strategy into executable workflows. This skill enables the creation of Project Matrix workspaces that manage goals, milestones, deliverables, team roles, and decisions across any project type.

---

## Core Philosophy

**Strategy → Planning → Execution → Delivery**

Every project follows this arc. The Project Matrix provides structure while adapting to project type—whether code, brand, website, or physical build. Notion is the operational hub; local specs remain the source of implementation detail.

---

## Project Matrix Architecture

### System Structure

```
[Project Name] Project Matrix (Parent Page)
│
├── 📄 Project Overview (page)
│   └── Mission, success criteria, project config
│
├── 📊 Strategy & Goals (database)
│   └── OKRs, key results, metrics
│
├── 📊 Milestones (database)
│   └── Major phases with target dates
│
├── 📊 Workstreams (database) [Advanced mode]
│   └── Parallel tracks with owners
│
├── 📊 Deliverables (database)
│   └── Features (parents) + Tasks (children)
│   └── Hierarchical via self-relation
│
├── 📊 Team & Roles (database)
│   └── People + responsibilities
│
├── 📊 Decisions Log (database)
│   └── Key decisions with full context
│
└── 📁 Views
    ├── Kanban (by status)
    ├── Timeline (Gantt-style)
    ├── Calendar (due dates)
    └── By Workstream (filtered)
```

---

## Project Type Presets

### Code Project

| Aspect | Configuration |
|--------|---------------|
| **Workstreams** | Backend, Frontend, DevOps, QA |
| **Deliverable Types** | Spec, PR, Release, Hotfix |
| **Status Flow** | Planned → In Dev → Review → Shipped |
| **Source of Truth** | GitHub + Notion (hybrid) |

### Brand Project

| Aspect | Configuration |
|--------|---------------|
| **Workstreams** | Strategy, Identity, Verbal, Visual |
| **Deliverable Types** | Document, Asset, Guideline |
| **Status Flow** | Draft → Review → Approved → Live |
| **Source of Truth** | Notion |

### Website/App Project

| Aspect | Configuration |
|--------|---------------|
| **Workstreams** | Discovery, Design, Dev, Launch |
| **Deliverable Types** | Wireframe, Design, Build, Content |
| **Status Flow** | Concept → Design → Build → QA → Live |
| **Source of Truth** | Hybrid |

### Physical Project

| Aspect | Configuration |
|--------|---------------|
| **Workstreams** | Design, Procurement, Build, Install |
| **Deliverable Types** | Drawing, Order, Photo, Report |
| **Status Flow** | Design → Approved → In Progress → Complete |
| **Source of Truth** | Notion |

---

## Database Schemas

### Deliverables Database

The core tracking database with hierarchical structure.

| Property | Type | Purpose |
|----------|------|---------|
| Title | Title | Deliverable name |
| Type | Select | Feature / Task |
| Parent | Relation (self) | Links task to parent feature |
| Status | Select | Project-type specific workflow |
| Priority | Select | High / Medium / Low |
| Start Date | Date | When work begins |
| Due Date | Date | Target completion |
| Actual Completion | Date | When actually done |
| Workstream | Relation or Multi-select | Which track (mode-dependent) |
| Milestone | Relation | Which milestone this belongs to |
| Owner | Person | Responsible party |
| GitHub Issue | URL | Link to GitHub issue (Code projects) |
| Spec Link | URL | Link to spec file |
| Create GitHub Issue | Checkbox | Flag for GitHub sync |
| Notes | Text | Additional context |

**Status Options by Project Type:**

| Code | Brand | Website/App | Physical |
|------|-------|-------------|----------|
| Planned | Draft | Concept | Design |
| In Dev | Review | Design | Approved |
| Review | Approved | Build | In Progress |
| Shipped | Live | QA | Complete |
| | | Live | |

### Milestones Database

| Property | Type | Purpose |
|----------|------|---------|
| Milestone | Title | Milestone name |
| Target Date | Date | When milestone should complete |
| Status | Select | Not Started / In Progress / Complete / Delayed |
| Deliverables | Relation | Linked deliverables |
| Description | Text | What this milestone represents |

### Strategy & Goals Database

| Property | Type | Purpose |
|----------|------|---------|
| Goal | Title | Goal or objective name |
| Type | Select | OKR / Key Result / Metric |
| Target | Text | What success looks like |
| Current | Text | Current state |
| Status | Select | Not Started / On Track / At Risk / Achieved |
| Owner | Person | Accountable person |
| Related Milestones | Relation | Connected milestones |

### Team & Roles Database

| Property | Type | Purpose |
|----------|------|---------|
| Name | Title | Person's name |
| Role | Select | Project role |
| Responsibilities | Text | What they're accountable for |
| Workstreams | Relation | Which workstreams they own |
| Contact | Email/URL | How to reach them |

### Workstreams Database (Advanced Mode)

| Property | Type | Purpose |
|----------|------|---------|
| Workstream | Title | Track name |
| Owner | Person | Lead for this track |
| Status | Select | Active / Paused / Complete |
| Description | Text | What this track covers |
| Deliverables | Relation | All deliverables in this track |

### Decisions Log Database

| Property | Type | Purpose |
|----------|------|---------|
| Decision | Title | What was decided |
| Context | Text | Why this came up |
| Options Considered | Text | What alternatives existed |
| Rationale | Text | Why we chose this option |
| Date | Date | When decided |
| Owner | Person | Who made the call |
| Status | Select | Proposed / Accepted / Revisiting |
| Related Deliverables | Relation | What this affects |

---

## Workstream Modes

### Simple Mode (Default)

Workstreams are a **Multi-select property** on Deliverables.

**Best for:**
- Small teams
- Simple projects
- Quick setup

**Configuration:**
```
Deliverables.Workstream = Multi-select
Options: [Backend, Frontend, Design, QA, Docs]
```

### Advanced Mode

Workstreams are a **separate database** with relations.

**Best for:**
- Multiple parallel teams
- Workstreams have different owners
- Need workstream-level status tracking

**Configuration:**
```
Workstreams Database → Relations to:
  - Deliverables (what belongs here)
  - Team & Roles (who owns this)
```

---

## Views Configuration

### Kanban View

- Group by: Status
- Sort by: Priority (High first), then Due Date
- Filter: Hide completed (optional)

### Timeline View (Gantt)

- Date property: Start Date → Due Date
- Group by: Workstream or Milestone
- Show: Title, Status, Owner

### Calendar View

- Date property: Due Date
- Show: Milestones + Deliverables with due dates
- Color by: Status or Workstream

### By Workstream View

- Filter: Workstream = [Selected]
- Group by: Status
- One view per workstream (or use filter)

---

## Workflow Integration

### Project Setup Flow

```
1. /project-matrix
   └── Creates Notion workspace
   └── Asks: Project name, type, workstream mode
   └── Sets up all databases and views
   └── Adds project type presets

2. Manual Setup
   └── Add team members to Team & Roles
   └── Define initial goals in Strategy & Goals
   └── Create initial milestones

3. Ongoing Work
   └── Deliverables flow through status
   └── Decisions captured in Decisions Log
   └── Milestones track progress
```

### Sync from Local Specs

```
/project-matrix-sync specs
└── Reads docs/specs/*/ folders
└── Creates Feature deliverables (parents)
└── Parses tasks-breakdown.md for Tasks (children)
└── Links to spec files

/project-matrix-sync roadmap
└── Reads docs/project/roadmap.md
└── Creates/updates Milestones

/project-matrix-sync github
└── Creates GitHub issues for flagged deliverables
└── Stores issue URLs back in Notion
```

### Parsing tasks-breakdown.md

The sync command parses this format:

```markdown
# Tasks Breakdown – Feature Name

## 1. Backend
- [ ] Implement user authentication
- [ ] Add API rate limiting
- [ ] Set up database migrations

## 2. Frontend
- [ ] Create login form component
- [ ] Add error handling UI

## 3. Testing
- [ ] Unit tests for auth flow
- [ ] E2E tests with Playwright
```

**Parsing rules:**
- `## N. SectionName` → Workstream assignment
- `- [ ] Task description` → Child Task deliverable
- Feature folder name → Parent Feature deliverable

---

## GitHub Integration (Code Projects)

### When to Use

- Project type = Code or Website/App
- Team uses GitHub for issue tracking
- Want PR → Issue linking

### How It Works

1. Create deliverable in Notion
2. Check "Create GitHub Issue" checkbox
3. Run `/project-matrix-sync github`
4. Issue created via `gh issue create`
5. Issue URL stored in Notion
6. Checkbox unchecked (or status updated)

### Not Automatic

GitHub sync is **manual and selective**. This:
- Keeps GitHub clean (not every task needs an issue)
- Gives control over what's tracked where
- Avoids brittle automation

---

## Create vs Update Logic

### Detection

When `/project-matrix` runs:

1. Search Notion for "[Project Name] Project Matrix"
2. If found → Update Mode
3. If not found → Create Mode

### Create Mode

- Create parent page with full structure
- Create all databases with schemas
- Set up relations between databases
- Configure views
- Apply project type presets
- Add sample entries as templates

### Update Mode

- Preserve existing content
- Add missing databases (if schema expanded)
- Add missing properties to existing databases
- Update project type config if changed
- Add new views if missing

---

## Quality Checklist

Before creating a Project Matrix:

- [ ] Project name confirmed
- [ ] Project type selected (Code/Brand/Website/Physical)
- [ ] Workstream mode chosen (Simple/Advanced)
- [ ] Initial team members identified
- [ ] High-level milestones known

After Project Matrix creation:

- [ ] All databases created with correct schemas
- [ ] Relations properly linked
- [ ] Views configured (Kanban, Timeline, Calendar)
- [ ] Project type presets applied
- [ ] Sample entries demonstrate usage

---

## Anti-Patterns

1. **Over-tracking** — Not every task needs to be in Notion; keep spec files as implementation detail
2. **Stale data** — Update status regularly or the system loses trust
3. **Missing decisions** — Capture "why" in Decisions Log, not just "what"
4. **Ignoring hierarchy** — Use parent-child for Features→Tasks; flat lists get messy
5. **Wrong source of truth** — Code projects: GitHub for dev tasks, Notion for high-level
6. **No milestones** — Without milestones, there's no sense of progress
7. **Ghost workstreams** — In Advanced mode, workstreams need owners

---

## Output Artifacts

When this skill is applied:

1. **Notion Workspace** — Complete Project Matrix structure
2. **Database Views** — Kanban, Timeline, Calendar configured
3. **Project Config** — Type, workstream mode, presets documented
4. **Sample Entries** — Template deliverables showing proper format
5. **Workflow Documentation** — How team should use the system
