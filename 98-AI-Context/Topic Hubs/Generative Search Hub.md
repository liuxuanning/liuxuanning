---
type: topic-hub
topic: generative-search
status: active
owner:
last_compiled: 2026-07-22
compile_cycle: weekly
tags:
  - system/topic-hub
  - topic/generative-search
  - topic/web-search
  - topic/ai-citation
  - topic/geo
---

# Generative Search Hub

## Scope

- This hub covers: 大模型生成答案中的联网搜索、检索增强、来源展示、引用、搜索 API、智能体搜索能力和答案引擎体验。
- This hub does not cover: 泛 AI 新闻、传统搜索排名技巧、未经验证的 GEO 效果承诺、平台黑箱推测。
- Primary folders: `04-Research/GEO/00-Index`、`04-Research/GEO/Sources/Platform-Official`、`98-AI-Context/Topic Hubs`。

## Current Thesis

- Generative Search 的核心不是单一搜索框，而是“检索/浏览 + 大模型生成 + 来源呈现”的组合体验；机制观察参见 [[GEO 联网搜索与引用机制观察]]。
- 不同平台公开能力差异较大：有的平台强调搜索结果和来源，有的平台强调 API、智能体或内容抓取规则；对照入口参见 [[GEO 平台机制对照表]]。
- 官方资料适合用来确认平台公开能力边界，但不适合直接推导内容一定会被引用；边界参见 [[GEO 平台官方声明与行业解读差异]]。
- Generative Search 是 GEO 研究的上游机制层，GEO 更偏内容可见性与运营落地，两者需要关联但不能混用。

## Key Questions

- 平台如何决定何时搜索、搜索什么、如何展示来源？
- 平台是否区分网页搜索、内部知识库、API 搜索、智能体检索和浏览器式抓取？
- 来源展示是答案生成的一部分，还是附加的搜索结果说明？
- 哪些平台资料能转化为内容生产规范，哪些只能作为机制背景？

## Canonical Notes

- [[GEO 联网搜索与引用机制观察]]
- [[GEO 平台机制对照表]]
- [[GEO 平台官方资料索引]]
- [[GEO 海外 AI 平台官方资料索引]]
- [[GEO 国内 AI 平台官方资料索引]]
- [[GEO 平台官方声明与行业解读差异]]

## Source Layer

Raw or lightly cleaned captures that should not be treated as final conclusions.

```dataview
LIST
FROM "04-Research/GEO/Sources/Platform-Official"
WHERE contains(file.tags, "topic/web-search") OR contains(file.tags, "topic/generative-search") OR contains(file.tags, "topic/ai-citation")
SORT file.mtime DESC
```

## Compiled Knowledge

Reusable research notes, summaries, frameworks, and evidence-backed conclusions.

```dataview
LIST
FROM "04-Research/GEO/00-Index"
WHERE contains(file.tags, "topic/generative-search") OR contains(file.tags, "topic/web-search") OR contains(file.tags, "topic/ai-citation")
SORT file.mtime DESC
```

## Outputs And Decisions

- Related projects: 可支撑 GEO 研究、AI 新闻雷达的信息源判断、内容平台机制观察。
- Related content: 可产出“AI 搜索如何展示来源”“联网搜索和答案引用有什么区别”“平台官方文档怎么读”。
- Decisions made: 本 Hub 只沉淀公开机制，不把机制观察直接写成效果承诺。
- Reusable prompts or workflows: 后续研究平台时，优先抽取搜索触发、来源展示、API/智能体入口、爬取规则、证据等级。

## Gaps And Review Queue

- Missing source: 需要继续补充 DeepSeek、豆包/火山引擎等国内平台的直接官方资料。
- Conflicting claims: “联网搜索”“引用来源”“推荐品牌”“GEO 排名”经常被混用，需要在每篇研究笔记中拆开表述。
- Stale note: 平台联网搜索能力可能高频变化，建议每周复核官方帮助中心和开发者文档。
- Needs synthesis: 将各平台的搜索触发、来源展示、API/智能体能力整理成一张稳定对照表。

## Weekly Compile Log

| Date | Inputs Reviewed | Updates Made | Follow Up |
|---|---:|---|---|
| 2026-07-22 | GEO 机制观察、平台机制对照、官方资料索引、周度蒸馏报告 | 补齐 Hub 模板结构，明确 Generative Search 与 GEO 的上下游关系 | 补充各平台“搜索/引用/来源展示”字段定义 |

## Content Opportunities

- 一篇文章讲清楚：AI 搜索、联网搜索、答案引用、GEO 不是一回事。
- 国内外 AI 平台来源展示方式对比。
- 如何从官方文档判断一个平台是否支持网页搜索或引用展示。
