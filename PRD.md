# PRD: LEGO Agent OS to 100%

## Introduction

Complete the LEGO Agent OS by adding the Facilitator Layer (brand and ideation discovery agents), comprehensive documentation, and remaining gaps. This transforms the system into a complete agency operating system that can interview users through discovery, execute brand/content workflows, and be GUI-ready.

## Goals

- Add Facilitator Layer with Brand Facilitator and Ideation Facilitator agents
- Create comprehensive Getting Started and workflow documentation
- Add missing skills (brand-facilitation, product-ideation, customer-design, vibe-marketing)
- Create GUI folder structure (gitignored for private development)
- Generate agent and skills index documentation
- Update agent registry with all new components

## User Stories

### US-001: Create Brand Facilitation Skill
**Description:** As a brand facilitator agent, I need a skill file defining the interview methodology so I can guide founders through structured brand discovery.

**Acceptance Criteria:**
- [x] Create `.claude/skills/skill-brand-facilitation.md`
- [x] Include 6 discovery phases: Origin & Context, Positioning, Purpose (VPVMG), Customer Design, Onliness Statement, Brand Commitment Matrix
- [x] Include questions for each phase derived from research notes in `docs/research/Brand Faciliation Notes.docx.md`
- [x] Define output format (brand-discovery-brief.md)
- [x] Define handoff recommendations to @brand-strategist, @verbal-identity-designer

---

### US-002: Create Brand Facilitator Agent
**Description:** As a user, I want a brand facilitator agent that interviews me through brand discovery so I can articulate my brand foundations.

**Acceptance Criteria:**
- [x] Create `.claude/agents/brand-facilitator.md`
- [x] Include frontmatter with name, department (strategy), description, tools (Read, Write, Edit, Glob, Grep, AskUserQuestion)
- [x] Reference PRIMARY skill: skill-brand-facilitation.md
- [x] Define mission: interview and document, NOT execute
- [x] Include workflow: Opening, Phase-by-Phase Discovery, Synthesis, Handoff
- [x] Include quality checklist and collaboration section

---

### US-003: Create Brand Discovery Command
**Description:** As a user, I want a `/brand-discovery` command that initiates a brand discovery session with the facilitator.

**Acceptance Criteria:**
- [x] Create `.claude/commands/brand-discovery.md`
- [x] Define overview and when to use
- [x] Specify @brand-facilitator as primary agent
- [x] Define output location: `brand/brand-discovery-brief.md`
- [x] Include success criteria checklist
- [x] Define handoff to `/brand-strategy`, `/verbal-identity`

---

### US-004: Create Product Ideation Skill
**Description:** As an ideation facilitator agent, I need a skill file defining the product discovery methodology so I can help founders clarify their product before brand work.

**Acceptance Criteria:**
- [x] Create `.claude/skills/skill-product-ideation.md`
- [x] Include 5 discovery phases: Problem Space, Solution Exploration, Market Fit, Feasibility, Vision
- [x] Include questions for each phase
- [x] Define output format (product-ideation-brief.md)
- [x] Define handoff decision tree (brand-facilitator, research-analyst, product-manager)

---

### US-005: Create Ideation Facilitator Agent
**Description:** As a user, I want an ideation facilitator agent that helps me clarify my product idea before brand development.

**Acceptance Criteria:**
- [x] Create `.claude/agents/ideation-facilitator.md`
- [x] Include frontmatter with name, department (strategy), description, tools
- [x] Reference PRIMARY skill: skill-product-ideation.md
- [x] Define mission: product discovery BEFORE brand
- [x] Include workflow: Opening, Phase-by-Phase Discovery, Synthesis, Handoff
- [x] Include quality checklist

---

### US-006: Create Product Discovery Command
**Description:** As a user, I want a `/product-discovery` command that initiates a product ideation session.

**Acceptance Criteria:**
- [x] Create `.claude/commands/product-discovery.md`
- [x] Define overview and when to use
- [x] Specify @ideation-facilitator as primary agent
- [x] Define output location: `product/product-ideation-brief.md`
- [x] Include success criteria checklist
- [x] Define handoff options

---

### US-007: Create Customer Design Skill
**Description:** As brand agents, I need a customer design skill defining how to think about who customers BECOME, not just who they are.

