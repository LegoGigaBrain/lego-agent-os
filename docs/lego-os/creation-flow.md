# LEGO Agent OS: Creation Flow

How to create and extend Skills, Agents, and Commands in the proper order.

---

## The Hierarchy

```
              SKILLS (Methodology)
                    ↑
                    │ empower
                    │
              AGENTS (Roles)
                    ↑
                    │ orchestrate
                    │
             COMMANDS (Workflows)
```

**Critical Insight**: Skills are the foundation. Agents are role wrappers that reference skills for operational methodology. Commands orchestrate agents to execute workflows.

---

## The Golden Rule

> **Skills first. Always.**

An agent without a dedicated skill is just a role description with no operational methodology. The skill provides the "how" - the frameworks, templates, checklists, and processes that enable senior-level execution.

---

## Creation Order

### 1. Start with the Skill

Before creating an agent, create its primary skill:

```
.claude/skills/skill-[domain].md
```

A skill should contain:
- **Core Philosophy**: The fundamental beliefs and principles
- **Frameworks**: Structured approaches (templates, matrices, processes)
- **Templates**: Reusable document structures
- **Checklists**: Quality verification lists
- **Best Practices**: Do's and don'ts
- **Application**: Which agents use this skill

**Example**: Before creating `@analytics-strategist`, create `skill-measurement-frameworks.md` containing KPI hierarchies, metrics definitions, dashboard design principles, etc.

### 2. Create the Agent

After the skill exists, create the agent:

```
.claude/agents/[agent-name].md
```

An agent should:
- Reference the PRIMARY skill explicitly
- Reference supporting skills
- Define role and responsibilities
- Include workflow (how work is done)
- Include quality checklist
- Define collaboration patterns

**Key Section - Skills Reference**:
```markdown
## Standards Awareness (Mandatory)

2. Use the dedicated skills in `.claude/skills/`:
   - **skill-[primary].md** (PRIMARY - main methodology)
   - skill-[supporting1].md (for X purpose)
   - skill-[supporting2].md (for Y purpose)
```

### 3. Update the Agent Registry

After creating the agent, update `.claude/agent-registry.json`:

```json
"[agent-name]": {
  "department": "[department]",
  "capabilities": ["cap1", "cap2"],
  "skills": ["skill-primary", "skill-supporting1"],
  "commands": ["relevant-command"],
  "when_to_use": "Description of when to use this agent"
}
```

Also update:
- `task_routing` if the agent handles a task category
- `skill_to_agents` mapping
- `keyword_to_category` if new keywords apply

### 4. Create Commands (if needed)

Commands orchestrate agents for specific workflows:

```
.claude/commands/[command-name].md
```

A command should:
- Define the workflow steps
- Specify which agents are involved at each step
- Include success criteria
- Reference relevant skills

---

## Skill Structure Template

```markdown
# Skill: [Name]

## Purpose

[What this skill enables]

---

## Core Philosophy

> "[Fundamental principle]"

[Beliefs and principles that guide this skill]

---

## Key Frameworks

### Framework 1: [Name]

[Description and structure]

### Framework 2: [Name]

[Description and structure]

---

## Templates

### [Template Name]

\`\`\`markdown
[Template content]
\`\`\`

---

## Checklists

### [Checklist Name]

- [ ] Item 1
- [ ] Item 2

---

## Best Practices

### Do
- [Practice 1]
- [Practice 2]

### Don't
- [Anti-pattern 1]
- [Anti-pattern 2]

---

## Application

This skill is used by:
- `@agent1` for [purpose]
- `@agent2` for [purpose]

Reference this skill when:
- [Situation 1]
- [Situation 2]

---

*Last updated: [Date]*
```

---

## Agent Structure Template

