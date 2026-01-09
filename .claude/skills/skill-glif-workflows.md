# Skill: Glif Creative Workflows

## Purpose

Leverage Glif's MCP server to access and execute pre-built AI creative workflows. Glif provides orchestrated pipelines that combine multiple AI models for complex creative tasks — from meme generation to style transfers to multi-step image creation.

---

## Core Philosophy

**Workflows over one-shots.** Glif abstracts complex AI pipelines into reusable workflows. Instead of manually chaining prompts and models, execute battle-tested creative pipelines.

---

## MCP Tools Available

### 1. Run Workflow (`run_glif`)

Execute a specific Glif workflow.

**Parameters:**
```
glif_id: "workflow-id"
inputs: {
  "input_name": "value",
  "another_input": "value"
}
```

**Returns:**
- Generated output (image URL, etc.)
- Workflow metadata

---

### 2. Search Workflows (`search_glifs`)

Find workflows by keyword.

**Parameters:**
```
query: "meme generator"
limit: 10
```

**Returns:**
- List of matching workflows
- Workflow IDs and descriptions

---

### 3. Get Workflow Info (`get_glif_info`)

Get details about a specific workflow.

**Parameters:**
```
glif_id: "workflow-id"
```

**Returns:**
- Workflow description
- Required inputs
- Example outputs

---

### 4. List Featured (`list_featured`)

Browse featured/popular workflows.

**Returns:**
- Curated list of workflows
- Categories and use cases

---

### 5. List My Glifs (`list_my_glifs`)

Access your saved/created workflows.

**Returns:**
- Personal workflow collection
- Custom workflows you've built

---

## Workflow Categories

### Meme & Viral Content
- Meme generators
- Trend format adapters
- Caption generators
- Reaction image creators

### Style Transfer
- Apply artistic styles
- Brand style application
- Photo to illustration
- Vintage/retro effects

### Image Enhancement
- Upscaling
- Background removal
- Color correction
- Noise reduction

### Character/Avatar
- Avatar generation
- Character consistency
- Pose variations
- Expression changes

### Product & Marketing
- Product mockups
- Ad creative generation
- Thumbnail creation
- Social media templates

### Text & Typography
- Text effects
- Logo generation
- Typography styling
- Quote graphics

---

## Workflow Discovery Process

### 1. Define Need

```
What creative outcome do you need?
- Meme for Twitter
- Product mockup
- Style-consistent avatar
- Enhanced photo
```

### 2. Search Glif

```
search_glifs: "product mockup"
→ Review results
→ Check input requirements
→ Note workflow IDs
```

### 3. Test Workflow

```
get_glif_info: "workflow-id"
→ Understand inputs
→ See example outputs
→ Verify fits need
```

### 4. Execute

```
run_glif:
  glif_id: "workflow-id"
  inputs: { ... }
→ Review output
→ Iterate if needed
```

---

## Common Workflows

### Meme Generation

```
1. Search: search_glifs("meme template")
2. Select workflow for format (Drake, Expanding Brain, etc.)
3. Execute:
   run_glif:
     glif_id: "meme-workflow-id"
     inputs: {
       "top_text": "When the deploy succeeds",
       "bottom_text": "But you forgot to test"
     }
```

### Product Mockup

```
1. Search: search_glifs("product mockup iPhone")
2. Get info on best match
3. Execute:
   run_glif:
     glif_id: "mockup-workflow-id"
     inputs: {
       "screenshot": "url-to-screenshot",
       "device": "iPhone 15 Pro"
     }
```

### Avatar Generation

```
1. Search: search_glifs("consistent character avatar")
2. Execute:
   run_glif:
     glif_id: "avatar-workflow-id"
     inputs: {
       "description": "Professional woman, dark hair, friendly expression",
       "style": "3D Pixar style"
     }
```

### Style Transfer

```
1. Search: search_glifs("style transfer")
2. Execute:
   run_glif:
     glif_id: "style-workflow-id"
     inputs: {
       "source_image": "url-to-photo",
       "style": "watercolor painting"
     }
```

