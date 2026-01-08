# brand-narrative

You are running the **Brand Narrative** workflow in LEGO Agent OS.

Goal:
Construct the foundational story architecture that transforms brand strategy into an uncopyable narrative moat. This workflow produces an origin story, brand mythology, narrative moat documentation, and story principles.

Primary Agent:
- @brand-strategist

Supporting Agents:
- @archetype-analyst (for archetype integration)
- @copywriter (for narrative refinement)

Skills:
- Brand Narrative (`.claude/skills/skill-brand-narrative.md`)
- Brand Archetypes
- ZAG Positioning
- Brand Flip (I AM + POV)

Standards:
- `standards/signalos/brand-strategy.md`
- `standards/signalos/cultural-brands.md`
- `standards/signalos/tribe-building.md`

---

## Prerequisites

Before running this command, ensure:

1. **Brand strategy exists** — Run `/brand-strategy` first (at minimum Core level)
2. **Archetype is defined** — Either from `/brand-strategy` or `/archetype-analysis`
3. **Positioning is clear** — Onliness statement and cultural tension identified

If these don't exist, the workflow will prompt for discovery questions.

---

## Steps

### 1. Check Prerequisites

Verify availability of:
- Founder discovery / SYNC phase output
- Archetype profile (primary + secondary)
- Positioning (onliness, cultural tension)
- Tribe definition (I AM + POV)

If missing:
- Offer to run abbreviated discovery
- Or recommend running `/brand-strategy` first

---

### 2. Extract Origin Story

**Goal:** Craft the founding myth

#### 2a. Discovery Questions

If origin story is unclear, ask:

**Inciting Incident**
- "What made you angry or frustrated enough to start this?"
- "What did you see that others didn't?"
- "What injustice or gap drove you to act?"

**Core Struggle**
- "What obstacles did you face building this?"
- "What did people tell you wouldn't work?"
- "What did you sacrifice to make this real?"

**Breakthrough Moment**
- "When did you know this was going to work?"
- "What was the turning point?"
- "What moment proved you were right?"

**Founding Belief**
- "What conviction drove you through the hard times?"
- "What do you believe that others don't?"
- "What truth does this brand exist to prove?"

#### 2b. Craft Origin Narrative

Using discovery, construct:

1. **Full origin story** (3-5 paragraphs)
   - Sets the scene (before)
   - Introduces the inciting incident
   - Describes the struggle
   - Celebrates the breakthrough
   - States the founding belief

2. **Short form** (1-2 paragraphs)
   - For about pages, bios

3. **One-liner**
   - For social bios, pitches

---

### 3. Build Brand Mythology

**Goal:** Create the story universe

#### 3a. Determine Hero Model

Review archetype and tribe to decide:

| Model | Best For | Signal |
|-------|----------|--------|
| **Brand as Hero** | Hero, Outlaw, Magician archetypes | Brand overcomes obstacles for tribe |
| **Customer as Hero** | Sage, Caregiver, Guide archetypes | Brand helps customer transform |
| **Shared Journey** | Explorer, Creator archetypes | Brand and customer transform together |

Ask if unclear:
- "In your best customer stories, who is the hero?"
- "Does your brand triumph, or do your customers triumph?"

#### 3b. Define the Enemy

**Not a competitor — an antagonist force.**

Review cultural tension from positioning.
Articulate the enemy as:
- A worldview
- A system
- A behavior
- A status quo

Ask:
- "What does this brand fight against?"
- "What would the world look like if your enemy won?"
- "What makes your tribe angry?"

Validate:
- [ ] Enemy is a force, not a company
- [ ] Tribe shares this enemy
- [ ] Fighting this enemy is ongoing

#### 3c. Articulate the Quest

Frame the brand's ongoing mission:
- Big enough to never fully "win"
- Specific enough to guide action
- Aligned with the enemy (defeating it)

Ask:
- "If you succeeded completely, what would be true?"
- "Why can't this mission ever be fully achieved?"
- "What would you still be doing in 50 years?"

#### 3d. Identify Recurring Symbols

**Visual Symbols:**
- Colors with meaning
- Shapes that recur
- Imagery patterns

**Verbal Symbols:**
- Named concepts (like SignalOS™)
- Recurring metaphors
- Brand-specific language

**Rituals:**
- Repeated behaviors
- Ceremonies or traditions
- Tribal signals

Ask:
- "What visual elements appear everywhere in your brand?"
- "What phrases do your team or customers repeat?"
- "What do you do ritually that reinforces who you are?"

---

### 4. Document Narrative Moat

**Goal:** Identify defensible story elements

#### 4a. Authenticity Moat

What's genuinely yours?

- Real history
- Genuine founder journey
- Earned credibility

Ask:
- "What have you done that proves your beliefs?"
- "What story can only you tell?"
- "What would a competitor have to fake?"

#### 4b. Time Moat

Historical elements that compound:

- Founding moments
- Key decisions
- Legacy events

