---
type: topic-hub
topic: geo
status: active
owner:
last_compiled: 2026-07-22
compile_cycle: weekly
tags:
  - system/topic-hub
  - topic/geo
  - topic/generative-search
  - topic/ai-citation
---

# GEO Hub

## Scope

- This hub covers: 生成式 AI 回答、AI 搜索、答案引擎、来源展示、引用机制、内容可见性，以及这些机制对公开内容生产和研究方法的影响。
- This hub does not cover: 未经验证的平台测试样本、历史项目经验、客户私有数据、GEO 排名承诺、无法追溯来源的行业说法。
- Primary folders: `04-Research/GEO`、`04-Research/GEO/00-Index`、`04-Research/GEO/Sources/Platform-Official`、`每周蒸馏`。

## Current Thesis

- GEO 当前应先作为“生成式搜索与答案引用机制研究”，而不是直接作为排名优化承诺；边界参见 [[GEO 平台官方声明与行业解读差异]]。
- 公开平台资料能支持“平台如何描述搜索、爬取、引用、来源展示、API 或智能体能力”，但不能单独证明某内容会被推荐或引用；证据边界参见 [[GEO 证据分级标准]]。
- 本阶段最可靠的研究底座是平台官方资料索引和机制对照，而不是二手方法论；入口参见 [[GEO 平台官方资料索引]]、[[GEO 平台机制对照表]]。
- GEO 研究需要同时区分平台机制、内容来源、引用展示和行业解读，避免把“搜索可见”“答案引用”“品牌推荐”混成一个指标；相关观察参见 [[GEO 联网搜索与引用机制观察]]。

## Key Questions

- 各平台公开承认的搜索、浏览、爬取、引用和来源展示机制分别是什么？
- 哪些结论来自官方资料，哪些只是生态资料、行业观察或个人假设？
- GEO 能稳定转化为哪些内容生产要求、研究流程、客户沟通边界和验收指标？
- 国内平台资料中，哪些仍缺少官方源确认，需要继续补证？

## Canonical Notes

- [[GEO 行业研究总览]]
- [[GEO 平台官方资料索引]]
- [[GEO 国内 AI 平台官方资料索引]]
- [[GEO 海外 AI 平台官方资料索引]]
- [[GEO 平台机制对照表]]
- [[GEO 联网搜索与引用机制观察]]
- [[GEO 平台官方声明与行业解读差异]]
- [[GEO 证据分级标准]]

## Source Layer

Raw or lightly cleaned platform materials that should not be treated as final conclusions.

```dataview
TABLE region, platform, evidence_level, official_or_ecosystem
FROM "04-Research/GEO/Sources/Platform-Official"
SORT region ASC, platform ASC
```

## Compiled Knowledge

Reusable research notes, summaries, frameworks, and evidence-backed conclusions.

```dataview
LIST
FROM "04-Research/GEO/00-Index"
SORT file.mtime DESC
```

## Outputs And Decisions

- Related projects: 暂无正式项目页；后续如进入客户方案，应在 `06-Projects` 单独建项目状态页。
- Related content: 可从“平台机制对照”“官方声明与行业解读差异”“证据分级标准”派生行业观察、客户科普、方法论文章。
- Decisions made: 本 Hub 只聚合公开资料沉淀，不使用历史项目经验，不记录真实平台测试样本。
- Reusable prompts or workflows: [[2026-07-22 知识库每周蒸馏]] 中建议优先完成 GEO 官方源、证据等级和 Hub 闭环。

## Gaps And Review Queue

- Missing source: DeepSeek 与火山方舟已补直接官方源；仍需继续查找豆包 C 端 App 的官方帮助中心、来源展示/引用说明，以及 DeepSeek 最新联网搜索帮助中心或 API 搜索说明。
- Conflicting claims: 行业解读可能把“平台具备联网搜索”扩展为“可控制引用排名”，该推论需要单独证据支持。
- Stale note: 暂无因时间久远过期的 GEO 笔记；平台官方能力变化快，建议周度复核 Source Layer。
- Needs synthesis: 将 [[GEO 平台机制对照表]] 与 [[GEO 证据分级标准]] 合并成一套可供内容/方案使用的判断框架。

## Weekly Compile Log

| Date | Inputs Reviewed | Updates Made | Follow Up |
|---|---:|---|---|
| 2026-07-22 | 8 篇 GEO 索引笔记、16 篇平台官方源笔记、1 份周度蒸馏报告 | 补齐 Scope、Current Thesis、Key Questions、Canonical Notes、Source Layer、Compiled Knowledge、Outputs And Decisions、Gaps And Review Queue | DeepSeek 与火山方舟已补官方源；继续补豆包 C 端来源展示和 DeepSeek 最新搜索说明 |

## Content Opportunities

- 平台官方资料到底能证明什么，不能证明什么。
- GEO 与传统 SEO、AI 搜索、答案引用的边界。
- 国内外 AI 平台联网搜索与来源展示机制对照。
- 企业内容进入生成式搜索语境时，应该先补哪些证据型内容。