---

## Building Custom Workflows

If no existing workflow fits, you can create custom Glifs at glif.app:

### Workflow Components

```
INPUT
  ↓
[Model 1: Text generation]
  ↓
[Model 2: Image generation]
  ↓
[Model 3: Image enhancement]
  ↓
OUTPUT
```

### Example: Brand-Consistent Social Graphic

```
Inputs:
- topic (text)
- brand_colors (text)
- style_reference (image)

Workflow:
1. GPT: Generate visual concept from topic
2. Flux: Generate base image from concept + style
3. ControlNet: Apply brand colors
4. Upscaler: Enhance to final resolution

Output:
- Final branded graphic
```

---

## Integration with Creative Stack

Glif fits into the larger creative workflow:

```
┌─────────────────────────────────────────────────────────────────┐
│                      AI CREATIVE STACK                          │
│                                                                 │
│    ai-creative-strategist                                       │
│    └── Brief: "Need viral meme about our product launch"        │
│                                                                 │
│              ↓                                                  │
│                                                                 │
│    Glif Workflow                                                │
│    └── search_glifs: "product meme"                             │
│    └── run_glif: selected workflow                              │
│                                                                 │
│              ↓                                                  │
│                                                                 │
│    Replicate (if enhancement needed)                            │
│    └── Upscale or style adjust                                  │
│                                                                 │
│              ↓                                                  │
│                                                                 │
│    Output: Ready-to-post content                                │
└─────────────────────────────────────────────────────────────────┘
```

---

## Output Formatting

### Workflow Execution Report

```
## Glif Execution: [Purpose]

### Workflow Used
- Name: [workflow name]
- ID: [glif_id]
- Description: [what it does]

### Inputs Provided
```
{
  "input1": "value1",
  "input2": "value2"
}
```

### Output
- URL: [output url]
- Format: [image/video/etc]

### Notes
[Any observations or iteration needs]
```

### Workflow Discovery Report

```
## Workflow Search: [Query]

### Matches Found

1. **[Workflow Name]**
   - ID: [id]
   - Description: [desc]
   - Inputs: [required inputs]
   - Best for: [use case]

2. **[Workflow Name]**
   - ID: [id]
   - Description: [desc]
   - Inputs: [required inputs]
   - Best for: [use case]

### Recommendation
[Which workflow to use and why]
```

---

## Integration with Agents

### ai-creative-strategist
- Workflow selection and orchestration
- Complex creative pipelines
- Multi-step generation

### visual-designer
- Style transfers
- Image enhancement
- Consistent visual outputs

### vibe-marketer
- Meme generation
- Trend format adaptation
- Quick viral content

---

## Quality Checklist

Before using Glif workflow:

- [ ] Workflow matches use case
- [ ] Inputs are correctly formatted
- [ ] Output format is appropriate
- [ ] Brand consistency considered
- [ ] Multiple options if needed

---

## Anti-Patterns

1. **Wrong workflow** — Verify workflow fits need before running
2. **Bad inputs** — Check required input format
3. **No iteration** — First output may need refinement
4. **Ignoring examples** — Review example outputs first
5. **Over-automation** — Some tasks need human judgment

---

## Troubleshooting

### "Workflow not found"
- Check workflow ID is correct
- Search for similar workflows
- Workflow may have been removed

### "Invalid inputs"
- Check required input names
- Verify input types (text, image URL, etc.)
- Review workflow documentation

### "Output quality poor"
- Try different input variations
- Check if workflow is designed for your use case
- Consider using enhancement workflow after

### "Workflow timeout"
- Complex workflows take longer
- Check Glif status page
- Try simpler workflow

---

## Best Practices

1. **Test first** — Run with test inputs before production
2. **Save workflow IDs** — Keep useful workflows documented
3. **Build library** — Maintain list of go-to workflows
4. **Create custom** — Build brand-specific workflows on glif.app
5. **Combine tools** — Use Glif + Replicate for best results
