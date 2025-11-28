# LEGO Agent OS – Manual

## 1. What this is

LEGO Agent OS is a reusable multi-agent setup for Claude Code.

It gives you:
- A base CLAUDE spec (`CLAUDE.base.md`)
- A library of sub-agents in `.claude/agents/`
- Workflow commands in `.claude/commands/`
- Reusable skills in `.claude/skills/`

You can copy this into any project and adapt it.

## 2. How to install into a new project

1. Copy the `.claude` folder into the project root.
2. Copy `CLAUDE.base.md` content into the project's `CLAUDE.md`, then:
   - add project-specific context (stack, goals, architecture)
3. Commit the files.

Now open the project in Claude Code:
- Use `/agents` to see available sub-agents.
- Use `/spec-and-plan` and `/implement-feature` for structured workflows.

## 3. How to create a new agent

1. Duplicate `templates/TEMPLATE_AGENT.md` into `.claude/agents/<new-name>.md`.
2. Fill in:
   - `name`, `description`, and `tools` in the frontmatter.
   - Mission, responsibilities, workflow, checklist.
3. Save the file – Claude Code will pick it up automatically.
4. Optionally add a new command that uses this agent.

## 4. How to create a new command

1. Duplicate `templates/TEMPLATE_COMMAND.md` into `.claude/commands/<new-command>.md`.
2. Describe:
   - goal
   - which agents it should delegate to
   - step-by-step workflow
   - required output format
3. Run it in Claude Code with `/<new-command>`.

## 5. How to create a new skill

1. Duplicate `templates/TEMPLATE_SKILL.md` into `.claude/skills/<skill-name>.md`.
2. Fill in purpose, checklist, patterns.
3. Reference it by name inside agent prompts and specs.

## 6. Best practices

- Keep CLAUDE specs short but precise – don’t bury key instructions.  
- Use the **Explore → Plan → Execute** pattern for any non-trivial work.  
- For high-risk work (security, money movement, infra), use:
  - `@senior-architect` → design
  - `@solidity-protocol-engineer` / `@backend-engineer` → implementation
  - `@security-auditor` → review  
- Regularly update CLAUDE.md as your project evolves.

## 7. Using with MCPs

When you enable MCP servers (e.g. Playwright for UI checks), note them in:
- `CLAUDE.md` under Tools
- relevant agents (e.g. UX agent) with short instructions on when to use them.
