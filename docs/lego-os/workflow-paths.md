# Workflow Paths

LEGO Agent OS provides multiple workflow paths based on your starting point and goals. This document helps you choose the right path and understand what each workflow involves.

---

## Workflow Selection Matrix

Use this matrix to quickly identify your workflow path:

| You Have | You Want | Path | Entry Command |
|----------|----------|------|---------------|
| An idea, unclear problem/solution | Validated product concept | Path A | `/product-discovery` |
| Validated product, no brand | Brand foundations | Path B | `/brand-discovery` |
| Existing brand, need content | Content at scale | Path C | `/content-strategy` |
| Specs ready, need software | Working application | Path D | `/ralph-plan` |
| Smart contract requirements | Deployed contract | Path E | `/workflow-smart-contract` |

---

## Path A: Product Discovery

**Start here if:** You have an idea but haven't validated the problem or solution.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         PATH A: PRODUCT DISCOVERY                        │
│                     "I have an idea, help me clarify it"                 │
└─────────────────────────────────────────────────────────────────────────┘

                              /product-discovery
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │  @ideation-facilitator │
                         │                       │
                         │  Phase 1: Problem     │
                         │  Phase 2: Solution    │
                         │  Phase 3: Market Fit  │
                         │  Phase 4: Feasibility │
                         │  Phase 5: Vision      │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │ product-ideation-     │
                         │ brief.md              │
                         └───────────┬───────────┘
                                     │
              ┌──────────────────────┼──────────────────────┐
              │                      │                      │
              ▼                      ▼                      ▼
     ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
     │ Product         │   │ Brand           │   │ Technical       │
     │ Validated?      │   │ Needed?         │   │ Assessment?     │
     │                 │   │                 │   │                 │
     │ → Path B        │   │ → Path B        │   │ → @senior-      │
     │   /brand-       │   │   /brand-       │   │   architect     │
     │   discovery     │   │   discovery     │   │   assessment    │
     └─────────────────┘   └─────────────────┘   └─────────────────┘
```

### What You'll Discover
- **Problem Space**: Is this a real problem? Who has it? How painful is it?
- **Solution Hypothesis**: What's your solution? How does it solve the problem?
- **Market Fit**: Who are your early adopters? What's the market size?
- **Feasibility**: Can you build it? What are the technical requirements?
- **Vision**: Where does this lead in 3-5 years?

### Next Steps After Path A
| Discovery Result | Recommended Path |
|-----------------|------------------|
| Problem validated, ready for brand | Path B: `/brand-discovery` |
| Need more user research | `@user-researcher` study |
| Need market validation | `@research-analyst` analysis |
| Ready to build MVP | Path D: `/ralph-plan` |

---

## Path B: Brand Discovery

**Start here if:** You have a validated product but no brand identity or strategy.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         PATH B: BRAND DISCOVERY                          │
│                "I have a product, help me articulate my brand"           │
└─────────────────────────────────────────────────────────────────────────┘

                              /brand-discovery
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │  @brand-facilitator    │
                         │                       │
                         │  Phase 1: Origin      │
                         │  Phase 2: Positioning │
                         │  Phase 3: Purpose     │
                         │  Phase 4: Customer    │
                         │  Phase 5: Onliness    │
                         │  Phase 6: Commitment  │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │ brand-discovery-      │
                         │ brief.md              │
                         └───────────┬───────────┘
                                     │
              ┌──────────────────────┼──────────────────────┐
              │                      │                      │
              ▼                      ▼                      ▼
     ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
     │ Full Strategy   │   │ Verbal Identity │   │ Visual Identity │
     │                 │   │                 │   │                 │
     │ /brand-strategy │   │ /verbal-        │   │ /visual-        │
     │                 │   │  identity       │   │  identity       │
     │ @brand-         │   │                 │   │                 │
     │  strategist     │   │ @verbal-        │   │ @visual-        │
     │                 │   │  identity-      │   │  designer       │
     │                 │   │  designer       │   │                 │
     └────────┬────────┘   └────────┬────────┘   └────────┬────────┘
              │                      │                      │
              └──────────────────────┴──────────────────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │ Complete Brand System │
                         │                       │
                         │ → Path C: Content     │
                         │ → Path D: Software    │
                         │ → Launch: GTM         │
                         └───────────────────────┘
```

### What You'll Discover
- **Origin & Context**: Why does this brand exist? What's the founder's story?
- **Positioning**: What category? Who's the competition? What's different?
- **Purpose (VPVMG)**: Vision, Purpose, Values, Mission, Goals
- **Customer Design**: Who are they? Who do they BECOME?
- **Onliness Statement**: "Our brand is the ONLY ___ that ___"
- **Brand Commitment Matrix**: How does the brand serve customers at each level?

