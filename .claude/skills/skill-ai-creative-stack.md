# Skill: AI Creative Stack

## Purpose

Orchestrate end-to-end AI-powered creative production — from strategic brief through image generation to video creation. This skill defines the workflow for producing visual and video content using the full creative MCP stack.

---

## Core Philosophy

**Strategy → Image → Video → Polish**

Great creative work starts with clear direction. This stack takes a strategic brief through multiple stages of AI-assisted production, with human approval gates at key decision points.

---

## The Creative Stack Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          AI CREATIVE STACK                                  │
│                                                                             │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │  ai-creative-strategist                                          │     │
│    │  Research → Preview (2-3 options) → Feedback → Final Brief       │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│              ┌─────────────────────┼─────────────────────┐                 │
│              ▼                     ▼                     ▼                 │
│    ┌──────────────┐      ┌──────────────┐      ┌──────────────┐           │
│    │ ai-product   │      │ ai-social    │      │ ai-image     │           │
│    │ -photo       │      │ -graphics    │      │ -gen         │           │
│    │              │      │              │      │              │           │
│    │ Product      │      │ Social       │      │ General      │           │
│    │ shots        │      │ graphics     │      │ imagery      │           │
│    └──────────────┘      └──────────────┘      └──────────────┘           │
│              │                     │                     │                 │
│              └─────────────────────┼─────────────────────┘                 │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                    IMAGE ENHANCEMENT                             │     │
│    │                    (Glif / Replicate)                            │     │
│    │                    ~3 min processing                             │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│                            approved image                                   │
│                                    │                                        │
│              ┌─────────────────────┼─────────────────────┐                 │
│              ▼                     ▼                     ▼                 │
│    ┌──────────────┐      ┌──────────────┐      ┌──────────────┐           │
│    │  VIDEO GEN   │      │  VIDEO GEN   │      │  VIDEO GEN   │           │
│    │  Option A    │      │  Option B    │      │  Option C    │           │
│    │              │      │              │      │              │           │
│    │  (varies by  │      │  (varies by  │      │  (varies by  │           │
│    │   model)     │      │   model)     │      │   model)     │           │
│    └──────────────┘      └──────────────┘      └──────────────┘           │
│              │                     │                     │                 │
│              └─────────────────────┼─────────────────────┘                 │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                    USER PICKS BEST                               │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                        │
│                                    ▼                                        │
│    ┌─────────────────────────────────────────────────────────────────┐     │
│    │                    POST-PRODUCTION                               │     │
│    │                    (Lip-sync, audio, etc.)                       │     │
│    │                    Optional                                      │     │
│    └─────────────────────────────────────────────────────────────────┘     │
│                                                                             │
│    MCPs: Replicate (image) · Glif (workflows) · Perplexity (research)      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Workflow Stages

### Stage 1: Strategic Brief

**Agent:** ai-creative-strategist (or brand-strategist, visual-designer)

**Purpose:** Define what we're creating and why

**Process:**
1. **Research** — Understand context, audience, platform
2. **Reference** — Gather visual inspiration
3. **Direction** — Define style, mood, composition
4. **Brief** — Document clear creative direction

**Output: Creative Brief**
```
## Creative Brief: [Project Name]

### Objective
[What this creative needs to achieve]

### Audience
[Who will see this, where]

### Platform & Format
- Platform: [Instagram/Twitter/Website/etc.]
- Format: [Post/Story/Ad/Hero/etc.]
- Aspect Ratio: [1:1/16:9/9:16]
- Duration: [if video]

### Creative Direction

**Style:** [photorealistic/illustration/3D/etc.]
**Mood:** [energetic/calm/professional/playful]
**Color Palette:** [specific colors or references]
**References:** [inspiration images/links]

### Key Message
[What the visual should communicate]

### Must Include
- [Element 1]
- [Element 2]

### Must Avoid
- [Anti-pattern 1]
- [Anti-pattern 2]

### Success Criteria
[How we know this worked]
```

---

### Stage 2: Image Generation

**Tools:** Replicate MCP, Glif MCP

**Purpose:** Generate base imagery options

**Process:**
1. **Translate brief to prompts** — Convert direction to executable prompts
2. **Generate options** — Create 3-4 variations
3. **Review & select** — Choose best option for next stage
4. **Enhance if needed** — Upscale, adjust, refine

**Image Generation Types:**

| Type | Best Tool | Use Case |
|------|-----------|----------|
| Product Photo | Replicate (Flux) | Product shots, mockups |
| Social Graphics | Glif workflow | Branded graphics |
| Abstract/Artistic | Replicate (SDXL) | Backgrounds, textures |
| Style Transfer | Glif workflow | Apply brand style |
| Enhancement | Glif/Replicate | Upscale, cleanup |

**Output: Approved Image(s)**
- High-resolution base image
- Variations if needed
- Source prompts documented

---

### Stage 3: Video Generation (Optional)

**Tools:** External video APIs (not yet in MCP)

**Purpose:** Animate approved images into video

**Current Options:**
- SORA (OpenAI) — ~80s generation
- VEO (Google) — ~130s generation
- KLING (Kuaishou) — ~155s generation
- Runway Gen-3 — Available via API
- Pika Labs — Available via API

