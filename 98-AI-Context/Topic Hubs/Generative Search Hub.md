# Generative Search Hub

## Definition

Generative Search 指由大模型、联网搜索、检索增强和来源展示共同构成的搜索/答案体验。

## Research Questions

- 平台如何公开描述联网搜索？
- 平台是否展示来源、引用或结果列表？
- 平台是否提供搜索 API、智能体或插件接入？
- 行业解读如何把平台能力包装成 GEO 方法论？

## Related Tags

- `topic/generative-search`
- `topic/web-search`
- `topic/ai-citation`
- `topic/geo`

```dataview
LIST
FROM "04-Research/GEO"
WHERE contains(file.tags, "topic/generative-search") OR contains(file.tags, "topic/web-search")
SORT file.mtime DESC
```