Ask:
- "What moments defined who you are?"
- "What decisions do you point to as proof of values?"
- "What's your timeline of belief-in-action?"

#### 4c. Belief Moat

Convictions that create loyalty:

- Non-negotiables
- Polarizing stances
- Lines you won't cross

Ask:
- "What will you never compromise on?"
- "What belief costs you customers — and you accept that?"
- "What makes some people hate you — and you're okay with that?"

#### 4d. Culture Moat

Living mythology:

- Internal stories
- Tribal knowledge
- "How things work here"

Ask:
- "What stories do employees tell new hires?"
- "What do people learn in their first month that isn't written anywhere?"
- "What makes someone 'get' your culture?"

---

### 5. Define Story Principles

**Goal:** Create storytelling guidelines

#### 5a. Narrative Voice

Based on archetype and positioning:

- **Perspective:** First person (we), second person (you), third person (they)?
- **Temporality:** Past-focused, present-focused, future-focused?
- **Emotional register:** Triumphant? Rebellious? Nurturing? Wise? Playful?

#### 5b. Story Types

What kinds of stories does this brand tell?

| Type | Description | Example Usage |
|------|-------------|---------------|
| Origin | How things began | About page, founder content |
| Transformation | How people changed | Case studies, testimonials |
| Challenge | Obstacles overcome | Campaign narratives |
| Vision | What the future looks like | Thought leadership |
| Proof | Evidence of beliefs | PR, social proof |

Prioritize based on brand and tribe.

#### 5c. Story Boundaries

What stories does this brand NOT tell?

Based on archetype shadow and positioning:
- Themes that contradict archetype
- Tones that undermine mythology
- Narratives that weaken moat

---

### 6. Produce Deliverables

#### Brand Narrative Document

Full document including:
- Executive summary
- Origin story (full, short, one-line)
- Brand mythology (hero, enemy, quest, symbols)
- Narrative moat (authenticity, time, belief, culture)
- Story principles (voice, types, boundaries)
- Application guidance

#### Narrative Playbook (Optional)

Tactical guide for content and marketing teams:
- How to reference origin story
- When to invoke mythology
- Story templates by type
- Voice and tone quick reference

---

## Output Format

### Brand Narrative Document

```markdown
# [Brand Name] Brand Narrative

## Executive Summary
[2-3 sentences capturing the narrative essence]

---

## Origin Story

### The Founding Myth
[Full origin narrative]

### Short Form
[1-2 paragraph version]

### One-Liner
[Single sentence]

---

## Brand Mythology

### The Hero
**Model:** [Brand as Hero / Customer as Hero / Shared Journey]
[Explanation]

### The Enemy
**Antagonist Force:** [What we fight]
[Why it matters]

### The Quest
**Ongoing Mission:** [The unfinished journey]
[Why it can't be won]

### Recurring Symbols
[Visual, verbal, ritualistic symbols]

---

## Narrative Moat

### Authenticity Moat
[What's genuinely ours]

### Time Moat
[Historical elements]

### Belief Moat
[Non-negotiables]

### Culture Moat
[Living mythology]

---

## Story Principles

### Narrative Voice
[Perspective, temporality, register]

### Story Types We Tell
[Prioritized list with usage]

### Story Boundaries
[What we don't say]

---

## Application
[Guidance for content, marketing, brand teams]
```

---

## Quality Checklist

Before finalizing:

**Origin Story**
- [ ] Rooted in founder truth (not fabricated)
- [ ] Clear inciting incident
- [ ] Genuine struggle documented
- [ ] Breakthrough is specific
- [ ] Founding belief is conviction, not platitude

**Mythology**
- [ ] Hero model matches archetype
- [ ] Enemy is force, not competitor
- [ ] Quest is ongoing, not completable
- [ ] Symbols are distinctive
- [ ] At least one ritual identified

**Narrative Moat**
- [ ] Authenticity elements are provable
- [ ] Time elements are real history
- [ ] Belief elements are genuinely held
- [ ] Culture elements reflect reality

**Story Principles**
- [ ] Voice matches archetype
- [ ] Story types are actionable
- [ ] Boundaries are specific
- [ ] Guidelines can be applied by any creator

---

## Handoff Guidance

After completing brand narrative:

**To Content Team:**
- Origin story for about pages
- Mythology for content pillar development
- Story types for editorial calendar
- Voice for content creation

**To Marketing Team:**
- Hero model for campaign structure
- Enemy for tension-driven messaging
- Quest for long-term narrative arc
- Moat elements for proof points

**To Copywriter:**
- Full narrative document
- Story principles
- Verbal symbols
- Boundaries

**To Brand Team:**
- Visual symbols for design direction
- Rituals for brand experience
- Moat documentation for positioning defense

---

## Anti-Patterns

- Starting narrative without brand strategy done first
- Fabricating origin story elements that aren't real
- Making the enemy a competitor instead of a force
- Creating a quest that can be "completed"
- Defining voice without boundaries
- Over-engineering symbols that don't connect to reality
