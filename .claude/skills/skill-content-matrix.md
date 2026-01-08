# Skill: Content Matrix System

## Purpose

Design and operate a comprehensive content production system that transforms brand strategy into executable, cross-platform content workflows. This skill enables the creation of Notion-based content hubs that manage ideation, production, scheduling, and publishing across all social platforms and long-form content.

---

## Core Philosophy

**One Idea → Multiple Platforms → Maximum Reach**

Content should flow from a central idea pool into platform-specific executions, each optimized for its native format while maintaining brand consistency. The system tracks every piece from brainstorm to publication.

---

## Content Matrix Architecture

### System Structure

```
[Brand] Content Matrix (Parent Page)
│
├── 📋 Style Framework (reference page)
│   └── Brand-specific content styles (3-6 styles)
│
├── 📊 Topic Generator (database)
│   └── Brainstorm backlog for content themes
│
├── 📊 Master Ideas (database)
│   └── Central idea pool with platform assignments
│
├── 📁 Platform Content (section)
│   ├── 📊 X/Twitter Content
│   ├── 📊 Instagram Content
│   ├── 📊 TikTok Content
│   ├── 📊 LinkedIn Content
│   ├── 📊 Facebook Content
│   └── 📊 Long-form/Blog Content
│
├── 📅 Weekly Schedule (calendar view)
│   └── Cross-platform publishing calendar
│
└── 📊 Analytics Tracker (database)
    └── Performance tracking per piece
```

---

## Style Framework

### Default: The 4 E's Framework

| Style | Purpose | Energy | Best For |
|-------|---------|--------|----------|
| **[Challenge]** | Provoke thought, disrupt assumptions | High intensity | Hot takes, contrarian views, industry critiques |
| **[Educate]** | Teach, share knowledge, build authority | Informative | How-tos, tips, frameworks, tutorials |
| **[Entertain]** | Engage, amuse, be relatable | Light, fun | Memes, stories, behind-scenes, trends |
| **[Empathise]** | Connect emotionally, show understanding | Warm, human | Personal stories, struggles, celebrations |

### Custom Style Framework Template

Brands can define 3-6 custom styles:

```
Style Name: [Custom Name]
Color: [Notion color for visual coding]
Purpose: [What this style accomplishes]
Tone: [Voice characteristics]
Use When: [Situations that call for this style]
Examples: [2-3 example content pieces]
Frequency: [Recommended % of content mix]
```

### Style Distribution Guidelines

| Posting Frequency | Recommended Mix |
|-------------------|-----------------|
| 7/week (1/day) | 2 Educate, 2 Entertain, 2 Challenge, 1 Empathise |
| 14/week (2/day) | 4 Educate, 4 Entertain, 3 Challenge, 3 Empathise |
| 21/week (3/day) | 6 Educate, 6 Entertain, 5 Challenge, 4 Empathise |

**Principle:** Never post same style back-to-back. Alternate to maintain variety.

---

## Database Schemas

### Topic Generator Database

| Property | Type | Purpose |
|----------|------|---------|
| Topic | Title | Topic/theme name |
| Category | Select | Content pillar alignment |
| Potential | Select | High/Medium/Low opportunity |
| Write This | Checkbox | Flag for immediate action |
| Notes | Text | Context and angles |
| Source Ideas | Relation | Links to Ideas created from this topic |

### Master Ideas Database

| Property | Type | Purpose |
|----------|------|---------|
| Idea | Title | Core idea description |
| Style | Select | Content style tag |
| Topic | Relation | Link to Topic Generator |
| Status | Select | Idea → Approved → In Production → Published |
| Priority | Select | High/Medium/Low |
| Platforms | Multi-select | X, Instagram, TikTok, LinkedIn, Facebook, Blog |
| Platform Content | Relation | Links to platform-specific executions |
| Created | Date | When idea was captured |
| Notes | Text | Angles, hooks, references |

### Platform Database Schema (Template)

Each platform database follows this base schema with platform-specific additions:

**Base Properties (All Platforms):**

