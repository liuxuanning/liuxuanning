# GEO Hub

## Definition

GEO 是围绕生成式 AI 回答、AI 搜索、答案引擎、来源展示与内容可见性的行业研究方向。

本 Hub 只聚合市面公开资料沉淀，不使用历史项目经验，不记录真实平台测试样本。

## Research Index

- [[GEO 行业研究总览]]
- [[GEO 平台官方资料索引]]
- [[GEO 国内 AI 平台官方资料索引]]
- [[GEO 海外 AI 平台官方资料索引]]
- [[GEO 平台机制对照表]]
- [[GEO 证据分级标准]]

## Related Tags

- `topic/geo`
- `topic/generative-search`
- `topic/ai-citation`
- `topic/platform-official`
- `topic/web-search`
- `topic/web-search-api`

## Platform Official Sources

```dataview
TABLE region, platform, evidence_level, official_or_ecosystem
FROM "04-Research/GEO/Sources/Platform-Official"
SORT region ASC, platform ASC
```

## All GEO Notes

```dataview
LIST
FROM "04-Research/GEO"
WHERE contains(file.tags, "topic/geo")
SORT file.mtime DESC
```

