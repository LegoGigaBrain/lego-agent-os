# content-matrix

You are running the **Content Matrix** workflow in LEGO Agent OS.

Goal:
Create or update a comprehensive Notion-based content production system that transforms brand strategy into executable, cross-platform content workflows. This command produces a "Content Matrix" workspace in Notion with full database architecture for content ideation, production, scheduling, and publishing.

Primary Agent:
- @content-strategist

Supporting Agents:
- @vibe-marketer (for content execution)
- @social-media-manager (for platform optimization)
- @brand-strategist (for signal alignment)

Skills:
- Content Matrix System (`.claude/skills/skill-content-matrix.md`)
- Content Strategy
- Editorial Calendar
- Vibe Marketing

Standards:
- `standards/signalos/transmission-framework.md`
- `standards/signalos/brand-strategy.md`
- `standards/signalos/vibe-marketing.md`

---

## Prerequisites

Before running this command, ensure:

1. **Notion MCP is configured** - The Notion MCP server must be connected with write access
2. **Brand signal is defined** - Run `/brand-strategy` first if brand foundation is unclear
3. **Content strategy exists** - Run `/content-strategy` first to define pillars
4. **Brand name is known** - You'll need to identify the brand for workspace naming

---

## Steps

### 1. Gather Brand Information

Ask:
- What is the brand name?
- Has `/content-strategy` been run? (Need content pillars)
- Does a Content Matrix already exist for this brand?
- What platforms are priority? (X, Instagram, TikTok, LinkedIn, Facebook, Blog)
- What posting frequency is targeted?

---

### 2. Check for Existing Content Matrix

Search Notion for "[Brand Name] Content Matrix":

**If Found → Update Mode:**
- Preserve existing content
- Add missing databases or properties
- Update style framework if changed
- Add new platform databases if needed

**If Not Found → Create Mode:**
- Create new parent page
- Build full database architecture
- Set up all relations
- Add sample entries

---

### 3. Define Style Framework

Default to the **4 E's Framework** unless custom styles requested:

| Style | Purpose | Energy | Color |
|-------|---------|--------|-------|
| **Challenge** | Provoke thought, disrupt assumptions | High intensity | Red |
| **Educate** | Teach, share knowledge, build authority | Informative | Blue |
| **Entertain** | Engage, amuse, be relatable | Light, fun | Yellow |
| **Empathise** | Connect emotionally, show understanding | Warm, human | Purple |

**Custom Styles (3-6):**
If brand wants custom styles, define each with:
- Name
- Color (for Notion visual coding)
- Purpose
- Example usage

---

### 4. Create Content Matrix Structure

Build this architecture in Notion:

```
[Brand] Content Matrix (Parent Page)
│
├── Style Framework (reference page)
│   └── Brand-specific content styles
│
├── Topic Generator (database)
│   └── Brainstorm backlog
│
├── Master Ideas (database)
│   └── Central idea pool with platform assignments
│
├── Platform Content (section)
│   ├── X/Twitter Content (database)
│   ├── Instagram Content (database)
│   ├── TikTok Content (database)
│   ├── LinkedIn Content (database)
│   ├── Facebook Content (database)
│   └── Long-form/Blog Content (database)
│
├── Weekly Schedule (calendar view)
│   └── Cross-platform publishing calendar
│
└── Analytics Tracker (database)
    └── Performance tracking
```

---

### 5. Create Database Schemas

#### Topic Generator

| Property | Type | Purpose |
|----------|------|---------|
| Topic | Title | Topic/theme name |
| Category | Select | Content pillar alignment |
| Potential | Select | High/Medium/Low opportunity |
| Write This | Checkbox | Flag for immediate action |
| Notes | Text | Context and angles |
| Source Ideas | Relation | Links to Ideas created from this topic |

#### Master Ideas

