---
type: topic-hub
topic:
status: active
owner:
last_compiled:
compile_cycle: weekly
tags:
  - system/topic-hub
---

# Topic Hub

## Scope

- This hub covers:
- This hub does not cover:
- Primary folders:

## Current Thesis

Write the current best understanding in 3-5 bullets. Each bullet should link to at least one source note or research note when possible.

## Key Questions

- What do I need to understand next?
- What assumptions need evidence?
- What decisions or content could this topic support?

## Canonical Notes

- 

## Source Layer

Raw or lightly cleaned captures that should not be treated as final conclusions.

```dataview
LIST
FROM "04-Research"
WHERE contains(file.tags, "topic/example")
SORT file.mtime DESC
```

## Compiled Knowledge

Reusable research notes, summaries, frameworks, and evidence-backed conclusions.

```dataview
LIST
FROM "04-Research"
WHERE contains(file.tags, "topic/example")
WHERE status != "raw"
SORT file.mtime DESC
```

## Outputs And Decisions

- Related projects:
- Related content:
- Decisions made:
- Reusable prompts or workflows:

## Gaps And Review Queue

- Missing source:
- Conflicting claims:
- Stale note:
- Needs synthesis:

## Weekly Compile Log

| Date | Inputs Reviewed | Updates Made | Follow Up |
|---|---:|---|---|
|  |  |  |  |

## Content Opportunities

- 
