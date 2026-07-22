---
type: evidence-standard
domain: GEO
evidence_level:
  - system/evidence-standard
  - derived-from-platform-source-index
evidence_status: active
last_reviewed: 2026-07-22
source_basis:
  - GEO 平台官方资料索引
  - GEO 国内 AI 平台官方资料索引
  - GEO 海外 AI 平台官方资料索引
tags:
  - topic/geo
  - system/research
  - topic/platform-official
---

# GEO 证据分级标准

## 来源链

- [[GEO 平台官方资料索引]]：用于汇总本标准当前覆盖的平台资料范围。
- [[GEO 国内 AI 平台官方资料索引]]：用于区分国内平台官方资料、云产品资料、帮助中心和生态资料。
- [[GEO 海外 AI 平台官方资料索引]]：用于区分海外平台官方帮助中心、开发者文档和搜索平台资料。
- [[GEO 平台官方声明与行业解读差异]]：用于定义官方声明与市场推论之间的边界。
- [[GEO 联网搜索与引用机制观察]]：用于定义联网搜索、来源展示、API、智能体和爬虫等观察维度。

## 当前适用范围

- 适用于 GEO、Generative Search、AI Citation、Platform Official 相关公开资料。
- 适用于研究笔记、平台资料索引、内容方案引用时的证据标注。
- 不适用于客户私有测试样本、内部项目数据或未获授权资料。

## 本标准自身的证据等级

- `system/evidence-standard`：本文件是知识库内部证据分级规则，不是一手平台资料。
- `derived-from-platform-source-index`：当前规则来自已整理的平台官方资料索引和机制观察笔记。
- 使用限制：本标准只能用于判断来源性质，不能单独证明任何 GEO 效果。

## 证据标签

- `evidence/global-platform-official`
- `evidence/domestic-platform-official`
- `evidence/domestic-platform-ecosystem`
- `evidence/domestic-media`
- `evidence/domestic-vendor`
- `evidence/domestic-market-claim`
- `evidence/global-academic`
- `evidence/global-industry-media`
- `evidence/global-vendor`
- `evidence/global-market-claim`

## 判定规则

- 平台官网、官方帮助中心、官方开发者文档、官方云产品页，标为平台官方。
- 平台生态里的开发者社区投稿，默认不算官方结论，标为平台生态。
- 媒体报道平台能力，标为媒体。
- 服务商文章、白皮书、榜单、案例，标为厂商材料或市场主张。
- 市场规模、排名、ROI、增长率、转化提升等数字类资料，默认标为 market claim。
- 本阶段不做真实平台测试，也不设置真实测试类证据标签。

## 已使用样例

| 证据标签 | 当前样例 | 可支持的结论 | 不可直接支持的结论 |
|---|---|---|---|
| `evidence/global-platform-official` | [[OpenAI Help - ChatGPT Search]]、[[OpenAI Platform - OpenAI crawlers]]、[[Google Search Central - AI features and your website]]、[[Perplexity Help - How does Perplexity work]] | 平台公开说明的搜索、来源展示、爬虫或 AI features 规则 | GEO 排名效果、引用概率、转化提升 |
| `evidence/domestic-platform-official` | [[百度搜索帮助中心 - 网页搜索帮助]]、[[腾讯云 - 联网搜索 API]]、[[千问 AI 平台 - 联网搜索]]、[[文心智能体平台 - 平台简介]]、[[DeepSeek 官方资料 - API 与联网搜索]]、[[火山方舟 - Web Search 与联网内容插件]] | 国内平台公开说明的产品能力、API、智能体、搜索入口或联网内容插件 | 品牌一定进入答案、推荐链路或排名提升 |
| `evidence/domestic-platform-ecosystem` | 开发者社区投稿、平台生态文章、第三方接入教程 | 后续补源线索、生态观察 | 平台官方结论 |
| `evidence/domestic-market-claim` / `evidence/global-market-claim` | 服务商白皮书、榜单、案例、效果数字 | 市场叙事、产品机会、待验证假设 | 官方机制事实或通用效果承诺 |

## 使用边界

证据等级表示来源性质，不表示结论一定正确。

- 官方资料优先用于证明“平台怎么公开描述自己”，不直接证明“企业怎么获得效果”。
- 生态资料和行业解读可以帮助发现问题，但不能替代官方资料。
- 任何效果性表述都需要额外证据，至少应标注为假设、厂商主张或待验证结论。
- 后续如果纳入真实测试样本，需要单独设计测试证据标签，并与公开资料证据分开管理。
