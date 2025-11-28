# spec-and-plan

You are running the **spec-and-plan** workflow.

Goal:
Turn a fuzzy feature request into:
- a clear spec
- a breakdown of tasks
- a suggested agent assignment

Steps:

1. Ask the user to paste or describe the feature/issue.
2. Call **@senior-architect** to:
   - restate the problem
   - list constraints and open questions
   - propose a high-level design
3. Call **@ux-product-strategist** (if UI is involved) to:
   - outline key user flows
   - propose UX states and edge cases
4. Produce:
   - feature spec (problem, solution, non-goals)
   - architecture outline (modules, contracts, APIs)
   - implementation plan split into small tasks
   - testing strategy (unit, integration, E2E)

Keep everything concise and numbered so it can be tracked as tickets.
