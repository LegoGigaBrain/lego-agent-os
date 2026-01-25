# Skill: User Research

## Purpose

Provide methodology for conducting rigorous user research, from study design through insight synthesis and communication.

---

## Core Philosophy

> "Fall in love with the problem, not the solution."

Effective user research:
1. Answers specific questions that inform decisions
2. Uses appropriate methodology for the question type
3. Maintains rigor while staying practical
4. Transforms data into actionable insights

---

## Research Question Framework

### The Decision-First Approach

```
We need to decide: [DECISION]
To decide, we need to understand: [QUESTION]
We'll learn this by: [METHOD]
Success looks like: [OUTCOME]
```

### Question Types

| Type | Purpose | Methods |
|------|---------|---------|
| **Exploratory** | Discover unknowns | Interviews, contextual inquiry |
| **Descriptive** | Understand behaviors | Observation, surveys, analytics |
| **Evaluative** | Test solutions | Usability testing, A/B tests |
| **Causal** | Explain why | Experiments, longitudinal studies |

---

## Methodology Selection Matrix

| Research Need | Best Methods | Sample Size | Duration |
|---------------|--------------|-------------|----------|
| Understand user needs | Interviews, contextual inquiry | 5-12 | 1-2 weeks |
| Validate concepts | Concept testing | 5-8 | 1 week |
| Test usability | Usability testing | 5-8 | 1-2 weeks |
| Measure attitudes | Surveys | 100-400+ | 1-2 weeks |
| Track behavior | Analytics, diary studies | Varies | Ongoing |
| Compare options | A/B testing | Statistical power | 2-4 weeks |

### The 5-User Rule

For usability testing, 5 users find ~85% of usability problems.
- 5 users per distinct user segment
- Test early and often (multiple rounds of 5)
- More users for quantitative studies

---

## Interview Guide Template

```markdown
# Interview Guide: [Study Name]

## Objectives
- [Primary research question]
- [Secondary questions]

## Participant Criteria
- Must have: [requirements]
- Nice to have: [preferences]
- Exclude: [disqualifiers]

## Session Structure (60 min)

### Warm-up (5 min)
- Thank them for participating
- Explain purpose (without biasing)
- Get permission to record
- "There are no wrong answers"

### Context (10 min)
- Tell me about your role/situation
- Walk me through a typical [relevant activity]
- What tools/processes do you currently use?

### Core Questions (30 min)

#### Topic 1: [Area]
- [Open question]
- [Follow-up probes]:
  - "Tell me more about that"
  - "What happened then?"
  - "How did that make you feel?"

#### Topic 2: [Area]
- [Open question]
- [Follow-up probes]

### Concept/Prototype (10 min)
- Show [concept/prototype]
- "What are your initial thoughts?"
- "What would you expect to happen if you [action]?"
- "How does this compare to what you do today?"

### Wrap-up (5 min)
- Is there anything else you'd like to share?
- Any questions for me?
- Thank and explain next steps

## Analysis Focus
- Key themes to listen for
- Specific behaviors to note
- Quotes to capture
```

---

## Usability Testing Protocol

### Moderated Testing Structure

```markdown
# Usability Test Protocol: [Feature/Product]

## Test Objectives
- Can users complete [task]?
- Where do users encounter friction?
- What mental models do users bring?

## Tasks

### Task 1: [Name]
**Scenario**: "Imagine you want to [context]. Please show me how you would [goal]."

**Success criteria**:
- [ ] Completed without assistance
- [ ] Completed with hint
- [ ] Failed

**Observation points**:
- Entry point chosen
- Path taken
- Errors encountered
- Time to complete

### Task 2: [Name]
[Same structure]

## Post-Task Questions
- How easy or difficult was that? (1-5 scale)
- What, if anything, was confusing?
- What would you expect to happen next?

## Post-Test Questions
- Overall impressions?
- What would you change?
- How likely to use? (1-10)
```

### Severity Rating Scale

| Severity | Definition | Action |
|----------|------------|--------|
| **Critical** | Prevents task completion | Must fix before launch |
| **High** | Significant struggle, workarounds needed | Fix before launch |
| **Medium** | Causes confusion, delays task | Fix soon |
| **Low** | Minor inconvenience | Consider fixing |

---

## Survey Design Guidelines

### Question Types

