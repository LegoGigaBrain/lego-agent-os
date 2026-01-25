# Facilitator Layer

The Facilitator Layer is a discovery-first architecture that transforms LEGO Agent OS from a command-execution system into an intelligent operating system that can interview, understand, and guide users before executing work.

---

## The Problem Facilitators Solve

### Traditional AI Assistants

Traditional AI assistants execute immediately:

```
User: "Create a brand for my startup"
AI: "Here's your brand name, tagline, and logo concept..."
```

This approach has fundamental problems:
- **Assumptions replace understanding** — The AI guesses what you need
- **Generic outputs** — Without discovery, results are templated
- **Misaligned execution** — Work is done, but it's the wrong work
- **Wasted effort** — Redoing work is expensive

### The Facilitator Approach

Facilitators discover first, execute later:

```
User: "Create a brand for my startup"
Facilitator: "Let's start with discovery. What led you to start this company?"
[... 6 phases of structured discovery ...]
Facilitator: "Here's your Brand Discovery Brief. I recommend @brand-strategist next."
```

This approach delivers:
- **Deep understanding** — Founders articulate what already exists within them
- **Authentic foundations** — Discovery captures real voice, real values
- **Informed handoffs** — Executors receive context, not assumptions
- **Reduced rework** — Right work done right the first time

---

## Available Facilitators

### @brand-facilitator

**Purpose:** Guide founders through brand discovery to uncover brand foundations before strategy execution.

**Command:** `/brand-discovery`

**6 Discovery Phases:**

| Phase | Focus | Key Questions |
|-------|-------|---------------|
| 1. Origin & Context | Founding story | What led you here? Why this problem? |
| 2. Positioning | Market placement | Who do you serve? What category? How different? |
| 3. Purpose (VPVMG) | Core meaning | Values? Purpose? Vision? Mission? Goals? |
| 4. Customer Design | Transformation | Who becomes what through you? |
| 5. Onliness Statement | Uniqueness | What are you the ONLY one of? |
| 6. Brand Commitment Matrix | Alignment | I AM + POV alignment? |

**Output:** `brand/brand-discovery-brief.md`

**Handoffs:**
- Complete → @brand-strategist, @verbal-identity-designer, @visual-designer
- Product unclear → @ideation-facilitator
- Customer unclear → @user-researcher
- Market unclear → @research-analyst

---

### @ideation-facilitator

**Purpose:** Help founders clarify product concepts before brand development.

**Command:** `/product-discovery`

**5 Discovery Phases:**

| Phase | Focus | Key Questions |
|-------|-------|---------------|
| 1. Problem Space | The pain | What problem? Who has it? How severe? |
| 2. Solution Exploration | The approach | What solution? How different? What's the MVP? |
| 3. Market Fit | The opportunity | Market size? Competition? Timing? |
| 4. Feasibility | The risks | Technical requirements? Assumptions? What could fail? |
| 5. Vision | The ambition | Long-term vision? Why you? How big? |

**Output:** `product/product-ideation-brief.md`

**Handoffs:**
- Product clarity achieved → @brand-facilitator
- Problem needs validation → @user-researcher
- Market unclear → @research-analyst
- Technical questions → @senior-architect
- Business model unclear → @business-strategist
- Ready to build → @product-manager

---

## Facilitator vs. Executor

| Aspect | Facilitators | Executors |
|--------|--------------|-----------|
| **Primary Action** | Ask questions | Produce outputs |
| **Output Type** | Discovery briefs | Strategy, design, code, content |
| **Decision Making** | Surface options | Make choices |
| **User Interaction** | High (interview) | Low (work on brief) |
| **Dependencies** | None (entry point) | Requires discovery or brief |
| **Tools Used** | AskUserQuestion | Write, Edit, Bash, etc. |
| **Examples** | @brand-facilitator, @ideation-facilitator | @brand-strategist, @verbal-identity-designer |

### Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                        FACILITATOR LAYER                            │
│                                                                     │
│   User with idea/question                                           │
│          │                                                          │
│          ▼                                                          │
│   ┌──────────────────┐     ┌──────────────────┐                    │
│   │ @ideation-       │────▶│ @brand-          │                    │
│   │ facilitator      │     │ facilitator      │                    │
│   └────────┬─────────┘     └────────┬─────────┘                    │
│            │                        │                               │
│            ▼                        ▼                               │
│   product-ideation-brief    brand-discovery-brief                  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         EXECUTOR LAYER                              │
│                                                                     │
│   ┌────────────────┐  ┌────────────────┐  ┌────────────────┐       │
│   │ @brand-        │  │ @verbal-       │  │ @visual-       │       │
│   │ strategist     │  │ identity       │  │ designer       │       │
│   └────────────────┘  └────────────────┘  └────────────────┘       │
│   ┌────────────────┐  ┌────────────────┐  ┌────────────────┐       │
│   │ @content-      │  │ @copywriter    │  │ @marketing-    │       │
│   │ strategist     │  │                │  │ strategist     │       │
│   └────────────────┘  └────────────────┘  └────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Design Principles