**Acceptance Criteria:**
- [x] Create `.claude/skills/skill-customer-design.md`
- [x] Include Customer Design Framework (Identity, Transformation, Journey)
- [x] Include key questions for Current State and Transformed State
- [x] Include Brand Commitment Scale (Satisfaction -> Empowerment)
- [x] Include Brand Commitment Matrix integration
- [x] List which agents use this skill

---

### US-008: Update Agent Registry with Facilitators
**Description:** As the system, I need the agent registry updated with the new facilitator agents so they can be properly routed.

**Acceptance Criteria:**
- [x] Read current `.claude/agent-registry.json`
- [x] Add brand-facilitator entry with department, capabilities, skills, commands, escalates_to, when_to_use
- [x] Add ideation-facilitator entry with same structure
- [x] Add "discovery" and "facilitation" to task_routing section
- [x] Add new skills to skill_to_agents mapping
- [x] Ensure JSON is valid (no trailing commas, proper syntax)

---

### US-009: Create Getting Started Documentation
**Description:** As a new user, I want Getting Started documentation so I know which entry point to use based on what I have.

**Acceptance Criteria:**
- [ ] Create `docs/getting-started.md`
- [ ] Include "What Do You Have?" decision tree with 5 paths
- [ ] Include Discovery -> Execution flow diagram (ASCII art)
- [ ] Include Key Concepts section (Facilitators vs. Executors, Living Documents, Agent Handoffs)
- [ ] Include Quick Commands table
- [ ] Include Need Help? section with links

---

### US-010: Create Workflow Paths Documentation
**Description:** As a user, I want workflow paths documentation showing the decision tree for choosing the right workflow.

**Acceptance Criteria:**
- [ ] Create `docs/lego-os/workflow-paths.md`
- [ ] Include Path A: Product Discovery flow with ASCII diagram
- [ ] Include Path B: Brand Discovery flow with ASCII diagram
- [ ] Include Path C: Content Production flow
- [ ] Include Path D: Website/App flow
- [ ] Include Path E: Smart Contract flow
- [ ] Include Workflow Selection Matrix table

---

### US-011: Create Facilitator Layer Documentation
**Description:** As a user, I want documentation explaining how the facilitator layer works and how to extend it.

**Acceptance Criteria:**
- [ ] Create `docs/lego-os/facilitator-layer.md`
- [ ] Explain the problem facilitators solve vs traditional AI assistants
- [ ] Document @brand-facilitator with phases and output
- [ ] Document @ideation-facilitator with phases and output
- [ ] Include Facilitator vs. Executor comparison table
- [ ] Include design principles (Questions Over Assumptions, etc.)
- [ ] Include instructions for extending facilitators

---

### US-012: Create Brand Architecture Documentation
**Description:** As a user managing multiple brands, I want documentation explaining how LEGO OS supports brand architecture.

**Acceptance Criteria:**
- [ ] Create `docs/lego-os/brand-architecture.md`
- [ ] Explain Branded House with example (Google) and folder structure
- [ ] Explain House of Brands with example (P&G) and folder structure
- [ ] Explain Endorsed Brands with example (Marriott)
- [ ] Explain Hybrid with example (Virgin)
- [ ] Document agent behavior for portfolio analysis
- [ ] Include relevant commands table

---

### US-013: Update README with Getting Started
**Description:** As a user landing on the repo, I want a Quick Start section in the README pointing to Getting Started docs.

**Acceptance Criteria:**
- [ ] Read current `README.md`
- [ ] Add Quick Start section after the first heading
- [ ] Link to `docs/getting-started.md`
- [ ] List common starting points: /product-discovery, /brand-discovery, /ralph-plan
- [ ] Keep all existing README content intact

---

### US-014: Create Discovery Brief Templates
**Description:** As facilitator agents, I need output templates for discovery briefs so outputs are consistent.

**Acceptance Criteria:**
- [ ] Create `templates/brand-discovery-brief.template.md` with frontmatter, executive summary, discovery insights sections, onliness statement, brand commitment matrix, gaps, next steps
- [ ] Create `templates/product-ideation-brief.template.md` with frontmatter, problem space, solution hypothesis, market assessment, feasibility, vision, recommended path
- [ ] Use {{placeholder}} syntax for template variables
- [ ] Include "Generated by LEGO Agent OS" footer