| Property | Type | Purpose |
|----------|------|---------|
| Title | Title | Content title/hook |
| Source Idea | Relation | Link to Master Ideas |
| Style | Select | Content style (inherited or overridden) |
| Status | Select | Platform-specific workflow |
| Scheduled Date | Date | Publishing date/time |
| Published URL | URL | Link to live post |
| Performance | Select | Viral/Strong/Average/Weak |
| Notes | Text | Platform-specific notes |

---

## Platform-Specific Configurations

### X/Twitter

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | Single tweet, Thread, Quote tweet, Reply chain |
| Media | Select | Text only, Image, Video, GIF, Poll |
| Hook Type | Select | Question, Bold statement, Stat, Story opener, Controversial |
| Thread Length | Number | Number of tweets (if thread) |

**Status Workflow:**
`Idea → Draft → Review → Scheduled → Published → Analyzing`

**Best Practices:**
- Threads: 5-15 tweets, strong hook, clear CTA at end
- Single tweets: <280 chars, punchy, shareable
- Best times: 8-10am, 12-1pm, 5-6pm (audience timezone)

### Instagram

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | Carousel, Single image, Reel, Story, Live |
| Aspect Ratio | Select | 1:1 (Feed), 4:5 (Portrait), 9:16 (Reel/Story) |
| Slides | Number | Number of carousel slides |
| Caption Length | Select | Short (<100), Medium (100-300), Long (300+) |
| CTA | Select | Link in bio, DM me, Comment, Save this, Share |
| Hashtag Set | Multi-select | Predefined hashtag groups |

**Status Workflow:**
`Idea → Script/Copy → Design → Review → Scheduled → Published → Analyzing`

**Best Practices:**
- Carousels: 5-10 slides, educational content performs best
- Reels: 15-30 seconds optimal, hook in first 1.5s
- Caption: Front-load value, CTA at end

### TikTok

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | Tutorial, Trend, Storytelling, Behind-scenes, Duet, Stitch |
| Duration | Select | <15s, 15-30s, 30-60s, 1-3min |
| Sound | Select | Original, Trending audio, Voiceover, No sound |
| Hook Strategy | Text | First 3 seconds description |
| Trend Reference | URL | Link to trend being used |

**Status Workflow:**
`Idea → Script → Filming → Editing → Review → Scheduled → Published → Analyzing`

**Best Practices:**
- Hook viewers in first 1-3 seconds
- Native, authentic feel outperforms polished
- Leverage trending sounds within 48-72 hours of trend

### LinkedIn

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | Text post, Document/Carousel, Article, Video, Poll, Newsletter |
| Tone | Select | Professional, Thought leadership, Personal story, Industry insight |
| Target Audience | Select | Executives, Peers, Juniors, Industry-wide |
| CTA | Select | Connect, Comment, Share, Visit link, Follow |

**Status Workflow:**
`Idea → Draft → Review → Scheduled → Published → Engaging → Analyzing`

**Best Practices:**
- First line is everything (hook before "see more")
- Personal stories with professional insights perform best
- Engage in comments for 30-60 min after posting

### Facebook

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | Text, Image, Video, Link share, Live, Reel, Story |
| Audience | Select | Page followers, Group, Boosted/Ads |
| Engagement Type | Select | Discussion, Announcement, Resource share |

**Status Workflow:**
`Idea → Draft → Review → Scheduled → Published → Analyzing`

### Long-form/Blog

**Additional Properties:**

| Property | Type | Options |
|----------|------|---------|
| Format | Select | How-to, Listicle, Opinion, Case study, Interview, Ultimate guide |
| Word Count | Select | 500-1000, 1000-2000, 2000-3500, 3500+ |
| SEO Keyword | Text | Primary target keyword |
| Secondary Keywords | Text | Supporting keywords |
| Meta Description | Text | SEO meta description |
| Repurpose To | Multi-select | Platforms to break down into |
| Internal Links | Number | Links to other content |

**Status Workflow:**
`Idea → Outline → Draft → Edit → SEO Review → Published → Repurposing → Analyzing`

**Repurposing Matrix:**

| Blog Section | X/Twitter | Instagram | TikTok | LinkedIn |
|--------------|-----------|-----------|--------|----------|
| Key points | Thread | Carousel | Summary video | Text post |
| Stats/Data | Single tweet | Infographic | Stat reveal | Data post |
| Story/Example | Story thread | Story slides | Storytime | Personal post |
| How-to steps | Numbered thread | Tutorial carousel | Tutorial reel | Document |