### Next Steps After Path B
| Discovery Result | Recommended Path |
|-----------------|------------------|
| Ready for full strategy | `/brand-strategy` |
| Need verbal identity first | `/verbal-identity` |
| Need visual identity first | `/visual-identity` |
| Need archetype analysis | `/archetype-analysis` |
| Ready for content | Path C: `/content-strategy` |

---

## Path C: Content Production

**Start here if:** You have an established brand and need content at scale.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                       PATH C: CONTENT PRODUCTION                         │
│              "I have a brand, help me create content at scale"           │
└─────────────────────────────────────────────────────────────────────────┘

              Prerequisites:
              ├── brand-strategy.md
              ├── verbal-identity-system.md
              └── visual-identity-brief.md (optional)

                             /content-strategy
                                    │
                                    ▼
                        ┌───────────────────────┐
                        │  @content-strategist  │
                        │                       │
                        │  • Content Pillars    │
                        │  • Editorial Calendar │
                        │  • Content Types      │
                        │  • Distribution Plan  │
                        └───────────┬───────────┘
                                    │
                                    ▼
                        ┌───────────────────────┐
                        │ content-strategy.md   │
                        └───────────┬───────────┘
                                    │
         ┌──────────────────────────┼──────────────────────────┐
         │                          │                          │
         ▼                          ▼                          ▼
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│ Social Media    │       │ Copywriting     │       │ Marketing       │
│                 │       │                 │       │                 │
│ /social-        │       │ @copywriter     │       │ /campaign-plan  │
│  strategy       │       │                 │       │                 │
│                 │       │ Long-form,      │       │ /gtm-strategy   │
│ @social-media-  │       │ short-form,     │       │                 │
│  manager        │       │ email, web      │       │ @marketing-     │
│                 │       │                 │       │  strategist     │
└────────┬────────┘       └────────┬────────┘       └────────┬────────┘
         │                          │                          │
         ▼                          ▼                          ▼
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│ Platform-       │       │ Content         │       │ Campaign        │
│ specific posts  │       │ assets          │       │ execution       │
└─────────────────┘       └─────────────────┘       └─────────────────┘
```

### What You'll Create
- **Content Strategy**: Pillars, themes, calendar, distribution
- **Social Strategy**: Platform-specific content plans
- **Copy Assets**: Headlines, body copy, CTAs, email sequences
- **Campaign Plans**: Integrated marketing campaigns

### Supporting Agents
| Agent | Purpose |
|-------|---------|
| `@content-strategist` | Overall content architecture |
| `@copywriter` | Written content creation |
| `@social-media-manager` | Platform-specific social content |
| `@vibe-marketer` | Rapid trend-native content |
| `@community-manager` | Community engagement content |

---

## Path D: Website/App Development

**Start here if:** You have specs and need to build software.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      PATH D: WEBSITE/APP DEVELOPMENT                     │
│                 "I have specs, help me build the software"               │
└─────────────────────────────────────────────────────────────────────────┘

              Prerequisites:
              ├── brand-strategy.md (optional but recommended)
              ├── verbal-identity-system.md (optional but recommended)
              └── Product requirements or feature specs

                    ┌─────────────────────────────────┐
                    │     Choose Your Entry Point     │
                    └───────────────┬─────────────────┘
                                    │
              ┌─────────────────────┼─────────────────────┐
              │                     │                     │
              ▼                     ▼                     ▼
     ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
     │ Autonomous Dev  │   │ Guided Dev      │   │ Single Feature  │
     │                 │   │                 │   │                 │
     │ /ralph-plan     │   │ /spec-and-plan  │   │ /implement-     │
     │                 │   │                 │   │  feature        │
     └────────┬────────┘   └────────┬────────┘   └────────┬────────┘
              │                     │                     │
              ▼                     ▼                     ▼
     ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
     │ PRD.md +        │   │ spec.md +       │   │ Direct          │
     │ progress.txt    │   │ implementation  │   │ implementation  │
     │                 │   │ plan            │   │                 │
     │ Run Ralph       │   │                 │   │                 │
     │ autonomously    │   │ Step-by-step    │   │ Interactive     │
     │                 │   │ guidance        │   │ coding          │
     └────────┬────────┘   └────────┬────────┘   └────────┬────────┘
              │                     │                     │
              └─────────────────────┴─────────────────────┘
                                    │
                                    ▼
                         ┌───────────────────────┐
                         │     Quality Gates     │
                         │                       │
                         │ /code-review          │
                         │ /security-review      │
                         │ /architecture-review  │
                         └───────────────────────┘
```

### Entry Point Comparison

