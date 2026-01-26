# verbal-identity

You are running the **Verbal Identity** workflow in LEGO Agent OS.

Goal:
Design a comprehensive verbal identity system including voice, tone, language stack, and lexicon. This workflow produces a complete language operating system for the brand.

Primary Agent:
- @verbal-identity-designer

Supporting Agents:
- @brand-strategist (for strategy foundation)
- @copywriter (for copy examples)
- @ux-writer (for product voice)

Skills:
- Verbal Identity
- Naming Systems
- Copywriting

Standards:
- `standards/signalos/transmission-framework.md`
- `standards/signalos/brand-strategy.md`

---

## Steps

### 1. Clarify Scope

Determine what we're designing:

| Scope | Description | Output |
|-------|-------------|--------|
| **Full System** | Complete verbal identity | Full verbal identity document |
| **Voice Design** | Core voice definition | Voice guidelines |
| **Tone Matrix** | Context adaptations | Tone guide |
| **Language Stack** | Key messaging | Language hierarchy |
| **Lexicon** | Vocabulary system | Word guide |

Ask:
- What brand strategy exists?
- What's the archetype?
- What voice work has been done?
- What channels need coverage?
- What's the current state of language?

---

### 2. Strategy Extraction

**Goal:** Pull inputs from brand strategy

```
BRAND FOUNDATION:

ARCHETYPE:
Primary: [Archetype]
Secondary: [Archetype]
Shadow: [What to avoid]

VALUES:
- [Value 1]
- [Value 2]
- [Value 3]

TRIBE:
Who they are: [Description]
How they speak: [Language patterns]

POSITIONING:
Onliness: [Statement]
Cultural tension: [What we stand for/against]
```

If strategy is missing, invoke @brand-strategist first.

---

### 3. Voice Design

**Goal:** Define the core voice

#### Voice Attributes

Define 3-5 voice attributes:

```
ATTRIBUTE: [Name]

DEFINITION:
What this means for our voice

IN PRACTICE:
How it shows up in writing

THIS:
"[Example of attribute done right]"

NOT THIS:
"[Example of what to avoid]"

MORE EXAMPLES:
- [Example 1]
- [Example 2]
- [Example 3]
```

#### Voice Spectrum

Define boundaries:

```
VOICE SPECTRUM:

We are [This] ←→ Not [That]
We are [This] ←→ Not [That]
We are [This] ←→ Not [That]
We are [This] ←→ Not [That]

Examples:
- Confident ←→ Not Arrogant
- Warm ←→ Not Sappy
- Direct ←→ Not Blunt
- Smart ←→ Not Condescending
```

---

### 4. Tone Matrix

**Goal:** Map how voice adapts by context

```
TONE MATRIX:

| Context | Tone Shift | Energy | Example |
|---------|------------|--------|---------|
| Welcome | More warm, celebratory | High | "Welcome! We're so glad you're here." |
| Error | Supportive, clear | Medium | "That didn't work. Here's what to try." |
| Success | Celebratory, encouraging | High | "You did it! Nice work." |
| Educational | Patient, clear | Medium | "Here's how this works." |
| Serious | Direct, respectful | Low | "We need to address something important." |
| Playful | Lighter, more personality | Medium-High | "Ready to shake things up?" |

CHANNEL ADAPTATIONS:

| Channel | Voice Intensity | Tone Default | Special Notes |
|---------|-----------------|--------------|---------------|
| Website | Full | Confident, clear | SEO considerations |
| Email | Full | Warm, direct | Personal touch |
| Social | Adapted | Platform-native | Per-platform guidance |
| Product | Adapted | Helpful, clear | Functional first |
| Ads | Adapted | Punchy, benefit-focused | Space constraints |
```

---

### 5. Language Stack

**Goal:** Build the messaging hierarchy

```
LANGUAGE STACK:

TAGLINE:
[5-7 words — compressed brand signal]
Purpose: Instant recognition
Usage: Hero moments, primary expression

POSITIONING LINE:
[Single sentence — what we do and why it matters]
Purpose: Clarity of offering
Usage: Introductions, explanations

ELEVATOR PITCH:
[30-second spoken version]
Purpose: Verbal explanation
Usage: Conversations, networking

BOILERPLATE:
[50-100 words — standard description]
Purpose: Formal contexts
Usage: Press, about pages, bios

TRANSMISSION LINES:
[Recurring phrases that reinforce signal]
Purpose: Recognizable expressions
Usage: Repeated across touchpoints

- "[Phrase 1]"
- "[Phrase 2]"
- "[Phrase 3]"
```