The Facilitator Layer is built on these core principles:

### 1. Questions Over Assumptions

Facilitators ask rather than assume. When information is missing, they probe deeper instead of filling gaps with generic content.

**Anti-pattern:** "I'll assume your target audience is millennials..."
**Facilitator pattern:** "Tell me about the people who need this most. Who are they?"

### 2. Capture Over Create

Facilitators document what founders say in their own words. Authentic voice emerges from discovery, not from AI generation.

**Anti-pattern:** "Your brand voice should be innovative and disruptive..."
**Facilitator pattern:** "I noticed you said 'we want to be the trusted friend.' Let's explore that."

### 3. Gaps Are Discoveries

When founders can't answer a question, that's valuable information. Gaps are documented honestly, not papered over.

**Anti-pattern:** "Since you're not sure about competitors, I'll research some..."
**Facilitator pattern:** "You mentioned uncertainty about competitors. I'll note that as a gap for @research-analyst."

### 4. Depth Over Breadth

Better to deeply understand one phase than superficially cover all of them. Facilitators probe until they understand.

**Anti-pattern:** "Let's move quickly through positioning to get to the fun stuff..."
**Facilitator pattern:** "You mentioned serving 'everyone.' Let's stay here. Who specifically experiences this problem most acutely?"

### 5. Handoff Clarity

Every discovery session ends with a clear handoff recommendation based on what was discovered, not what was hoped for.

**Anti-pattern:** "Now you're ready for full brand development!"
**Facilitator pattern:** "Based on our discovery, product clarity is still needed. I recommend @ideation-facilitator before brand work."

---

## When to Use Facilitators

### Use @ideation-facilitator When:

- You have an idea but haven't validated the problem
- You're not sure who your customer is
- You're struggling to explain what you're building
- You want to stress-test your concept before investing
- You need clarity before brand development

### Use @brand-facilitator When:

- You know your product/service but need brand foundations
- You're about to invest in brand design or marketing
- You want to articulate your values, purpose, and vision
- You need to define what makes you unique
- You want strategy aligned with who you really are

### Skip Facilitators When:

- You already have a comprehensive brand brief
- You're iterating on an existing brand, not creating new
- You need quick tactical work, not foundational discovery
- You've already been through structured discovery elsewhere

---

## Extending the Facilitator Layer

To add a new facilitator:

### 1. Create the Skill File

Location: `.claude/skills/skill-[domain]-facilitation.md`

Include:
- Discovery phases with structured questions
- Output format definition
- Handoff decision tree
- Session best practices

### 2. Create the Agent File

Location: `.claude/agents/[domain]-facilitator.md`

Include:
- Frontmatter with tools (must include `AskUserQuestion`)
- Reference to the skill file
- Clear "What You Do NOT Do" section
- Handoff recommendations

### 3. Create the Command File

Location: `.claude/commands/[domain]-discovery.md`

Include:
- Primary agent reference
- Output location
- Success criteria
- Handoff options

### 4. Update the Registry

Location: `.claude/agent-registry.json`

Add:
- Agent entry with capabilities and skills
- Task routing for "discovery" and "facilitation"
- Command mapping

---

## Best Practices for Facilitator Sessions

### For Users

1. **Set aside time** — Discovery sessions work best with focused attention
2. **Be honest** — Facilitators work with what you tell them
3. **Embrace uncertainty** — Saying "I don't know" is valuable
4. **Capture your language** — The facilitator wants YOUR words, not polished answers
5. **Trust the process** — The phases build on each other

### For Facilitators (Agent Behavior)

1. **Read the skill first** — Every facilitator session starts with skill file review
2. **Explain the process** — Users should know what to expect
3. **One phase at a time** — Don't rush through discovery
4. **Probe vague answers** — "Everyone" is not a customer segment
5. **Document gaps** — Don't fill them with assumptions
6. **Recommend honestly** — If they're not ready for the next step, say so

---

## Related Documentation

- [Getting Started](../getting-started.md) — Choose your entry point
- [Workflow Paths](./workflow-paths.md) — Complete workflow options
- [Agents Overview](./agents.md) — All available agents
- [Commands Overview](./commands.md) — All available commands
