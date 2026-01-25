# ralph-loop (DEPRECATED)

**This command has been deprecated.** The plugin-based Ralph loop does not work correctly because it continues in the same session with compaction, leading to context rot.

---

## Use the Canonical Ralph Workflow Instead

### Step 1: Generate PRD

```
/ralph-plan
```

This will:
- Ask clarifying questions
- Generate `PRD.md` with user stories
- Create `progress.txt` for learnings
- Suggest iteration count

### Step 2: Run Ralph Script

In your terminal (PowerShell or Bash):

**PowerShell:**
```powershell
./scripts/ralph/ralph.ps1 -MaxIterations 25
```

**Bash:**
```bash
./scripts/ralph/ralph.sh 25
```

This spawns a **NEW Claude Code instance per iteration** with fresh context.

### Step 3: Review

After Ralph completes (or reaches max iterations):

```
"Ralph finished, please review what was built"
```

---

## Why the Change?

The original plugin continues in the **same session**, using compaction to manage context. This causes "context rot" where the AI loses important information as the conversation grows.

The canonical approach starts a **fresh Claude Code instance** each iteration. Memory persists only through files:
- `PRD.md` - Task checkboxes
- `progress.txt` - Learnings log
- Git commits

---

## Documentation

- Skill documentation: `.claude/skills/skill-ralph-wiggum.md`
- PRD generation: `.claude/commands/ralph-plan.md`
- Scripts: `scripts/ralph/`
- Research materials: `docs/research/`
