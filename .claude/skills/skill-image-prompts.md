# Skill: Image Prompts

## Purpose

Write effective prompts for AI image generation tools (Midjourney, DALL-E, Stable Diffusion, etc.) that produce on-brand, high-quality visuals aligned with brand strategy.

## Standards Awareness

Before applying this skill, ensure familiarity with:
- `standards/signalos/brand-strategy.md`
- `standards/signalos/transmission-framework.md`

---

## Core Philosophy

> "A prompt is a creative brief for AI. The better the brief, the better the output."

Effective image prompts:
- Are specific and descriptive
- Include style and mood direction
- Reference the brand's visual language
- Anticipate and prevent common issues
- Iterate based on results

---

## Prompt Structure

### The Anatomy of a Prompt

```
[SUBJECT] + [STYLE] + [MOOD/ATMOSPHERE] + [TECHNICAL SPECS] + [MODIFIERS]
```

**SUBJECT:** What is in the image
**STYLE:** Artistic approach or reference
**MOOD:** Emotional quality and atmosphere
**TECHNICAL:** Camera, lighting, composition
**MODIFIERS:** Quality boosters, negative prompts

---

## Prompt Components

### 1. Subject Description

Be specific about what you want:

```
WEAK: "A person working"
STRONG: "A confident woman in her 30s, wearing smart casual clothing,
working at a minimalist desk with a laptop, looking focused but relaxed"
```

**Tips:**
- Describe age, gender, expression, pose
- Include clothing, props, environment
- Specify relationships between elements
- Note what's in foreground/background

### 2. Style References

Define the artistic approach:

```
PHOTOGRAPHY STYLES:
- Editorial photography
- Lifestyle photography
- Product photography
- Documentary style
- Fashion photography
- Cinematic still

ART STYLES:
- Minimalist illustration
- Flat design
- 3D render
- Watercolor
- Line art
- Collage

ARTIST/ERA REFERENCES:
- "In the style of [artist]"
- "1960s mid-century modern aesthetic"
- "Contemporary Scandinavian design"
```

### 3. Mood & Atmosphere

Set the emotional tone:

```
MOOD DESCRIPTORS:
- Warm and inviting
- Bold and energetic
- Calm and serene
- Mysterious and intriguing
- Professional and trustworthy
- Playful and whimsical

ATMOSPHERE:
- Soft morning light
- Dramatic shadows
- Airy and bright
- Moody and atmospheric
- Clean and minimal
```

### 4. Technical Specifications

Guide the technical execution:

```
CAMERA/LENS:
- Shot on 35mm film
- 85mm portrait lens
- Wide angle lens
- Macro photography
- Aerial/drone shot

LIGHTING:
- Natural light
- Golden hour
- Studio lighting
- Soft diffused light
- Hard directional light
- Rim lighting

COMPOSITION:
- Rule of thirds
- Centered composition
- Negative space
- Close-up/detail shot
- Wide establishing shot
- Bird's eye view
```

### 5. Quality Modifiers

Boost output quality:

```
QUALITY BOOSTERS:
- High quality
- Highly detailed
- Professional photography
- 8K resolution
- Award-winning
- Featured on [platform]

NEGATIVE PROMPTS (what to avoid):
- No text
- No watermarks
- No blur
- No distortion
- No extra limbs
- Avoid [specific element]
```

---

## Prompt Templates

### Brand Photography

```
[Subject description], [brand personality] mood, [photography style],
[lighting], [color palette reference], professional photography,
high quality, [aspect ratio]

EXAMPLE:
"A diverse team collaborating around a modern conference table,
confident and focused expressions, editorial photography style,
soft natural light from large windows, warm neutral tones with
accent of teal, professional corporate photography, 16:9 aspect ratio"
```

### Product Imagery

```
[Product] in [setting], [style] photography, [lighting setup],
[background], [mood], [technical specs], commercial quality

EXAMPLE:
"Minimalist water bottle on white marble surface, product photography,
soft studio lighting with subtle shadows, clean white background,
premium and sophisticated mood, shot on medium format camera,
highly detailed, commercial quality"
```

### Lifestyle Imagery

```
[Person/people] [action] in [environment], [mood] atmosphere,
[photography style], [lighting], [color treatment], authentic moment

EXAMPLE:
"Young professional enjoying morning coffee in a sunlit apartment,
peaceful and content mood, lifestyle photography, golden morning light
streaming through windows, warm muted tones, candid authentic moment,
editorial quality"
```

