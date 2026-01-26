# /generate-image

Generate AI images using Replicate or Glif based on a creative brief or direct request.

---

## Agent

@ai-creative-strategist or @visual-designer

## Skills Required

- `skill-replicate-image-gen.md`
- `skill-glif-workflows.md`
- `skill-ai-creative-stack.md`

## MCPs Required

- Replicate MCP (for direct image generation)
- Glif MCP (for workflow-based generation)

---

## Workflow

### 1. Understand the Request

Determine what's needed:
- Is there an existing creative brief? → Use it
- Is this a direct request? → Gather requirements

**If no brief exists, gather:**
- What type of image? (product, social graphic, hero, abstract, etc.)
- What platform/size? (aspect ratio)
- What style? (photorealistic, illustration, etc.)
- What mood? (professional, playful, etc.)
- Any specific requirements?

### 2. Select Tool

Choose the right tool for the job:

| Need | Tool | Why |
|------|------|-----|
| Photorealistic images | Replicate (Flux) | Best quality for photos |
| Product shots | Replicate (Flux) | Clean, professional |
| Stylized/artistic | Replicate (SDXL) | More artistic control |
| Branded graphics | Glif workflows | Pre-built brand templates |
| Memes/viral content | Glif workflows | Specialized generators |
| Style transfer | Glif workflows | Complex pipelines |
| Complex compositions | Glif workflows | Multi-step generation |

### 3. Craft the Prompt

Build the prompt using this structure:

```
[Subject] + [Style] + [Mood/Lighting] + [Composition] + [Details] + [Quality]
```

**Example prompts by type:**

**Product Photo:**
```
[Product description] on [surface], [lighting], product photography,
commercial quality, sharp focus, [background], high resolution
```

**Social Graphic:**
```
[Concept/subject], [style], [colors], social media graphic,
modern design, [mood], clean composition
```

**Hero Image:**
```
[Scene/subject], [style], [mood], hero image for [purpose],
wide composition, [lighting], professional quality
```

**Abstract/Background:**
```
Abstract [concept] background, [style], [colors],
subtle texture, suitable for text overlay, [mood]
```

### 4. Generate Options

**Using Replicate:**
```
Tool: generate_image
Parameters:
  prompt: [crafted prompt]
  aspect_ratio: [1:1 / 16:9 / 9:16 / 4:3]
  num_outputs: 4
  output_format: webp
```

**Using Glif:**
```
Tool: search_glifs
Query: [type of image needed]

Then:
Tool: run_glif
Parameters:
  glif_id: [selected workflow]
  inputs: {
    [workflow-specific inputs]
  }
```

### 5. Review and Recommend

Evaluate generated options:
- Does it match the brief/request?
- Is quality sufficient?
- Is it brand-appropriate?
- Which is best and why?

### 6. Iterate if Needed

If results aren't right:
- Adjust prompt wording
- Add or remove details
- Try different aspect ratio
- Switch tools if needed
- Generate new batch

---

## Output Format

```markdown
## Image Generation: [Purpose]

### Request Summary
[What was requested]

### Tool Used
[Replicate Flux / Glif / etc.]

### Prompt
```
[Full prompt used]
```

### Parameters
- Aspect Ratio: [ratio]
- Outputs: [count]
- Format: [format]

### Generated Options

**Option 1**
- URL: [url]
- Notes: [description, strengths]

**Option 2**
- URL: [url]
- Notes: [description, strengths]

**Option 3**
- URL: [url]
- Notes: [description, strengths]

**Option 4**
- URL: [url]
- Notes: [description, strengths]

### Recommendation
[Which option is best and why]

### Next Steps
- [ ] Review and select
- [ ] Request refinements?
- [ ] Generate additional variations?
- [ ] Proceed to video generation?
- [ ] Prepare final formats?
```

---

## Aspect Ratio Quick Reference

| Platform | Ratio | Use |
|----------|-------|-----|
| Instagram Feed | 1:1 | Posts |
| Instagram Story/Reel | 9:16 | Vertical video |
| Twitter/X | 16:9 | Link previews |
| LinkedIn | 16:9 | Posts |
| YouTube Thumbnail | 16:9 | Thumbnails |
| Pinterest | 9:16 | Pins |
| Blog Header | 16:9 | Article headers |
| Facebook | 16:9 | Shares |

---

## Quality Checklist

Before delivering:
- [ ] Multiple options provided (minimum 3-4)
- [ ] Prompt is documented
- [ ] Options match requested style
- [ ] Technical quality is sufficient
- [ ] Recommendation is given
- [ ] Next steps are clear

---

## Common Issues & Fixes

**Image too generic:**
→ Add more specific details to prompt
→ Include style references
→ Add mood/emotion keywords

**Wrong colors:**
→ Explicitly state colors: "purple and teal color scheme"
→ Add "no [unwanted color]"

**Composition issues:**
→ Specify composition: "centered", "rule of thirds"
→ Describe negative space needs

**Not photorealistic enough:**
→ Add "photorealistic", "professional photography"
→ Specify camera: "shot on Canon 5D, 85mm lens"

**Too busy/cluttered:**
→ Add "minimal", "clean", "simple"
→ Reduce elements in prompt
→ Specify "ample negative space"

---

## Example Usage

**User:** "Generate a hero image for our AI product landing page"

**Agent:**
1. Confirms style, mood, brand colors
2. Selects Replicate (Flux) for photorealistic
3. Crafts prompt: "Futuristic AI interface with glowing neural network visualization, clean minimal style, purple and blue gradient, hero image for SaaS homepage, wide cinematic composition, soft futuristic lighting, professional quality, 4K"
4. Generates 4 options at 16:9
5. Reviews and recommends best option
6. Asks about next steps (refinement, video, formats)