**Process:**
1. **Select video model** — Based on style needs
2. **Generate multiple versions** — Run same image through 2-3 models
3. **Compare outputs** — Evaluate motion quality, consistency
4. **Select best** — Choose for final delivery or post-production

**Video Generation Brief:**
```
## Video Brief

### Source Image
[URL or reference to approved image]

### Motion Direction
- Camera: [static/pan/zoom/orbit]
- Subject: [movement description]
- Speed: [slow/medium/fast]
- Duration: [3s/5s/10s]

### Style Notes
[Any specific animation style preferences]

### Models to Try
- [ ] Option A
- [ ] Option B
- [ ] Option C
```

---

### Stage 4: Post-Production (Optional)

**Purpose:** Add finishing touches

**Options:**
- **Lip-sync** — Add speech to talking head videos
- **Audio** — Add music, sound effects
- **Text/Graphics** — Overlay text, logos
- **Editing** — Cut, trim, transition

**Tools:**
- KLING Lip-Sync — For speech synchronization
- Existing video editing tools
- Audio generation tools

---

## Creative Type Workflows

### Product Shot Workflow

```
1. BRIEF
   - Product: [what]
   - Context: [where/how shown]
   - Style: [aesthetic]

2. GENERATE (Replicate)
   prompt: "[Product] on [surface], [lighting], product photography,
            [style], [background], high resolution"
   variations: 4
   aspect_ratio: 1:1

3. ENHANCE (Glif)
   - Background cleanup
   - Color correction
   - Final upscale

4. DELIVER
   - Multiple angles if needed
   - Format for platform
```

### Social Graphic Workflow

```
1. BRIEF
   - Message: [key point]
   - Platform: [where]
   - Style: [brand aligned]

2. GENERATE (Glif)
   - Search: "branded social graphic"
   - Select workflow
   - Input brand parameters

3. REVIEW
   - Brand consistency check
   - Message clarity
   - Platform fit

4. DELIVER
   - Platform-optimized formats
   - With and without text
```

### Hero Video Workflow

```
1. BRIEF
   - Purpose: [homepage/ad/social]
   - Duration: [seconds]
   - Mood: [feeling]

2. GENERATE IMAGE (Replicate)
   - Create base hero image
   - Wide aspect ratio
   - High detail

3. GENERATE VIDEO (External)
   - Submit to multiple models
   - Compare outputs
   - Select best motion

4. POST-PRODUCTION
   - Add audio if needed
   - Overlay text/logo
   - Format for delivery
```

---

## Approval Gates

### Gate 1: Brief Approval
**Before any generation:**
- Is the brief complete?
- Is direction clear?
- Are success criteria defined?

### Gate 2: Image Approval
**Before video generation:**
- Does image match brief?
- Is quality sufficient?
- Is brand consistent?

### Gate 3: Final Approval
**Before delivery:**
- Does output meet objectives?
- Is it platform-ready?
- Are all formats prepared?

---

## Output Formats

### Creative Production Report

```
## Creative Production: [Project]

### Brief Summary
[1-2 sentences on what was created]

### Stage 1: Strategy
- Brief: [link to brief]
- Direction: [summary]

### Stage 2: Image Generation
- Tool: [Replicate/Glif]
- Prompt: [full prompt]
- Options generated: [count]
- Selected: [which and why]
- Final image: [URL]

### Stage 3: Video (if applicable)
- Models used: [list]
- Best output: [which model]
- Final video: [URL]

### Stage 4: Post-Production (if applicable)
- Enhancements: [what was added]
- Final deliverable: [URL]

### Delivery
- Formats: [list all formats]
- Platforms: [where to use]
- Files: [links to all files]
```

---

## Quality Checklist

### Brief Quality
- [ ] Objective is clear
- [ ] Audience is defined
- [ ] Platform/format specified
- [ ] Style direction given
- [ ] References included
- [ ] Success criteria set

### Image Quality
- [ ] Matches brief direction
- [ ] Brand consistent
- [ ] Technical quality (resolution, no artifacts)
- [ ] Composition is effective
- [ ] Multiple options provided

### Video Quality
- [ ] Motion is natural
- [ ] Consistent with image
- [ ] No artifacts/glitches
- [ ] Appropriate duration
- [ ] Audio if needed

### Delivery Quality
- [ ] All requested formats
- [ ] Platform-optimized
- [ ] Properly named/organized
- [ ] Documentation complete

---

## Anti-Patterns

1. **Skipping brief** — Always start with clear direction
2. **Single option** — Generate multiple variations
3. **No approval gates** — Check at each stage
4. **Wrong tool** — Match tool to task
5. **No iteration** — Refine until right
6. **Missing formats** — Deliver all needed sizes/formats

---

## Integration Points

### Agents That Use This Stack
- **ai-creative-strategist** — Orchestrates full workflow
- **visual-designer** — Executes image generation
- **vibe-marketer** — Quick social content

### Skills That Support This Stack
- `skill-replicate-image-gen.md` — Image generation
- `skill-glif-workflows.md` — Creative workflows
- `skill-perplexity-research.md` — Research for briefs
- `skill-image-prompts.md` — Prompt engineering

### Commands
- `/creative-brief` — Generate creative brief
- `/generate-image` — Generate images from brief
- `/creative-production` — Full stack workflow