| Property | Type | Purpose |
|----------|------|---------|
| Idea | Title | Core idea description |
| Style | Select | Content style tag (4 E's or custom) |
| Topic | Relation | Link to Topic Generator |
| Status | Select | Idea → Approved → In Production → Published |
| Priority | Select | High/Medium/Low |
| Platforms | Multi-select | X, Instagram, TikTok, LinkedIn, Facebook, Blog |
| Platform Content | Relation | Links to platform-specific executions |
| Created | Date | When idea was captured |
| Notes | Text | Angles, hooks, references |

#### Platform Databases

Each platform database includes base properties plus platform-specific additions.

**Base Properties (All):**
- Title (Title)
- Source Idea (Relation to Master Ideas)
- Style (Select)
- Status (Select - platform-specific workflow)
- Scheduled Date (Date)
- Published URL (URL)
- Performance (Select: Viral/Strong/Average/Weak)
- Notes (Text)

**Platform-Specific Additions:**

**X/Twitter:**
- Format: Single tweet, Thread, Quote tweet, Reply chain
- Media: Text only, Image, Video, GIF, Poll
- Hook Type: Question, Bold statement, Stat, Story opener
- Thread Length: Number

**Instagram:**
- Format: Carousel, Single image, Reel, Story, Live
- Aspect Ratio: 1:1, 4:5, 9:16
- Slides: Number
- CTA: Link in bio, DM me, Comment, Save, Share

**TikTok:**
- Format: Tutorial, Trend, Storytelling, Behind-scenes, Duet, Stitch
- Duration: <15s, 15-30s, 30-60s, 1-3min
- Sound: Original, Trending audio, Voiceover, No sound
- Hook Strategy: Text

**LinkedIn:**
- Format: Text post, Document/Carousel, Article, Video, Poll
- Tone: Professional, Thought leadership, Personal story
- Target Audience: Executives, Peers, Juniors, Industry-wide

**Facebook:**
- Format: Text, Image, Video, Link share, Live, Reel, Story
- Audience: Page followers, Group, Boosted/Ads

**Long-form/Blog:**
- Format: How-to, Listicle, Opinion, Case study, Interview, Guide
- Word Count: 500-1000, 1000-2000, 2000-3500, 3500+
- SEO Keyword: Text
- Repurpose To: Multi-select platforms

---

### 6. Set Up Platform Status Workflows

Each platform has its own production flow:

**X/Twitter:**
`Idea → Draft → Review → Scheduled → Published → Analyzing`

**Instagram:**
`Idea → Script/Copy → Design → Review → Scheduled → Published → Analyzing`

**TikTok:**
`Idea → Script → Filming → Editing → Review → Scheduled → Published → Analyzing`

**LinkedIn:**
`Idea → Draft → Review → Scheduled → Published → Engaging → Analyzing`

**Long-form/Blog:**
`Idea → Outline → Draft → Edit → SEO Review → Published → Repurposing → Analyzing`

---

### 7. Create Weekly Schedule View

Set up calendar view with:
- Day/Time slots
- Platform icons
- Style color coding
- Status indicators

Sample weekly rhythm (14 posts/week):

| Day | AM Slot | PM Slot |
|-----|---------|---------|
| Monday | X [Challenge] | Instagram [Empathise] |
| Tuesday | LinkedIn [Educate] | TikTok [Entertain] |
| Wednesday | X [Entertain] | Instagram [Challenge] |
| Thursday | LinkedIn [Empathise] | X [Educate] |
| Friday | TikTok [Educate] | Instagram [Entertain] |
| Saturday | X [Entertain] | TikTok [Empathise] |
| Sunday | Blog [Educate] | X [Challenge] |

---

### 8. Add Sample Entries

Create template entries in each database as examples:
- 1-2 sample topics in Topic Generator
- 2-3 sample ideas in Master Ideas with platform assignments
- 1 sample entry per platform database showing proper format

---

### 9. Document vibe-marketer Integration

Add instructions for content production workflow:

**vibe-marketer reads from Notion:**
- Pull ideas marked for production
- Check platform requirements
- Note style and brand voice guidelines

**vibe-marketer writes to Notion:**
- Draft content directly in platform databases
- Update status as work progresses
- Add notes on creative decisions

**Post-publication:**
- Mark as published
- Add live URL
- Trigger performance tracking

---

## Output Deliverables

1. **Notion Workspace** - Complete Content Matrix structure
2. **Style Framework** - Documented style system
3. **Database Relations** - All databases properly linked
4. **Sample Entries** - Templates in each database
5. **Schedule Template** - Weekly posting rhythm

---

## Quality Checklist

Before completion:

**Structure Quality**
- [ ] All databases created with correct schemas
- [ ] Relations properly linked (Ideas → Platforms)
- [ ] Style framework documented
- [ ] Platform-specific properties added

**Usability**
- [ ] Sample entries demonstrate proper usage
- [ ] Status workflows are platform-appropriate
- [ ] Calendar view is configured
- [ ] Instructions are clear

**Integration**
- [ ] vibe-marketer can access and write to databases
- [ ] Content pillars are reflected in categories
- [ ] Brand voice is documented

---

## Update Mode Behavior

When updating an existing Content Matrix:

1. **Preserve all existing content** - Never delete user data
2. **Add missing databases** - If new platforms are needed
3. **Add missing properties** - If schema has expanded
4. **Update style framework** - If brand has evolved
5. **Add new sample entries** - If templates are missing
6. **Update relations** - If new databases were added

---

## Handoff Guidance

After Content Matrix creation:

**To vibe-marketer:**
- Notion workspace URL
- Database access instructions
- Style framework reference
- Production workflow guide

**To content-strategist:**
- Content Matrix is now operational
- Ready to populate with strategic content
- Calendar awaits scheduling

**To social-media-manager:**
- Platform databases are configured
- Ready for platform-specific optimization
- Performance tracking is available

---

## Anti-Patterns

- Creating Content Matrix before content strategy exists
- Too many platforms at once (start with 2-3)
- Copy-pasting content across platforms (adapt instead)
- Ignoring style variety (never post same style back-to-back)
- No performance feedback loop
- Manual processes when automation is possible
