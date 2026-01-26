# workflow-website

Complete website development from brand strategy to deployed site.

---

## Overview

This workflow orchestrates the complete website development lifecycle, from strategic foundation through UX design, implementation, security review, and code review. Ensures brand alignment across every touchpoint.

## Prerequisites

Before starting this workflow, ensure you have:
- **Brand Strategy** (`docs/brand/brand-strategy.md`) - Core positioning and narrative
- **Verbal Identity** (`docs/brand/verbal-identity.md`) - Voice, tone, vocabulary
- **Visual Identity** (`docs/brand/visual-identity.md`) - Visual direction and design principles

If missing prerequisites, run `/workflow-brand-launch` first.

## When to Use

- New website development
- Complete website redesign
- Landing page development with full brand integration
- Web application frontend development
- Marketing site with brand-aligned UX

## Agents Involved

| Role | Agent | Responsibility |
|------|-------|----------------|
| **Design Brief** | `@design-strategist` | Translate brand strategy to design direction |
| **UX Strategy** | `@ux-product-strategist` | User flows, UX states, interaction design |
| **UX Copy** | `@ux-writer` | Microcopy, error states, onboarding text |
| **Design Review** | `@design-reviewer` | Review UX flows and UI screens |
| **Architecture** | `@senior-architect` | Technical architecture, component structure |
| **Implementation** | `@backend-engineer` | Frontend/backend code, APIs, services |
| **Security** | `@security-auditor` | Security review, vulnerability assessment |
| **Code Review** | `@pragmatic-code-reviewer` | Code quality, correctness, maintainability |

## Workflow Steps

### Step 1: Design Brief
**Command:** `/design-brief`

Create design direction from brand foundations:
- Visual territory application
- Design principles for web
- Component mood direction
- Interaction patterns

**Agents:**
- `@design-strategist`
- `@visual-designer` (supporting)

**Output:**
```
docs/design/
  design-brief.md
```

Contains:
- Design objectives
- Visual direction application
- Interaction principles
- Component guidelines

### Step 2: UX Strategy
**Command:** `/ux-review` (planning mode)

Design the user experience:
- User flows for key journeys
- UX states (empty, loading, error, success)
- Interaction patterns
- Responsive considerations

**Agents:**
- `@ux-product-strategist`

**Output:**
```
docs/design/
  ux-strategy.md
  user-flows/
    [flow-name].md
```

### Step 3: UX Copy
**Command:** `/ux-copy-review`

Create all user-facing text:
- Microcopy for all UI elements
- Error messages
- Empty states
- Onboarding text
- CTAs and buttons
- Notifications

**Agents:**
- `@ux-writer`
- `@verbal-identity-designer` (review for brand voice)

**Output:**
```
docs/design/
  ux-copy-guide.md
```

### Step 4: Design Review
**Command:** `/design-review`

Review all design work for quality:
- UX flow coherence
- Brand alignment
- Accessibility considerations
- Interaction consistency

**Agents:**
- `@design-reviewer`

**Output:**
```
docs/reviews/
  design-review-[date].md
```

### Step 5: Technical Architecture
**Command:** `/architecture-review` (planning mode)

Design the technical foundation:
- Component architecture
- State management approach
- API design
- Performance strategy
- Deployment architecture

**Agents:**
- `@senior-architect`

**Output:**
```
docs/architecture/
  website-architecture.md
```

Contains:
- Component structure
- Data flow
- Technology choices
- Deployment strategy

### Step 6: Implementation
**Command:** `/implement-feature`

Build the website:
- Component implementation
- API integration
- Styling with brand tokens
- Responsive implementation
- Accessibility implementation

**Agents:**
- `@backend-engineer` (implementation)
- `@senior-architect` (architecture questions)

**Output:**
- Source code
- Test files
- Build configuration

### Step 7: Security Review
**Command:** `/security-review`

Review for security vulnerabilities:
- OWASP top 10 check
- Authentication/authorization review
- Input validation
- XSS/CSRF protection
- Dependency audit

**Agents:**
- `@security-auditor`

**Output:**
```
docs/reviews/
  security-review-[date].md
```

### Step 8: Code Review
**Command:** `/pragmatic-code-review`

Final code quality review:
- Correctness
- Clarity
- Maintainability
- Performance
- Safety