---

### 6. Lexicon

**Goal:** Define brand vocabulary

```
CORE TERMS:
Terms central to our world

| Term | Definition | Usage |
|------|------------|-------|
| [Term] | [What it means] | [How we use it] |

---

PREFERRED LANGUAGE:
Words we choose over alternatives

| Say This | Not This | Why |
|----------|----------|-----|
| [Preferred] | [Avoided] | [Rationale] |

---

FORBIDDEN WORDS:
Terms we never use

| Word | Why We Avoid |
|------|--------------|
| [Term] | [Rationale] |

---

INSIDER LANGUAGE:
Terms our tribe uses/recognizes

| Term | Meaning | Origin |
|------|---------|--------|
| [Term] | [What it means] | [Where it came from] |
```

---

### 7. Messaging Architecture

**Goal:** Structure key messages

For each key topic:

```
TOPIC: [Area]

PRIMARY MESSAGE:
[Single sentence — the main point]

SUPPORTING MESSAGES:
1. [Support point + proof]
2. [Support point + proof]
3. [Support point + proof]

PROOF POINTS:
- [Evidence]
- [Evidence]

OBJECTION HANDLING:
Objection: [Common pushback]
Response: [How we address]
```

---

### 8. Application Guide

**Goal:** Make it usable

```
BY CHANNEL:

[CHANNEL]:
- Voice intensity: [Full/Adapted]
- Tone default: [Description]
- Length: [Guidance]
- Special considerations: [Notes]

BY AUDIENCE:

[AUDIENCE]:
- Tone adjustment: [How to adapt]
- Language level: [Accessibility]
- Key message: [Focus]
```

---

### 9. Output Deliverables

Produce the Verbal Identity Document:

```markdown
# Verbal Identity: [Brand]

## Executive Summary
[2-3 sentences on the verbal identity approach]

## Voice

### Core Voice
[3-5 word description]

### Voice Attributes

#### [Attribute 1]
Definition: [What it means]
In practice: [How it shows up]
Example: [Sample copy]
Not this: [Anti-example]

[Continue for each attribute]

### Voice Spectrum
[What we are vs. aren't]

## Tone

### Tone Matrix
| Context | Shift | Example |
|---------|-------|---------|
| [Context] | [Shift] | [Example] |

### Channel Adaptations
[By channel guidance]

## Language Stack

### Tagline
[Tagline]

### Positioning Line
[Positioning]

### Transmission Lines
- "[Line 1]"
- "[Line 2]"
- "[Line 3]"

### Boilerplate
[Full boilerplate]

## Lexicon

### Core Terms
[Key vocabulary with definitions]

### Preferences
[Say this, not that table]

### Forbidden
[What we never say]

### Insider Language
[Tribe vocabulary]

## Messaging Architecture
[By topic area]

## Application

### By Channel
[Channel-specific guidance]

### By Audience
[Audience-specific guidance]

## Examples

### Good Examples
[Annotated samples]

### What to Avoid
[Anti-examples]

## Quick Reference
[One-page summary]
```

---

## Quality Checklist

**Voice Quality**
- [ ] Voice reflects archetype
- [ ] Voice is distinctive
- [ ] Voice is applicable by anyone
- [ ] 3-5 attributes (not more)
- [ ] Examples are abundant

**Tone Quality**
- [ ] Tone adapts by context
- [ ] Channel guidance is clear
- [ ] Consistency maintained

**Language Quality**
- [ ] Language stack is complete
- [ ] Lexicon is comprehensive
- [ ] Messaging is structured

**Usability**
- [ ] Guidelines are practical
- [ ] Quick reference included
- [ ] Team can apply it

---

## Handoff Guidance

After completing verbal identity:

**Copywriter**
- Voice and tone guidelines
- Lexicon for execution
- Examples to follow

**UX Writer**
- Product voice guidance
- Tone for UI contexts
- Error/success patterns

**Content Strategist**
- Voice for content
- Tone by content type
- Transmission lines

**Marketing**
- Campaign voice guidance
- Channel adaptations
- Key messaging