---

## Weekly Schedule Framework

### Schedule View Structure

Cross-platform calendar showing:
- Day/Time slots
- Platform icons
- Content style color coding
- Status indicators

### Sample Weekly Rhythm (14 posts/week)

| Day | AM Slot | PM Slot |
|-----|---------|---------|
| Monday | X [Challenge] | Instagram [Empathise] |
| Tuesday | LinkedIn [Educate] | TikTok [Entertain] |
| Wednesday | X [Entertain] | Instagram [Challenge] |
| Thursday | LinkedIn [Empathise] | X [Educate] |
| Friday | TikTok [Educate] | Instagram [Entertain] |
| Saturday | X [Entertain] | TikTok [Empathise] |
| Sunday | Blog [Educate] | X [Challenge] |

**Scheduling Principles:**
1. Never same style back-to-back on same platform
2. Spread platforms throughout day
3. Match content style to time (educational AM, entertaining PM)
4. Heavier posting Tuesday-Thursday
5. Lighter weekend (unless audience is active)

---

## Workflow Integration

### Ideation Flow

```
1. Topic Generator
   └── Brainstorm themes aligned with content pillars

2. Master Ideas
   └── Capture specific content ideas
   └── Tag with style + potential platforms

3. Platform Assignment
   └── Create linked entries in platform databases
   └── Adapt idea for each platform's native format
```

### Production Flow

```
1. Platform Database Entry
   └── Status: "Idea"

2. Content Creation
   └── vibe-marketer drafts content
   └── Status: "Draft"

3. Review
   └── Brand voice check
   └── Status: "Review"

4. Scheduling
   └── Assign to Weekly Schedule
   └── Status: "Scheduled"

5. Publishing
   └── Post to platform
   └── Add Published URL
   └── Status: "Published"

6. Analysis
   └── Track performance
   └── Status: "Analyzing"
   └── Feed insights back to strategy
```

### vibe-marketer Integration

The vibe-marketer agent should:

1. **Read from Notion:**
   - Pull ideas marked for production
   - Check platform requirements
   - Note style and brand voice guidelines

2. **Write to Notion:**
   - Draft content directly in platform databases
   - Update status as work progresses
   - Add notes on creative decisions

3. **Post-publication:**
   - Mark as published
   - Add live URL
   - Trigger performance tracking

---

## Create vs Update Logic

### Detection

When `/content-matrix` runs:

1. Search Notion for "[Brand Name] Content Matrix"
2. If found → Update Mode
3. If not found → Create Mode

### Create Mode

- Create parent page with full structure
- Create all databases with schemas
- Set up relations between databases
- Create style framework page
- Populate sample entries as templates

### Update Mode

- Check for missing databases (new platforms)
- Add missing properties to existing databases
- Update style framework if changed
- Preserve existing content
- Add new template entries if needed

---

## Quality Checklist

Before creating a Content Matrix:

- [ ] Brand name confirmed
- [ ] Content pillars defined (from /content-strategy)
- [ ] Style framework chosen (4 E's or custom)
- [ ] Posting frequency determined
- [ ] Active platforms identified
- [ ] Team access/permissions clarified

After Content Matrix creation:

- [ ] All databases created with correct schemas
- [ ] Relations properly linked
- [ ] Style framework documented
- [ ] Sample entries added as templates
- [ ] Weekly schedule view configured
- [ ] vibe-marketer can access workspace

---

## Anti-Patterns

1. **Content without strategy** - Don't create matrix before content pillars exist
2. **Too many platforms** - Start with 2-3, expand as capacity grows
3. **Ignoring native formats** - Don't copy-paste across platforms
4. **Style monotony** - Enforce variety through schedule
5. **No feedback loop** - Always track performance and iterate
6. **Orphaned ideas** - Every idea should either be produced or archived
7. **Manual everything** - Leverage automation where possible

---

## Output Artifacts

When this skill is applied:

1. **Notion Workspace** - Complete content matrix structure
2. **Style Guide** - Brand-specific style framework documentation
3. **Schedule Template** - Weekly posting rhythm
4. **Database Views** - Kanban, calendar, and table views configured
5. **Workflow Documentation** - How team should use the system
