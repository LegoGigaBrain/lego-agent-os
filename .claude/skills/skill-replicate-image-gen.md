# Skill: Replicate Image Generation

## Purpose

Leverage Replicate's MCP server for AI image generation using state-of-the-art models like Flux, SDXL, and others. This skill enables agents to generate on-brand visuals for marketing, social media, and creative projects.

---

## Core Philosophy

**Prompt engineering is design direction.** Great AI images start with great prompts. This skill bridges the gap between creative vision and executable prompts.

---

## MCP Tools Available

### 1. Generate Image (`generate_image`)

Generate images from text prompts.

**Parameters:**
```
prompt: "detailed description of desired image"
aspect_ratio: "1:1" | "16:9" | "9:16" | "4:3" | "3:4"
num_outputs: 1-4
output_format: "webp" | "png" | "jpg"
```

**Returns:**
- Array of image URLs
- Generation metadata

---

### 2. Generate Variations (`generate_variations`)

Create variations of an existing concept.

**Parameters:**
```
prompt: "base prompt"
variations: ["variation 1 modifier", "variation 2 modifier"]
```

---

## Prompt Engineering

### Prompt Structure

```
[Subject] + [Style] + [Mood/Lighting] + [Composition] + [Details] + [Quality Modifiers]
```

### Subject
The main focus of the image.
```
"A founder working at a standing desk"
"Abstract representation of data flow"
"Minimalist logo mark"
```

### Style
The visual aesthetic.
```
"in the style of corporate photography"
"flat vector illustration"
"3D render"
"watercolor painting"
"photorealistic"
"minimalist design"
```

### Mood/Lighting
The emotional tone and lighting.
```
"warm golden hour lighting"
"dramatic high contrast"
"soft diffused light"
"moody and atmospheric"
"bright and optimistic"
```

### Composition
How elements are arranged.
```
"centered composition"
"rule of thirds"
"negative space on left"
"symmetrical layout"
"close-up detail shot"
```

### Details
Specific elements to include.
```
"wearing a blue shirt"
"modern office background"
"geometric shapes"
"tech aesthetic"
```

### Quality Modifiers
Technical quality boosters.
```
"high resolution"
"professional photography"
"sharp focus"
"detailed"
"4K"
"award-winning"
```

---

## Prompt Templates by Use Case

### Product Photo

```
prompt: "[Product] on [surface], [lighting style], product photography,
commercial quality, sharp focus, [background], high resolution"

Example:
"Sleek wireless earbuds on marble surface, soft studio lighting,
product photography, commercial quality, sharp focus,
minimalist white background, high resolution"
```

### Social Media Graphic

```
prompt: "[Subject/Concept], [style], [brand colors], social media graphic,
modern design, [mood], clean composition"

Example:
"Abstract representation of growth and scaling,
geometric flat illustration, purple and teal gradient,
social media graphic, modern design, optimistic and energetic,
clean composition"
```

### Hero Image

```
prompt: "[Scene/Subject], [style], [mood], hero image for [purpose],
wide aspect ratio, [lighting], professional quality"

Example:
"Diverse team collaborating in modern office space,
candid corporate photography style, warm and inclusive mood,
hero image for SaaS homepage, wide aspect ratio,
natural window lighting, professional quality"
```

### Blog Header

```
prompt: "[Topic visualization], [style], blog header image,
horizontal composition, [mood], [color scheme], clean design"

Example:
"Visual metaphor for AI automation - robot hand and human hand
reaching toward each other, 3D render style, blog header image,
horizontal composition, futuristic and hopeful, blue and silver,
clean design"
```

### Icon/Logo Concept

```
prompt: "[Concept] icon/logo mark, [style], minimal design,
vector-style, [colors], centered, white background, simple shapes"

Example:
"Lightning bolt combined with code brackets icon,
flat design, minimal, vector-style, electric blue,
centered, white background, simple geometric shapes"
```

### Abstract Background

```
prompt: "Abstract [concept] background, [style], [colors],
subtle texture, suitable for text overlay, [mood]"

Example:
"Abstract flowing data streams background,
gradient mesh style, deep purple to teal,
subtle texture, suitable for text overlay,
professional and innovative"
```

---

## Aspect Ratios by Platform

