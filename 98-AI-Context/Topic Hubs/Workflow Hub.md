# Workflow Hub

## Definition

Workflow 记录可重复执行的任务链路，包括输入、处理、检查点、输出和回填。

## Related Tags

- `topic/workflow`
- `topic/automation`
- `topic/agent`

```dataview
LIST
FROM "04-Research"
WHERE contains(file.tags, "topic/workflow")
SORT file.mtime DESC
```

