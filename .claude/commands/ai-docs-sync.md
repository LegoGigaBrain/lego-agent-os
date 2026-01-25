# ai-docs-sync

Auto-generate and update codebase intelligence documentation.

---

## Overview

This command scans the codebase and generates/updates AI-readable documentation that helps agents understand the project faster and make better decisions.

## When to Use

- After major codebase changes
- When onboarding to a new project
- Before major sprints
- When agents seem to misunderstand patterns
- Periodically (weekly/bi-weekly)

## What It Does

1. **Scans** codebase structure and patterns
2. **Extracts** architecture and conventions
3. **Identifies** common patterns and anti-patterns
4. **Documents** recent pitfalls (from PRPs)
5. **Generates** AI-optimized documentation

---

## Output Files

```
ai-docs/
  architecture-overview.md    # System architecture summary
  patterns-and-conventions.md # Code patterns to follow
  common-pitfalls.md          # Mistakes to avoid
  api-inventory.md            # Available APIs and endpoints
  dependency-graph.md         # Module dependencies
  tech-stack.md               # Technologies and versions
```

---

## Process

### Step 1: Structure Scan

Scan and document:
- Directory structure
- Module organization
- File naming patterns
- Entry points

Output: High-level architecture map

### Step 2: Pattern Extraction

Identify recurring patterns:
- Code organization (feature-based, layer-based)
- Naming conventions (camelCase, snake_case, etc.)
- Import patterns
- Error handling patterns
- Testing patterns

Output: Conventions document

### Step 3: API Inventory

Catalog available APIs:
- REST endpoints
- GraphQL queries/mutations
- Smart contract functions
- Internal service APIs

Output: API reference

### Step 4: Pitfall Mining

Extract from PRPs and past bugs:
- Common failure modes
- Tricky edge cases
- Non-obvious gotchas
- Security considerations

Output: Pitfalls document

### Step 5: Dependency Analysis

Map dependencies:
- External packages
- Internal modules
- Service dependencies
- Data flow

Output: Dependency graph

---

## Generated Documentation Format

### architecture-overview.md

```markdown
# Architecture Overview

## System Type
[Monolith / Microservices / Serverless / etc.]

## Core Modules
- **module-a**: [purpose]
- **module-b**: [purpose]

## Data Flow
[Request] → [API Layer] → [Service Layer] → [Data Layer]

## Key Boundaries
- Frontend ↔ Backend: REST API at /api/*
- Backend ↔ Database: TypeORM repository pattern
- Backend ↔ Blockchain: ethers.js provider

## Entry Points
- Web: src/pages/index.tsx
- API: src/api/routes.ts
- CLI: src/cli/index.ts
```

### patterns-and-conventions.md

```markdown
# Patterns and Conventions

## Naming
- Files: kebab-case.ts
- Components: PascalCase.tsx
- Functions: camelCase
- Constants: SCREAMING_SNAKE_CASE

## Code Organization
- Feature-based folders in src/features/
- Shared utilities in src/lib/
- Types co-located with implementation

## Error Handling
- Use custom error classes in src/errors/
- Always include error codes
- Log with structured format

## Testing
- Unit tests: *.test.ts
- Integration tests: *.integration.test.ts
- E2E tests: cypress/e2e/
```

### common-pitfalls.md

```markdown
# Common Pitfalls

## Authentication
- PITFALL: Forgetting to refresh tokens
- SOLUTION: Use the auth middleware, not direct token checks

## Database
- PITFALL: N+1 queries with relations
- SOLUTION: Use .leftJoinAndSelect() for known relations

## Smart Contracts
- PITFALL: Not checking return values from external calls
- SOLUTION: Always use SafeERC20 or check returns

## API
- PITFALL: Inconsistent error response format
- SOLUTION: Use errorResponse() helper from src/lib/api
```

### api-inventory.md

```markdown
# API Inventory

## REST Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | /api/users | Yes | List users |
| POST | /api/users | No | Create user |
| GET | /api/users/:id | Yes | Get user |

## Smart Contract Functions

| Contract | Function | Access | Description |
|----------|----------|--------|-------------|
| Vault | deposit(uint256) | Public | Deposit tokens |
| Vault | withdraw(uint256) | Public | Withdraw tokens |
| Vault | setFee(uint256) | Owner | Update fee |
```

---

## Integration Points

### With PRPs

Mines from:
- `docs/prp/*/investigation-report.md`
- `docs/prp/*/debug-report.md`

Extracts:
- Root causes
- Fix patterns
- Gotchas discovered

### With Specs

References:
- `docs/specs/*/feature-spec.md`
- `docs/specs/*/tasks-breakdown.md`

Validates:
- Implementation matches spec
- No drift from architecture

### With Context Sync

Feeds into:
- `CLAUDE.base.md` updates
- Folder-level CLAUDE.md files
- Agent knowledge base

---

## Quick Start

```
/ai-docs-sync
```

Options:
```
/ai-docs-sync --full          # Complete regeneration
/ai-docs-sync --incremental   # Update changed areas only
/ai-docs-sync --pitfalls-only # Just update pitfalls from PRPs
/ai-docs-sync --api-only      # Just update API inventory
```

---

## Output Location

Default: `ai-docs/`

Can be configured in project settings:
```yaml
# .claude/config.yml
ai_docs:
  output_dir: ai-docs/
  include_patterns: ["src/**", "contracts/**"]
  exclude_patterns: ["node_modules/**", "dist/**"]
```

---

## Freshness

Each generated file includes:
```markdown
---
generated: 2026-01-22T10:30:00Z
source_hash: abc123
freshness: current
---
```

Agents can check freshness before relying on docs.

---

## Best Practices

### Run After

- Major refactors
- New feature completion
- PRP resolution
- Dependency updates

### Don't Run

- During active development (wait for stability)
- On feature branches (run on main/develop)

### Review Output

Always review generated docs for:
- Accuracy
- Completeness
- Sensitive information (remove if found)

---

## Example Session

```
User: /ai-docs-sync

Scanning codebase...
- 156 TypeScript files
- 12 Solidity contracts
- 45 test files

Extracting patterns...
- Naming: kebab-case files, PascalCase components
- Structure: feature-based organization
- Testing: Jest + Foundry

Mining pitfalls...
- 8 PRPs found
- 12 unique pitfalls extracted

Generating documentation...
- [x] architecture-overview.md
- [x] patterns-and-conventions.md
- [x] common-pitfalls.md
- [x] api-inventory.md
- [x] dependency-graph.md
- [x] tech-stack.md

AI Docs updated in ai-docs/
Last sync: 2026-01-22T10:30:00Z
```

---

## Success Criteria

- [ ] All output files generated
- [ ] Architecture accurately represents codebase
- [ ] Patterns match actual conventions
- [ ] Pitfalls include recent PRPs
- [ ] API inventory is complete
- [ ] No sensitive data exposed

---

*This command supports the LEGO Agent OS goal of maintaining high-quality codebase intelligence for autonomous agent operation.*
