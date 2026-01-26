# Skill: Agent Autonomy

## Purpose

Enable AI agents to work autonomously during off-hours, maintaining continuity across sessions while respecting boundaries. Use this skill when setting up autonomous agent workflows for Clawdbot or similar systems.

This skill documents WHY autonomous agents need certain capabilities and HOW to implement them, so the pattern can be replicated in any context.

---

## Why Agents Need Autonomy

### The Problem

Traditional AI assistants are reactive — they wait for prompts and respond. This creates bottlenecks:

- Work only happens when the human is actively directing
- Context is lost between sessions
- The human becomes a coordinator instead of a decision-maker
- No background progress on long-running projects

### The Solution

Autonomous agents that:

1. **Persist context** across sessions via files (not memory)
2. **Check in periodically** via heartbeats
3. **Work proactively** on known priorities
4. **Document everything** so the human can review async
5. **Respect boundaries** — ask before external actions

This transforms the agent from a "tool that responds" to a "teammate that works."

---

## Core Components

### 1. Permission System

Before autonomous work, the human must explicitly grant permission.

**Required permissions file:** `PERMISSIONS.md`

```markdown
# PERMISSIONS.md

## Granted: [DATE]

### Autonomous Actions (No Approval Needed)
✅ Work on projects during heartbeats
✅ Make commits to feature branches
✅ Improve skills and documentation
✅ Reach out proactively for important findings
✅ Learn patterns and document them

### Still Ask First
❓ Major architecture changes
❓ Deploying to production
❓ External communications (email, social)
❓ Deleting significant files

### Confidentiality
🔒 [List confidential projects/data]
```

**Why this matters:** Explicit permission prevents scope creep and builds trust. The agent knows exactly what it can and cannot do.

---

### 2. Heartbeat System

Periodic check-ins allow the agent to do work without constant human direction.

**Configuration:** `HEARTBEAT.md`

```markdown
# HEARTBEAT.md

## Every Heartbeat
- [ ] Check KANBAN.md for active tasks
- [ ] If no explicit tasks, look for improvement opportunities
- [ ] Update progress tracking
- [ ] Run any automated checks (tests, bots, etc.)

## Rotating Work (pick one per heartbeat)
- [ ] Review and improve a skill/document
- [ ] Check project repos for issues
- [ ] Extract patterns from recent work

## When to Reach Out
- Found something important
- Blocked on a decision
- Completed significant work
```

**Why this matters:** Heartbeats create a rhythm of autonomous work without requiring the human to initiate every action.

---

### 3. File-Based Memory

Agents lose context between sessions. Files are the persistence layer.

**Required files:**

| File | Purpose |
|------|---------|
| `KANBAN.md` | Active work tracker |
| `PATTERNS.md` | Human's thinking patterns |
| `memory/YYYY-MM-DD.md` | Daily logs |
| `MEMORY.md` | Long-term curated knowledge |

**Example KANBAN structure:**

```markdown
## 🔥 In Progress
- [ ] Task being worked on

## 📋 Backlog
- [ ] Future tasks

## ✅ Done
### YYYY-MM-DD
- [x] Completed tasks
```

**Why this matters:** When the agent wakes up fresh, it reads these files to reconstruct context. No file = no memory.

---

### 4. Pattern Learning

Autonomous agents should learn how their human thinks, so they can continue work in the same direction.

**Pattern capture file:** `PATTERNS.md`

```markdown
# PATTERNS.md — How [Human] Thinks

## Core Philosophy
- [Document their values and approach]

## Technical Preferences  
- [Stack choices, code style, etc.]

## Decision Patterns
- [How they make decisions, what they prioritize]

## Captured Decisions
### YYYY-MM-DD
- **Decision**: [What was decided]
- **Reasoning**: [Why]
- **Pattern**: [Generalizable lesson]
```

**How to capture patterns:**
1. When the human makes a decision, document the reasoning
2. When the human corrects the agent, update the relevant pattern
3. When the human expresses a preference, record it

**Why this matters:** The agent becomes more aligned over time, reducing the need for human correction.

---

### 5. Project Awareness

Autonomous agents need to know what projects exist and their status.

**Setup:**
1. Create symlinks or paths to all relevant repositories
2. Document each project's purpose and current state
3. Define what work is permitted on each

**Example structure:**

```
workspace/
├── repos/
│   ├── project-a/  → Can commit to feature branches
│   ├── project-b/  → Read-only (client work)
│   └── project-c/  → Full access
└── projects/
    └── KANBAN.md   → Tracks work across all repos
```

**Why this matters:** The agent can't help with projects it doesn't know about.

---

## Implementation Checklist

### Initial Setup
- [ ] Create PERMISSIONS.md with explicit grants
- [ ] Configure HEARTBEAT.md with periodic tasks
- [ ] Set up KANBAN.md for work tracking
- [ ] Create PATTERNS.md for human patterns
- [ ] Set up daily memory files (memory/YYYY-MM-DD.md)
- [ ] Configure repo access (symlinks or paths)

### Ongoing Maintenance
- [ ] Agent updates KANBAN during work
- [ ] Agent captures patterns as they emerge
- [ ] Human reviews and adjusts permissions as needed
- [ ] Weekly: Review PATTERNS.md for accuracy
- [ ] Monthly: Archive old memory files

---

## Anti-Patterns

### ❌ Don't: Assume Permission
If something isn't explicitly granted, ask first.

### ❌ Don't: Work Without Tracking
Every action should be logged. If it's not in a file, it didn't happen.

### ❌ Don't: Overwhelm With Updates
Proactive updates should be meaningful, not constant. Batch small updates.

### ❌ Don't: Skip the Why
When documenting work, always explain reasoning. Future sessions need context.

### ❌ Don't: Forget Boundaries
Confidential projects stay confidential. External actions require approval.

---

## Example: Full Autonomous Workflow

```
Human grants permission (one-time)
           ↓
Agent receives heartbeat poll
           ↓
Agent reads: HEARTBEAT.md, KANBAN.md, PATTERNS.md
           ↓
Agent identifies work to do
           ↓
Agent does the work
           ↓
Agent updates: KANBAN.md, memory/YYYY-MM-DD.md
           ↓
Agent commits to feature branch (if code changed)
           ↓
If significant: Agent reaches out to human
           ↓
If routine: Agent replies HEARTBEAT_OK
           ↓
Repeat on next heartbeat
```

---

## Resources

- **Clawdbot docs:** https://docs.clawd.bot
- **Original inspiration:** Alex Finn's "Henry" ClawdBot
- **Related skills:** skill-ralph-wiggum.md (autonomous coding loops)

---

## Attribution

This skill was developed by GigaBrain for the LegoGigaBrain workspace.

**Why documented:** So anyone can replicate autonomous agent setups.

**How to use:** Follow the implementation checklist, adapt file names to your context.
