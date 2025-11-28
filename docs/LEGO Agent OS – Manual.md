# LEGO Agent OS – Manual

## 1. What this is

LEGO Agent OS is a reusable multi-agent setup for Claude Code.

It gives you:
- A base CLAUDE spec (`CLAUDE.base.md`)
- A library of sub-agents in `.claude/agents/`
- Workflow commands in `.claude/commands/`
- Reusable skills in `.claude/skills/`

You can copy this into any project and adapt it.

## 2. The 3-layer context model

LEGO Agent OS follows the same principles as modern Agent OS designs:

1. **Standards (how we build)**
   - Live under `standards/` and `.claude/skills/`.
   - Examples:
     - global naming and style
     - backend API design
     - frontend component patterns
     - security and testing principles.
   - They define what “good” looks like, independent of any single product.

2. **Product (what we are building)**
   - For each project, we fill in templates from `product-templates/`:
     - `mission`
     - `roadmap`
     - `tech-stack`.
   - These files describe the domain, audience, and technical constraints.

3. **Specs (what we are building next)**
   - Individual features use templates from `spec-templates/`:
     - feature spec
     - tasks breakdown
     - verification checklist.
   - Specs plug into commands like `/spec-and-plan` and `/verify-implementation`.

Claude Code uses all three layers:
- Standards → via **skills** and agent prompts.
- Product → via project-specific `CLAUDE.md` and product docs.
- Specs → via commands that explicitly read spec files.


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

## 8. Built-in workflows (commands)

LEGO Agent OS comes with several reusable Claude Code commands:

- `/spec-and-plan`
  - Turn a vague feature idea into:
    - a spec (using `spec-templates/feature-spec.template.md`)
    - a tasks breakdown
    - a testing strategy.

- `/implement-feature`
  - Implement one slice of a spec with:
    - code changes
    - updated tests
    - a short change log.

- `/code-review`
  - Perform a structured code review of a diff / PR.
  - Group findings by severity and suggest concrete fixes.

- `/security-review`
  - Perform a security-focused review across backend, frontend, or contracts.
  - Use checklists and threat modeling to surface real risks.

- `/smart-contract-audit`
  - Specialized workflow for auditing smart contracts.
  - Uses the Smart Contract Audit Checklist skill.

- `/verify-implementation`
  - Check whether an implementation matches a given spec.
  - Maps acceptance criteria → code → tests and highlights gaps.

You can add new commands by dropping additional markdown files into `.claude/commands/` following the templates in `templates/`.
