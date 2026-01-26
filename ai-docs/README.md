# AI Docs: Curated Codebase Intelligence

This folder contains curated documentation that provides Claude with pre-digested context about your codebase. The concept originates from Rasmus Widing's PRPs (Product Requirement Prompts) framework.

## Purpose

Traditional PRDs tell AI what to build but under-specify the context and how to build it. This causes AI-driven coding attempts to stall at 80% completion.

**ai-docs solves this** by providing:
- Pre-digested architectural knowledge
- Codebase patterns and conventions
- Integration points and gotchas
- Domain-specific context

## What to Include

### Architecture Overview
```markdown
# Architecture Overview

## System Boundaries
- [What components exist]
- [How they communicate]
- [Where data flows]

## Key Patterns
- [Naming conventions]
- [File organization]
- [Common abstractions]
```

### API Contracts
```markdown
# API Reference

## Endpoints
- [Endpoint patterns]
- [Auth requirements]
- [Response formats]

## Integration Points
- [External services]
- [Webhooks]
- [Event systems]
```

### Domain Knowledge
```markdown
# Domain Context

## Business Logic
- [Core concepts]
- [Invariants]
- [Edge cases]

## Terminology
- [Domain-specific terms]
- [Acronyms]
```

## How Claude Uses This

When running PRPs workflows (`/prp-investigate`, `/prp-debug`, `/prp-fix`), Claude will:

1. **Read ai-docs first** before analyzing issues
2. **Apply context** to understand codebase patterns
3. **Reference conventions** when proposing fixes
4. **Avoid common pitfalls** documented here

## Maintenance

Keep ai-docs updated when:
- Architecture changes significantly
- New patterns are introduced
- Common issues are discovered
- Onboarding reveals knowledge gaps

## File Naming Convention

```
ai-docs/
├── README.md                    # This file
├── architecture-overview.md     # System design
├── api-contracts.md             # API documentation
├── domain-context.md            # Business logic
├── patterns-and-conventions.md  # Code patterns
├── integration-points.md        # External services
└── common-pitfalls.md           # Known gotchas
```

## Attribution

This pattern is inspired by Rasmus Widing's PRPs framework:
- GitHub: https://github.com/Wirasm/PRPs-agentic-eng
- Website: https://rasmuswiding.com

The core insight: "Over-specifying what to build while under-specifying the context, and how to build it, is why so many AI-driven coding attempts stall at 80%."