| Approach | Command | Best For | Output |
|----------|---------|----------|--------|
| **Autonomous** | `/ralph-plan` | Large features, greenfield projects | PRD.md for Ralph Loop |
| **Guided** | `/spec-and-plan` | Complex features needing oversight | Detailed spec + plan |
| **Direct** | `/implement-feature` | Small, well-defined features | Working code |

### Development Agents

| Phase | Agents |
|-------|--------|
| Planning | `@ralph-loop-architect`, `@senior-architect`, `@product-manager` |
| Implementation | `@backend-engineer`, `@solidity-protocol-engineer` |
| Review | `@pragmatic-code-reviewer`, `@security-reviewer`, `@design-reviewer` |

### Quality Gates
All software paths should pass through review gates:
1. `/code-review` — Code quality and maintainability
2. `/security-review` — Security assessment
3. `/architecture-review` — For significant changes

---

## Path E: Smart Contract Development

**Start here if:** You need to build and deploy secure smart contracts.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     PATH E: SMART CONTRACT DEVELOPMENT                   │
│               "I need to build secure smart contracts"                   │
└─────────────────────────────────────────────────────────────────────────┘

                          /workflow-smart-contract
                                    │
                                    ▼
                         ┌───────────────────────┐
                         │   Phase 1: Design     │
                         │                       │
                         │   @senior-architect   │
                         │   @defi-risk-engineer │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   Phase 2: Implement  │
                         │                       │
                         │   @solidity-protocol- │
                         │    engineer           │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   Phase 3: Review     │
                         │                       │
                         │   /smart-contract-    │
                         │    review             │
                         │                       │
                         │   Security patterns   │
                         │   Gas optimization    │
                         │   Economic risks      │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   Phase 4: Audit      │
                         │                       │
                         │   /smart-contract-    │
                         │    audit              │
                         │                       │
                         │   Formal verification │
                         │   Threat modeling     │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   Phase 5: Deploy     │
                         │                       │
                         │   Testnet → Mainnet   │
                         │   Monitoring setup    │
                         └───────────────────────┘
```

### What This Path Covers
- **Mechanism Design**: Economic incentives, game theory considerations
- **Security Patterns**: Reentrancy guards, access control, upgradability
- **Gas Optimization**: Efficient storage, loop optimization
- **Risk Assessment**: Economic attack vectors, regulatory considerations
- **Formal Auditing**: Comprehensive security review

### Smart Contract Agents

| Agent | Focus |
|-------|-------|
| `@solidity-protocol-engineer` | Implementation, testing |
| `@defi-risk-engineer` | Economic risks, mechanism design |
| `@security-auditor` | Security review, threat modeling |

---

## Combining Paths

Paths can be combined sequentially for complete project lifecycles:

### Full Brand + Software Launch
```
Path A → Path B → Path D → Path C
   │         │        │        │
   ▼         ▼        ▼        ▼
Product → Brand → Software → Content
Ideation   Strategy   Build     Marketing
```

### Brand Refresh + Content
```
Path B → Path C
   │        │
   ▼        ▼
Brand → Content
Discovery  Production
```

### DeFi Protocol Launch
```
Path A → Path E → Path B → Path C
   │        │        │        │
   ▼        ▼        ▼        ▼
Protocol → Smart    → Brand → Marketing
Design     Contracts
```

---

## Decision Tree Summary

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      WHICH PATH SHOULD I TAKE?                           │
└─────────────────────────────────────────────────────────────────────────┘

                    Is your product validated?
                              │
               ┌──────────────┴──────────────┐
               │                             │
              NO                            YES
               │                             │
               ▼                             ▼
        ┌─────────────┐              Is your brand defined?
        │   PATH A    │                      │
        │  /product-  │         ┌────────────┴────────────┐
        │  discovery  │         │                         │
        └─────────────┘        NO                        YES
                                │                         │
                                ▼                         ▼
                         ┌─────────────┐         What do you need?
                         │   PATH B    │                  │
                         │  /brand-    │     ┌────────────┼────────────┐
                         │  discovery  │     │            │            │
                         └─────────────┘   Content    Software    Contracts
                                             │            │            │
                                             ▼            ▼            ▼
                                      ┌─────────┐  ┌─────────┐  ┌─────────┐
                                      │ PATH C  │  │ PATH D  │  │ PATH E  │
                                      │/content-│  │/ralph-  │  │/workflow│
                                      │strategy │  │plan     │  │-smart-  │
                                      │         │  │         │  │contract │
                                      └─────────┘  └─────────┘  └─────────┘
```

---

## Related Documentation

- [Getting Started](../getting-started.md) — Entry point guide
- [Overview](overview.md) — System architecture
- [Agents](agents.md) — All available agents
- [Commands](commands.md) — All available commands
- [Facilitator Layer](facilitator-layer.md) — Discovery phase details