### Abstract/Conceptual

```
[Concept] represented through [visual metaphor], [art style],
[color palette], [mood], [composition approach]

EXAMPLE:
"Growth and transformation represented through organic flowing forms,
abstract 3D render, gradient from deep blue to vibrant orange,
optimistic and dynamic mood, sweeping composition with negative space,
modern and sophisticated"
```

### Social Media

```
[Subject] for [platform], [brand style], [mood], optimized for
[format], [engagement goal], on-brand colors [palette]

EXAMPLE:
"Inspirational quote card for Instagram, minimalist design,
empowering mood, optimized for square format, highly shareable,
brand colors navy blue and coral, clean typography space"
```

---

## Brand-Aligned Prompting

### Archetype Translation

Translate archetype into visual direction:

```
ARCHETYPE: The Sage
VISUAL TRANSLATION:
- Clean, organized compositions
- Neutral, sophisticated colors
- Thoughtful, contemplative subjects
- Books, learning environments
- Soft, even lighting

PROMPT ADDITION:
"...wise and thoughtful mood, clean organized composition,
sophisticated neutral palette, contemplative atmosphere"
```

### Values Translation

Translate values into visual elements:

```
VALUE: Innovation
VISUAL TRANSLATION:
- Forward-looking perspectives
- Clean, modern aesthetics
- Technology elements
- Dynamic compositions
- Bright, optimistic lighting

PROMPT ADDITION:
"...innovative and forward-thinking mood, modern clean aesthetic,
dynamic composition, bright optimistic lighting"
```

---

## Platform-Specific Tips

### Midjourney

```
SYNTAX:
/imagine [prompt] --ar [aspect] --v [version] --style [style]

USEFUL PARAMETERS:
--ar 16:9 (aspect ratio)
--v 6 (version)
--style raw (less Midjourney aesthetic)
--no [element] (negative prompt)
--q 2 (quality)
--s [0-1000] (stylization)

TIPS:
- Use :: for weight (element::2 = double weight)
- Shorter prompts often work better
- Reference specific artists/styles
- Use --no for things to avoid
```

### DALL-E

```
TIPS:
- More literal interpretation
- Natural language works well
- Be very specific about what you want
- Describe relationships clearly
- Include style references explicitly
```

### Stable Diffusion

```
SYNTAX:
Positive prompt, Negative prompt

TIPS:
- Negative prompts are powerful
- Use specific model keywords
- Weight elements with (element:1.2)
- Be technical about quality
- Reference checkpoint style
```

---

## Iteration Process

### Prompt Refinement

```
ITERATION 1: Base prompt
[Initial attempt]

RESULT ANALYSIS:
- What worked: [Elements that are good]
- What's missing: [Elements to add]
- What's wrong: [Elements to remove/change]

ITERATION 2: Refined prompt
[Adjusted based on analysis]

[Continue until satisfied]
```

### Common Fixes

```
PROBLEM: Too generic
FIX: Add more specific details and style references

PROBLEM: Wrong mood
FIX: Add explicit mood descriptors and lighting direction

PROBLEM: Off-brand colors
FIX: Specify color palette explicitly

PROBLEM: Poor composition
FIX: Add composition direction (rule of thirds, centered, etc.)

PROBLEM: Wrong style
FIX: Add artist/style references, use negative prompts
```

---

## Output Template

### Image Prompt Brief

```
# Image Prompt: [Project/Purpose]

## Objective
[What this image is for]

## Brand Alignment
Archetype: [Archetype]
Mood: [Brand mood]
Colors: [Palette]

## Prompt

### Midjourney
```
[Full Midjourney prompt with parameters]
```

### DALL-E
```
[DALL-E optimized prompt]
```

## Variations
[Alternative prompts for different angles/approaches]

## Notes
[Any special considerations]
```

---

## Quality Checklist

- [ ] Prompt is specific and detailed
- [ ] Style is clearly defined
- [ ] Mood aligns with brand
- [ ] Colors are specified or referenced
- [ ] Technical specs included
- [ ] Negative prompts used where needed
- [ ] Platform-optimized
- [ ] Tested and iterated

---

## Anti-Patterns

- Vague, generic descriptions
- Conflicting style references
- Ignoring brand guidelines
- No mood/atmosphere direction
- Forgetting aspect ratio
- Not using negative prompts
- One-and-done (no iteration)