---

### US-015: Create Vibe Marketing Skill
**Description:** As vibe marketer and content agents, I need a vibe marketing skill with rapid-execution methodology.

**Acceptance Criteria:**
- [ ] Create `.claude/skills/skill-vibe-marketing.md`
- [ ] Include core philosophy and 5 principles (Speed Over Perfection, Platform-Native, Trend Surfing, Authentic Voice, Signal Amplification)
- [ ] Include process: Signal Check, Trend Scan, Rapid Ideation, Vibe Filter, Ship & Learn
- [ ] Include platform guidelines for X, Instagram, TikTok, LinkedIn
- [ ] Include metrics that matter (signal metrics, vibe metrics)
- [ ] Include anti-patterns to avoid
- [ ] List which agents use this skill

---

### US-016: Create Website Workflow Command
**Description:** As a user building a website, I want a workflow command that orchestrates all agents from brand to deployed site.

**Acceptance Criteria:**
- [ ] Create `.claude/commands/workflow-website.md`
- [ ] Define prerequisites (brand strategy, verbal identity, visual identity)
- [ ] Define 8 workflow steps: Design Brief, UX Strategy, UX Copy, Design Review, Technical Architecture, Implementation, Security Review, Code Review
- [ ] Specify agent for each step
- [ ] Include success criteria checklist
- [ ] Include agents involved table

---

### US-017: Create GUI Folder Structure
**Description:** As a developer, I want gitignored GUI folders created for private development.

**Acceptance Criteria:**
- [ ] Create `gui/README.md` with purpose explanation
- [ ] Create `schemas/README.md` with purpose explanation
- [ ] Create `ui-components/README.md` with purpose explanation
- [ ] Each README states folder is gitignored and for private GUI development
- [ ] Verify these folders are already in .gitignore (gui/, schemas/, ui-components/)

---

### US-018: Create Agent Index Documentation
**Description:** As a user, I want a comprehensive index of all agents so I can quickly find the right one.

**Acceptance Criteria:**
- [ ] Create `docs/lego-os/agent-index.md`
- [ ] Read all agents from `.claude/agents/` folder
- [ ] Read agent-registry.json for additional metadata
- [ ] Include for each: name, department, primary skill, key commands, when to use
- [ ] Organize by department (strategy, content, engineering, etc.)

---

### US-019: Create Skills Index Documentation
**Description:** As a user, I want a comprehensive index of all skills so I understand available methodologies.

**Acceptance Criteria:**
- [ ] Create `docs/lego-os/skills-index.md`
- [ ] Read all skills from `.claude/skills/` folder
- [ ] Include for each: name, purpose, which agents use it, key frameworks
- [ ] Organize by category (brand, content, development, etc.)

---

### US-020: Update CLAUDE.base.md with New Workflows
**Description:** As the system, I need CLAUDE.base.md updated to reference new facilitator workflows and documentation.

**Acceptance Criteria:**
- [ ] Read current `CLAUDE.base.md`
- [ ] Add Facilitator Layer section explaining brand-facilitator and ideation-facilitator
- [ ] Reference `/brand-discovery` and `/product-discovery` commands
- [ ] Add link to Getting Started documentation
- [ ] Keep all existing content intact

---

### US-021: Final Verification
**Description:** As a developer, I want all cross-references verified and the sprint marked complete.

**Acceptance Criteria:**
- [ ] Verify all 17 new files created exist
- [ ] Verify agent-registry.json is valid JSON (no syntax errors)
- [ ] Verify all skill references in new agents point to existing skill files
- [ ] Verify all command references are valid
- [ ] List any issues found for manual review

---

## Non-Goals

- No GUI implementation (just folder placeholders)
- No MCP server development
- No Ralph loop script changes (scripts already exist at scripts/ralph/)
- No VibeBranding repo changes (separate repo)
- No actual Claude CLI integration testing
- No database or backend code

## Technical Considerations

- All files are markdown or JSON (no code compilation needed)
- Agent registry is JSON - must maintain valid syntax with no trailing commas
- Templates use {{placeholder}} Handlebars-style syntax for variables
- GUI folders are gitignored - only README placeholders are tracked in git
- Research notes in `/docs/research/` should inform facilitator skill content
- Existing agent and skill patterns should be followed for consistency
