# workflow-brand-launch

Complete brand system from strategy to content-ready assets.

---

## Overview

This workflow orchestrates the complete brand development lifecycle, from strategic foundation through identity systems to launch-ready content.

## When to Use

- New brand creation
- Brand refresh or rebrand
- Brand extension to new markets
- Startup brand development
- Product brand within a portfolio

## Agents Involved

| Role | Agent | Responsibility |
|------|-------|----------------|
| **Strategy** | `@brand-strategist` | Brand strategy, positioning, cultural tension |
| **Archetype** | `@archetype-analyst` | Jungian archetype mapping |
| **Identity** | `@brand-identity-architect` | Naming, brand architecture |
| **Visual** | `@visual-designer` | Visual identity system |
| **Verbal** | `@verbal-identity-designer` | Voice, tone, language stack |
| **Content** | `@content-strategist` | Content pillars, editorial calendar |
| **Marketing** | `@marketing-strategist` | Launch campaign, GTM |

## Workflow Steps

### Step 1: Brand Strategy
**Command:** `/brand-strategy`

Establish the strategic foundation:
- Founder/stakeholder discovery
- Cultural tension identification
- Brand positioning
- Core narrative

**Agents:**
- `@brand-strategist`

**Output:**
```
docs/brand/
  brand-strategy.md
```

Contains:
- Founder scroll
- Cultural tension map
- Positioning statement
- Brand promise

### Step 2: Archetype Analysis
**Command:** `/archetype-analysis`

Map the brand to archetypal patterns:
- Primary archetype identification
- Secondary archetype influences
- Archetype expression guidelines

**Agents:**
- `@archetype-analyst`

**Output:**
```
docs/brand/
  archetype-analysis.md
```

### Step 3: Brand Positioning
**Command:** `/brand-positioning`

Sharpen the competitive positioning:
- Onliness statement
- Competitive landscape
- Target tribe profile

**Agents:**
- `@brand-strategist`

**Output:**
```
docs/brand/
  brand-positioning.md
  onliness-statement.md
```

### Step 4: Verbal Identity
**Command:** `/verbal-identity`

Design the language system:
- Brand voice
- Tone matrix
- Vocabulary/lexicon
- Transmission lines

**Agents:**
- `@verbal-identity-designer`

**Output:**
```
docs/brand/
  verbal-identity.md
```

### Step 5: Visual Identity
**Command:** `/visual-identity`

Create visual direction:
- Visual territory
- Color direction
- Typography direction
- Imagery style
- Design principles

**Agents:**
- `@brand-identity-architect`
- `@visual-designer`

**Output:**
```
docs/brand/
  visual-identity.md
```

### Step 6: Content Strategy
**Command:** `/content-strategy`

Build the content foundation:
- Content pillars
- Editorial themes
- Content types
- Channel strategy

**Agents:**
- `@content-strategist`

**Output:**
```
docs/brand/
  content-strategy.md
```

### Step 7: Launch Campaign
**Command:** `/campaign-plan`

Plan the brand launch:
- Launch narrative
- Campaign architecture
- Channel execution
- Timeline

**Agents:**
- `@marketing-strategist`

**Output:**
```
docs/brand/
  launch-campaign.md
```

---

## Quick Start

```
/workflow-brand-launch "fintech app for Gen Z"
```

This will execute all 7 steps in sequence, producing a complete brand system.

---

## Success Criteria

- [ ] Brand strategy is rooted in founder truth
- [ ] Clear cultural tension identified
- [ ] Onliness statement is defensible
- [ ] Archetype is clear and consistent
- [ ] Verbal identity is generative (infinite content possible)
- [ ] Visual direction is distinctive
- [ ] Content pillars support the strategy
- [ ] Launch campaign is executable

---

## Escalation

If blocked during any step:
- Strategic questions: `@brand-strategist` is top of chain
- Business alignment: Escalate to `@business-strategist`
- Market questions: Escalate to `@research-analyst`

---

## Handoff Structure

```
brand-strategist
    |
    +---> archetype-analyst (returns findings)
    |
    +---> brand-identity-architect ---> visual-designer
    |
    +---> verbal-identity-designer ---> copywriter
    |
    +---> content-strategist
    |
    +---> marketing-strategist (launch)
```

---

## Ralph Wiggum Integration

For autonomous execution of this workflow:

1. **Generate PRD**: Run `/ralph-plan` with the brand description to create PRD.md and progress.txt
2. **Run Script**: Execute in terminal:
   ```powershell
   ./scripts/ralph/ralph.ps1 -MaxIterations 100
   ```
3. **Review**: When complete, review all brand assets with stakeholders

The canonical Ralph workflow spawns fresh context per iteration, preventing context rot on large brand projects.

---

## Dependencies

| This Command | Requires | Followed By |
|--------------|----------|-------------|
| `/brand-strategy` | Nothing | All others |
| `/archetype-analysis` | Brand strategy | Positioning, identity |
| `/brand-positioning` | Brand strategy | Identity, content |
| `/verbal-identity` | Brand strategy | Content |
| `/visual-identity` | Brand strategy | Content, campaign |
| `/content-strategy` | Verbal identity | Campaign |
| `/campaign-plan` | All identity work | Launch execution |

---

## Output Structure

After completion, you'll have:

```
docs/brand/
  brand-strategy.md         # Strategic foundation
  archetype-analysis.md     # Archetype mapping
  brand-positioning.md      # Competitive positioning
  onliness-statement.md     # "Only" declaration
  verbal-identity.md        # Voice, tone, language
  visual-identity.md        # Visual direction
  content-strategy.md       # Content pillars
  launch-campaign.md        # Launch plan
```

---

## Example Session

```
User: /workflow-brand-launch "sustainable fashion marketplace"

Step 1: Running /brand-strategy...
- Discovery: Founder driven by fast fashion waste
- Tension: "Throwaway culture vs. Conscious consumption"
- Position: "The only marketplace where style meets sustainability"

Step 2: Running /archetype-analysis...
- Primary: Creator (making fashion sustainable)
- Secondary: Caregiver (caring for planet)

Step 3: Running /brand-positioning...
- Onliness: "The only fashion marketplace that guarantees..."
- Tribe: Conscious millennials who won't sacrifice style

Step 4: Running /verbal-identity...
- Voice: Optimistic, informed, never preachy
- Tone Matrix: Inspiring / Educational / Empowering

Step 5: Running /visual-identity...
- Territory: Natural meets modern
- Palette: Earth tones with bold accents

Step 6: Running /content-strategy...
- Pillars: Sustainable style, Brand stories, Impact tracking

Step 7: Running /campaign-plan...
- Launch narrative: "Fashion that doesn't cost the earth"
- Campaign: 3-phase launch over 6 weeks

BRAND_LAUNCH_READY
```
