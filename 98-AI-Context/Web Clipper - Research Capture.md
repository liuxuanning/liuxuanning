---
type: workflow
system: capture
tags:
  - workflow/web-clipper
---

# Web Clipper - Research Capture

## Target Folder

`00-Inbox/Downloaded`

## Template

```markdown
---
title: "{{title}}"
source: "{{url}}"
author: "{{author}}"
published: "{{published}}"
captured: "{{date}}"
status: raw
primary_category:
topics: []
tags:
  - status/raw
  - source/web
---

# {{title}}

## Source

- URL: {{url}}
- Author: {{author}}
- Published: {{published}}
- Captured: {{date}}

## Original Content

{{content}}
```

## Rule

剪藏时只保存原文和来源信息，不在剪藏阶段做总结。