| Type | When to Use | Example |
|------|-------------|---------|
| **Multiple choice** | Discrete options | "Which feature do you use most?" |
| **Likert scale** | Attitudes, satisfaction | "How satisfied are you? (1-5)" |
| **Ranking** | Priorities | "Rank these features by importance" |
| **Open-ended** | Exploration, quotes | "What would you change?" |
| **Matrix** | Multiple related items | "Rate each feature on ease of use" |

### Best Practices

1. **Start easy**: Begin with simple, non-threatening questions
2. **One concept per question**: Avoid double-barreled questions
3. **Neutral wording**: Avoid leading language
4. **Balanced scales**: Equal positive and negative options
5. **Logical flow**: Group related questions
6. **Keep it short**: <10 minutes completion time

### Question Quality Checklist

- [ ] Is this question necessary for our decision?
- [ ] Will respondents understand it the same way?
- [ ] Can respondents accurately answer it?
- [ ] Will respondents be willing to answer honestly?
- [ ] Is the question free of bias or leading language?

---

## Synthesis Framework

### Affinity Mapping Process

1. **Capture**: Write each observation/quote on a sticky note
2. **Cluster**: Group related notes together
3. **Name**: Label each cluster with a theme
4. **Hierarchy**: Organize themes into higher-level patterns
5. **Insights**: Extract insights from patterns

### Insight Format

```
OBSERVATION: [What we saw/heard - factual]
↓
INSIGHT: [What it means - interpretive]
↓
IMPLICATION: [What we should do - actionable]
```

Example:
```
OBSERVATION: 7/10 users tried to click the header logo expecting it to go home
INSIGHT: Users expect standard navigation patterns; deviation causes confusion
IMPLICATION: Make the logo clickable and link to homepage
```

### Confidence Levels

| Level | Criteria |
|-------|----------|
| **High** | Consistent across multiple users, multiple methods |
| **Medium** | Seen in majority of users, single method |
| **Low** | Observed in few users, needs validation |

---

## Research Artifacts

### Persona Template

```markdown
# Persona: [Name]

## Demographics
- Role/Title: [X]
- Experience: [X years]
- Context: [Environment]

## Goals
- Primary: [What they're trying to achieve]
- Secondary: [Other objectives]

## Pain Points
- [Frustration 1]
- [Frustration 2]

## Behaviors
- [How they currently solve the problem]
- [Tools/processes they use]

## Quotes
> "[Verbatim quote that captures their perspective]"

## Design Implications
- [What this means for our product]
```

### Journey Map Template

```markdown
# Journey Map: [User doing Task]

## Phases
| Phase | Doing | Thinking | Feeling | Pain Points | Opportunities |
|-------|-------|----------|---------|-------------|---------------|
| Awareness | [actions] | [thoughts] | [emotions] | [frictions] | [ideas] |
| Consideration | | | | | |
| Decision | | | | | |
| Use | | | | | |
| Retention | | | | | |
```

---

## Research Report Structure

```markdown
# Research Report: [Study Name]

## Executive Summary
- Research question
- Key findings (3-5 bullets)
- Recommendations

## Methodology
- Method used
- Participant criteria
- Sample size and composition
- Dates conducted

## Participants
| ID | Segment | Key Characteristics |
|----|---------|---------------------|
| P1 | [type] | [relevant traits] |

## Findings

### Finding 1: [Theme]
**Observation**: [What we found]
**Evidence**: [Supporting data, quotes]
**Implication**: [What this means]

### Finding 2: [Theme]
[Same structure]

## Recommendations
| Priority | Recommendation | Rationale |
|----------|----------------|-----------|
| High | [Action] | [Why] |
| Medium | [Action] | [Why] |

## Appendix
- Full interview guide
- Raw data/notes
- Additional quotes
```

---

## Ethical Guidelines

1. **Informed consent**: Explain purpose, get permission
2. **Privacy**: Protect participant identity
3. **No harm**: Don't cause distress or embarrassment
4. **Honesty**: Don't deceive about research purpose
5. **Voluntary**: Allow withdrawal at any time
6. **Fair compensation**: Respect participants' time

---

## Application

This skill is used by:
- `@user-researcher` for all research activities
- `@ux-product-strategist` for user understanding
- `@product-manager` for customer insights
- `@brand-strategist` for audience research

Reference this skill when:
- Planning user research studies
- Conducting interviews or usability tests
- Designing surveys
- Synthesizing research findings
- Creating research artifacts (personas, journey maps)

---

*Last updated: 2026-01-22*