| Platform | Aspect Ratio | Use Case |
|----------|--------------|----------|
| Instagram Post | 1:1 | Feed posts |
| Instagram Story | 9:16 | Stories, Reels |
| Twitter/X | 16:9 | Link previews |
| LinkedIn | 1.91:1 (≈16:9) | Posts |
| Facebook | 1.91:1 | Link shares |
| Blog Header | 16:9 | Article headers |
| YouTube Thumbnail | 16:9 | Video thumbnails |
| Pinterest | 2:3 (≈9:16) | Pins |

---

## Brand Consistency

### Define Brand Visual Parameters

Before generating, establish:

```
BRAND VISUAL GUIDELINES

Colors:
- Primary: [color + hex]
- Secondary: [color + hex]
- Accent: [color + hex]

Style:
- Photography: [candid/studio/lifestyle]
- Illustration: [flat/3D/hand-drawn]
- Overall: [minimal/bold/playful/corporate]

Mood:
- [optimistic/serious/playful/professional]

Subjects:
- Show: [what to include]
- Avoid: [what to exclude]
```

### Consistent Prompt Suffix

Create a reusable brand suffix:

```
BRAND SUFFIX:
"[brand style], [brand colors], [brand mood], professional quality"

Example:
"minimalist modern design, purple and white color scheme,
innovative and trustworthy mood, professional quality"
```

---

## Generation Workflow

### 1. Brief to Prompt

```
Brief: "We need a hero image showing our AI product in action"

Analysis:
- Subject: AI/technology visualization
- Context: Homepage hero
- Mood: Innovative, trustworthy
- Format: 16:9 wide

Prompt:
"Futuristic AI interface visualization with glowing neural network,
holographic display style, purple and teal gradient,
hero image, wide cinematic composition,
soft futuristic lighting, professional quality, 4K"
```

### 2. Generate Options

```
Generate 4 variations:
1. Base prompt
2. + "more abstract and minimal"
3. + "warmer, more human-centric"
4. + "darker, more dramatic"
```

### 3. Iterate and Refine

```
Feedback: "Like #2 but needs more energy"

Refined prompt:
"[Original prompt] + dynamic composition,
energy and motion, vibrant highlights"
```

---

## Output Formatting

### Image Generation Report

```
## Generated: [Purpose]

### Brief
[What was requested]

### Prompt Used
```
[Full prompt]
```

### Options Generated

1. **Option A**
   - URL: [url]
   - Notes: [description]

2. **Option B**
   - URL: [url]
   - Notes: [description]

### Recommendation
[Which option and why]

### Next Steps
- [ ] Client review
- [ ] Refinement needed?
- [ ] Final format/size
```

---

## Integration with Agents

### visual-designer
- Primary user for all image generation
- Executes creative direction
- Iterates on visual concepts

### vibe-marketer
- Social media graphics
- Quick visual content
- Trend-responsive imagery

### ai-creative-strategist
- Creative direction
- Concept visualization
- Brief to image translation

### content-strategist
- Blog headers
- Content imagery
- Visual content planning

---

## Quality Checklist

Before delivering generated images:

- [ ] Matches brief/direction
- [ ] Brand-consistent colors/style
- [ ] Correct aspect ratio
- [ ] No artifacts or distortions
- [ ] Appropriate for use case
- [ ] Multiple options provided

---

## Anti-Patterns

1. **Vague prompts** — Be specific and detailed
2. **No style direction** — Always specify style
3. **Single output** — Generate multiple options
4. **No iteration** — Refine based on results
5. **Ignoring brand** — Always apply brand parameters
6. **Wrong aspect ratio** — Match to platform

---

## Prompt Troubleshooting

### "Image looks generic"
- Add more specific details
- Include style references
- Add mood/emotion keywords

### "Colors are wrong"
- Explicitly state colors
- Use "color scheme: X and Y"
- Add "no [unwanted color]"

### "Composition is off"
- Specify composition explicitly
- Use "centered" or "rule of thirds"
- Describe negative space

### "Too busy/cluttered"
- Add "minimal", "clean", "simple"
- Reduce subject elements
- Specify "negative space"

### "Not photorealistic enough"
- Add "photorealistic", "hyperrealistic"
- Specify camera/lens: "shot on Canon 5D"
- Add "professional photography"

---

## Models Available

| Model | Best For | Notes |
|-------|----------|-------|
| Flux | General purpose, high quality | Default choice |
| SDXL | Artistic, stylized | Good for illustrations |
| Flux Schnell | Fast generation | Lower quality, quick iterations |

---

## Rate Limits & Costs

- Flux: ~$0.003/image
- SDXL: ~$0.002/image
- Plan for iteration (4-8 generations per concept)
- Cache successful prompts for reuse