**Agents:**
- `@pragmatic-code-reviewer`

**Output:**
```
docs/reviews/
  code-review-[date].md
```

---

## Quick Start

```
/workflow-website "marketing site for SaaS product"
```

This will execute all 8 steps in sequence, producing a complete, reviewed website.

---

## Success Criteria

- [ ] Brand strategy and identity documents exist as prerequisites
- [ ] Design brief translates brand to web design direction
- [ ] UX strategy covers all key user flows
- [ ] UX copy is brand-voice aligned
- [ ] Design review passes with no blockers
- [ ] Technical architecture is documented
- [ ] Implementation follows architecture
- [ ] Security review passes with no critical findings
- [ ] Code review passes with no blockers
- [ ] All tests are passing

---

## Escalation

If blocked during any step:
- Design questions: Escalate to `@design-strategist`
- Brand alignment: Escalate to `@brand-strategist`
- Architecture issues: Escalate to `@senior-architect`
- Security concerns: Escalate to `@security-auditor`
- UX questions: Escalate to `@ux-product-strategist`

See `.claude/escalation-matrix.md` for full escalation protocol.

---

## Handoff Structure

```
design-strategist
    |
    +---> ux-product-strategist ---> ux-writer
    |                                    |
    +------------------------------------+
    |
    +---> design-reviewer (review checkpoint)
    |
    +---> senior-architect
    |
    +---> backend-engineer (implementation)
    |
    +---> security-auditor ---> pragmatic-code-reviewer
```

---

## Ralph Wiggum Integration

For autonomous execution of this workflow:

1. **Generate PRD**: Run `/ralph-plan` with the website description to create PRD.md and progress.txt
2. **Run Script**: Execute in terminal:
   ```powershell
   ./scripts/ralph/ralph.ps1 -MaxIterations 100
   ```
3. **Review**: When complete, run final `/security-review` and `/design-review` with stakeholders

The canonical Ralph workflow spawns fresh context per iteration, preventing context rot on large website projects.

---

## Dependencies

| This Command | Requires | Followed By |
|--------------|----------|-------------|
| `/design-brief` | Brand identity docs | UX Strategy |
| `/ux-review` | Design brief | UX Copy |
| `/ux-copy-review` | UX strategy | Design Review |
| `/design-review` | UX copy | Architecture |
| `/architecture-review` | Design review pass | Implementation |
| `/implement-feature` | Architecture | Security Review |
| `/security-review` | Implementation | Code Review |
| `/pragmatic-code-review` | Security pass | Nothing (terminal) |

---

## Output Structure

After completion, you'll have:

```
docs/
  design/
    design-brief.md          # Visual direction for web
    ux-strategy.md           # User experience design
    ux-copy-guide.md         # All UI text
    user-flows/              # Flow diagrams
  architecture/
    website-architecture.md  # Technical design
  reviews/
    design-review-[date].md  # Design quality report
    security-review-[date].md # Security assessment
    code-review-[date].md    # Code quality report

src/                         # Implementation code
tests/                       # Test files
```

---

## Example Session

```
User: /workflow-website "portfolio site for creative agency"

Step 1: Running /design-brief...
- Visual territory: Bold, minimal, portfolio-focused
- Interaction: Smooth transitions, gallery focus
- Components: Hero, project grid, case study layout

Step 2: Running /ux-review (planning)...
- Flows: Browse portfolio, View case study, Contact
- States: Loading animations, empty states, error handling
- Responsive: Mobile-first, tablet breakpoints

Step 3: Running /ux-copy-review...
- Microcopy: CTAs, navigation, contact form
- Voice: Confident, creative, professional
- Error messages: Helpful, on-brand

Step 4: Running /design-review...
- 3 findings (all minor)
- Accessibility: WCAG 2.1 AA compliant
- Brand alignment: PASS

Step 5: Running /architecture-review...
- Stack: Next.js, Tailwind, Sanity CMS
- Components: Atomic design structure
- Performance: ISR for portfolio pages

Step 6: Running /implement-feature (per component)...
[... implementation output ...]

Step 7: Running /security-review...
- 0 critical, 0 high, 2 medium findings
- Fixing medium findings...
- Re-running review... PASS

Step 8: Running /pragmatic-code-review...
- 1 medium finding (fixed)
- Code quality: PASS

WEBSITE_COMPLETE
```