```markdown
---
name: [agent-name]
department: [department]
description: [One-line description]
tools: [Comma-separated tool list]
---

## Standards Awareness (Mandatory)

Before performing ANY task, you MUST:

1. Read all relevant standards from the `/standards` folder:
   - `standards/[relevant]/*`

2. Use the dedicated skills in `.claude/skills/`:
   - **skill-[primary].md** (PRIMARY - [what it provides])
   - skill-[supporting].md (for [purpose])

You MUST apply these standards to all [domain] work.

---

You are a **Senior [Role]** in LEGO Agent OS.

You specialize in:
- [Specialty 1]
- [Specialty 2]

## Mission

[What this agent is responsible for]

## Responsibilities

### 1. [Area]
- [Responsibility]

## Workflow

1. **[Phase]**
   - [Step]

## Quality Checklist

- [ ] [Quality item]

## Collaboration

You work closely with:
- **[Agent]**: [Relationship]
```

---

## Example: Creating a New Agent

Let's say you want to create a "Data Engineer" agent.

### Step 1: Identify Needed Skills

What methodology does a data engineer need?
- Data pipeline design
- Data quality practices
- ETL patterns
- Data governance

Do these skills exist? If not, create them first.

### Step 2: Create the Primary Skill

```markdown
# Skill: Data Engineering

## Purpose
Methodology for designing and maintaining data pipelines, ensuring data quality, and enabling analytics.

## Core Philosophy
> "Data is a product. Treat it like one."

## Key Frameworks

### Data Pipeline Design
[Methodology for pipeline architecture]

### Data Quality Framework
[Methodology for ensuring data quality]

...
```

Save as: `.claude/skills/skill-data-engineering.md`

### Step 3: Create the Agent

```markdown
---
name: data-engineer
department: engineering
description: Data engineer who designs pipelines, ensures data quality, and enables analytics infrastructure.
tools: Read, Write, Edit, Bash, Glob, Grep
---

## Standards Awareness (Mandatory)

2. Use the dedicated skills in `.claude/skills/`:
   - **skill-data-engineering.md** (PRIMARY - pipelines, quality, ETL)
   - skill-data-modelling-standards.md (for schema design)
   - skill-backend-api-standards.md (for API integration)

...
```

Save as: `.claude/agents/data-engineer.md`

### Step 4: Update Registry

```json
"data-engineer": {
  "department": "engineering",
  "capabilities": ["data-pipelines", "etl", "data-quality", "analytics-infrastructure"],
  "skills": ["skill-data-engineering", "skill-data-modelling-standards", "skill-backend-api-standards"],
  "commands": ["implement-feature"],
  "escalates_to": ["senior-architect"],
  "when_to_use": "Data pipelines, ETL jobs, data quality, analytics infrastructure"
}
```

Update `skill_to_agents`:
```json
"skill-data-engineering": ["data-engineer", "analytics-strategist"]
```

Update `task_routing`:
```json
"data": {
  "primary": ["data-engineer"],
  "supporting": ["backend-engineer", "analytics-strategist"],
  "review": ["pragmatic-code-reviewer"]
}
```

### Step 5: Create Commands (if needed)

If this agent needs a dedicated workflow, create a command:

```markdown
# data-pipeline-review

Review data pipeline implementations for quality, performance, and reliability.

## Agents
- Primary: @data-engineer
- Supporting: @senior-architect

...
```

---

## Skill-Agent Mapping Philosophy

### One Primary, Many Supporting

Each agent should have:
- **1 Primary Skill**: The core methodology for their domain
- **2-4 Supporting Skills**: Related methodologies they draw from

### Skill Reuse

Skills can be used by multiple agents:
- `skill-business-strategy` is used by `@business-strategist`, `@product-manager`, `@analytics-strategist`
- `skill-testing-standards` is used by `@backend-engineer`, `@solidity-protocol-engineer`, `@pragmatic-code-reviewer`

### Skill Granularity

Skills should be:
- **Specific enough** to provide concrete methodology
- **General enough** to be reusable across related agents

Good: `skill-user-research` (focused methodology)
Bad: `skill-research` (too general)
Bad: `skill-user-interview-guide-writing` (too specific)

---

## Extending Existing Agents

When an agent needs new capabilities:

1. **Check if a skill exists** for the new capability
2. **Create the skill** if it doesn't exist
3. **Update the agent** to reference the new skill
4. **Update the registry** with new skill mapping

---

## Quality Checklist for New Additions

### New Skill
- [ ] Has clear purpose statement
- [ ] Contains actionable frameworks
- [ ] Includes reusable templates
- [ ] Has quality checklists
- [ ] Lists which agents use it
- [ ] Follows naming convention (`skill-[domain].md`)

### New Agent
- [ ] References a PRIMARY skill
- [ ] References supporting skills
- [ ] Has clear responsibilities
- [ ] Has defined workflow
- [ ] Has quality checklist
- [ ] Defines collaboration patterns
- [ ] Added to agent-registry.json
- [ ] skill_to_agents mapping updated

### New Command
- [ ] Defines workflow steps
- [ ] Specifies involved agents
- [ ] Has success criteria
- [ ] Has dependency order
- [ ] Added to command_to_agents in registry

---

## Common Mistakes

### 1. Creating Agents Without Skills
**Wrong**: Create `@data-scientist` agent with no `skill-data-science.md`
**Right**: Create skill first, then agent

### 2. Vague Skill References
**Wrong**: "Use relevant skills"
**Right**: "Use **skill-x.md** (PRIMARY - for Y purpose)"

### 3. Missing Registry Updates
**Wrong**: Create agent but don't add to registry
**Right**: Always update registry after creating agent

### 4. Orphaned Skills
**Wrong**: Create skill but no agent uses it
**Right**: Skills should always be referenced by at least one agent

---

## Summary

1. **Skills are the foundation** - Create them first
2. **Agents reference skills** - Always specify PRIMARY skill
3. **Commands orchestrate agents** - Chain agents into workflows
4. **Registry connects everything** - Keep it updated

The power of LEGO Agent OS comes from this layered architecture. Skills provide reusable methodology. Agents apply methodology to specific roles. Commands chain agents into powerful workflows.

---

*Last updated: 2026-01-22*
