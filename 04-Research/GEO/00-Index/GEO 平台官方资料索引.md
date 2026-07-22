---
type: source-index
domain: GEO
source_scope: platform-official
tags:
  - topic/geo
  - topic/platform-official
---

# GEO 平台官方资料索引

## 使用边界

平台官方资料用于研究平台公开机制与接口，包括联网搜索、来源展示、爬虫、开发者生态和智能体/插件能力。

不能据此直接推断：

- GEO 排名效果
- 品牌被推荐概率
- 引用提升幅度
- 平台内部排序、召回或引用算法

## 索引

- [[GEO 海外 AI 平台官方资料索引]]
- [[GEO 国内 AI 平台官方资料索引]]
- [[GEO 平台机制对照表]]
- [[GEO 联网搜索与引用机制观察]]
- [[GEO 平台官方声明与行业解读差异]]

## 资料卡片聚合

```dataview
TABLE platform, region, evidence_level, official_or_ecosystem
FROM "04-Research/GEO/Sources/Platform-Official"
SORT region ASC, platform ASC
```

