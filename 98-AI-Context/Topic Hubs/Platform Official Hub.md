---
type: topic-hub
topic: platform-official
status: active
owner:
last_compiled: 2026-07-22
compile_cycle: weekly
tags:
  - system/topic-hub
  - topic/platform-official
  - evidence/global-platform-official
  - evidence/domestic-platform-official
---

# Platform Official Hub

## Scope

- This hub covers: 平台官网、官方帮助中心、官方开发者文档、官方云产品页、官方协议和平台生态资料。
- This hub does not cover: 第三方营销解读、无法确认来源的截图、未经验证的测试结论、客户私有数据。
- Primary folders: `04-Research/GEO/Sources/Platform-Official`、`04-Research/GEO/00-Index`。

## Current Thesis

- 平台官方资料是当前 GEO/Generative Search 研究中证据等级最高的一层，适合确认平台公开机制、接口、规则和边界；索引参见 [[GEO 平台官方资料索引]]。
- 官方资料只能证明平台“公开说明了什么”，不能自动证明某类内容会获得引用、排名或推荐；边界参见 [[GEO 平台官方声明与行业解读差异]]。
- 国内外平台资料需要分开管理，因为帮助中心、开发者文档、云产品页和生态资料的证据等级不同；入口参见 [[GEO 国内 AI 平台官方资料索引]]、[[GEO 海外 AI 平台官方资料索引]]。
- 生态资料可以作为线索，但必须标注为 ecosystem，不能与 official 等同；判断规则参见 [[GEO 证据分级标准]]。

## Key Questions

- 每个平台最权威的官方入口是哪一个：帮助中心、开发者文档、协议、云产品页，还是生态文档？
- 当前资料能证明的是搜索机制、抓取规则、来源展示、API 能力，还是仅仅证明产品存在？
- 哪些资料还只是“待补官方源”，需要人工或后续检索确认？
- 官方表述与行业解读之间有哪些常见跳跃，需要在内容或方案里提醒？

## Canonical Notes

- [[GEO 平台官方资料索引]]
- [[GEO 国内 AI 平台官方资料索引]]
- [[GEO 海外 AI 平台官方资料索引]]
- [[GEO 平台官方声明与行业解读差异]]
- [[GEO 证据分级标准]]
- [[Google Search Central - AI features and your website]]
- [[OpenAI Help - ChatGPT Search]]
- [[OpenAI Platform - OpenAI crawlers]]
- [[Perplexity Help - How does Perplexity work]]
- [[Perplexity Help - Pro Search]]
- [[DeepSeek 官方资料 - API 与联网搜索]]
- [[火山方舟 - Web Search 与联网内容插件]]

## Source Layer

Raw or lightly cleaned captures that should not be treated as final conclusions.

```dataview
TABLE platform, region, evidence_level, official_or_ecosystem
FROM "04-Research/GEO/Sources/Platform-Official"
SORT region ASC, platform ASC
```

## Compiled Knowledge

Reusable research notes, summaries, frameworks, and evidence-backed conclusions.

```dataview
LIST
FROM "04-Research/GEO/00-Index"
WHERE contains(file.tags, "topic/platform-official") OR contains(file.tags, "evidence/global-platform-official") OR contains(file.tags, "evidence/domestic-platform-official")
SORT file.mtime DESC
```

## Outputs And Decisions

- Related projects: 可作为 GEO 研究、平台机制判断、内容策略建议的证据底座。
- Related content: 可产出“官方文档读法”“哪些说法能被官方资料支持”“平台机制证据分级”。
- Decisions made: 平台官方资料用于研究公开机制与接口，不用于证明 GEO 排名、引用或推荐效果。
- Reusable prompts or workflows: 采集平台资料时必须记录 source、platform、region、evidence_level、official_or_ecosystem，并与索引页互链。

## Gaps And Review Queue

- Missing source: DeepSeek 与火山方舟已补直接官方源；仍需补豆包 C 端 App 官方帮助中心、来源展示/引用说明，以及 DeepSeek 最新联网搜索/来源展示/API 搜索说明。
- Conflicting claims: 官方文档常描述功能能力，行业文章常转写成运营效果；需要在每次引用时标注推论边界。
- Stale note: 平台帮助中心和开发者文档更新频率高，建议每周复核最近使用的官方源。
- Needs synthesis: 将 Source Layer 的官方资料抽象成统一字段：平台、地区、资料类型、证明内容、不能证明内容、可用于哪类输出。

## Weekly Compile Log

| Date | Inputs Reviewed | Updates Made | Follow Up |
|---|---:|---|---|
| 2026-07-22 | 16 篇平台官方源笔记、平台官方资料索引、周度蒸馏报告 | 补齐 Hub 模板结构，明确 official 与 ecosystem 的证据边界 | 已补 DeepSeek 与火山方舟官方源；后续完善资料类型字段 |

## Content Opportunities

- 平台官方资料在 GEO 研究中的正确用法。
- 为什么官方资料不能直接证明“排名效果”。
- 国内 AI 平台官方资料的可用性和缺口清单。
