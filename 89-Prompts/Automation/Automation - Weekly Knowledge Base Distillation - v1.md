---
type: prompt
system: automation
status: active
created: 2026-07-22
tags:
  - system/prompts
  - workflow/audit
  - workflow/compile
  - topic/knowledge-base
---

# Automation - Weekly Knowledge Base Distillation - v1

## Purpose

每周五让 Codex 自动审计并编译 Obsidian 知识库，生成一份可复盘的周度蒸馏报告。报告统一保存到根目录下的 `每周蒸馏` 文件夹，方便后续人工查看、确认和继续处理。

## When to Use

- Codex 自动化每周五定时执行。
- 需要检查本周新增资料、研究更新、Topic Hub 状态、输出回流和知识库健康度。
- 需要一份“只读审计 + 编译建议”报告，而不是无人值守地大规模改动知识库。

## Inputs

- Vault root: `D:\其他\学习\个人知识库`
- Operating mechanism: `98-AI-Context/知识库迭代机制.md`
- Weekly checklist: `98-AI-Context/每周审计与编译清单.md`
- Topic Hub template: `90-Templates/Topic Hub Template.md`
- Topic Hub folder: `98-AI-Context/Topic Hubs`
- Main review folders:
  - `00-Inbox`
  - `04-Research`
  - `05-Content`
  - `06-Projects`
  - `89-Prompts`
  - `97-AI-Memory`
  - `98-AI-Context`

## Prompt

你是 Codex，正在维护一个 Obsidian 个人知识库。请每周五基于本地知识库执行一次“周度知识库审计与编译”。

工作目录固定为：

`D:\其他\学习\个人知识库`

请先读取并遵守以下文件：

- `AGENTS.md`
- `98-AI-Context/知识库迭代机制.md`
- `98-AI-Context/每周审计与编译清单.md`
- `90-Templates/Topic Hub Template.md`

本次任务的目标是：只读审计、知识编译、生成报告。默认不要修改、移动、删除任何已有笔记；不要批量删除文件或目录；不要使用递归删除命令；不要输出或保存任何密钥、Token、Webhook URL 等敏感信息。如果发现需要移动、删除、重命名或批量整理的事项，只写入“需要人工确认”。

请执行以下步骤：

1. 确认当前日期，使用 `YYYY-MM-DD` 作为本周报告日期。
2. 确保根目录存在 `每周蒸馏` 文件夹；如果不存在，可以创建这个文件夹。
3. 扫描本周需要关注的文件夹：
   - `00-Inbox`
   - `04-Research`
   - `05-Content`
   - `06-Projects`
   - `89-Prompts`
   - `97-AI-Memory`
   - `98-AI-Context`
4. 重点检查：
   - `00-Inbox/Downloaded` 和 `00-Inbox/Cleaned` 是否有待处理资料。
   - `04-Research` 是否有本周新增或修改的研究笔记。
   - `98-AI-Context/Topic Hubs` 是否有空 Hub、过期 Hub、缺少反向链接的 Hub。
   - `05-Content` 和 `06-Projects` 是否有可回流到研究、记忆或上下文的内容。
   - `97-AI-Memory` 是否有需要新增的长期偏好、稳定决策、成功经验或失败教训。
   - 是否存在孤立 Markdown、重复文件名、空目录、无来源结论、疑似敏感信息。
5. 按照“原始层、清洗层、研究层、内容层、项目层、记忆层、上下文层”的逻辑，判断本周知识库状态。
6. 生成一份 Markdown 报告，保存为：

`每周蒸馏/YYYY-MM-DD_知识库每周蒸馏.md`

报告必须包含以下结构：

```markdown
---
type: weekly-distillation
system: knowledge-base
date: YYYY-MM-DD
status: review-needed
tags:
  - system/knowledge-base
  - workflow/audit
  - workflow/compile
---

# YYYY-MM-DD 知识库每周蒸馏

## 1. 本周概览

- 本周新增或修改的重点区域：
- 本周最值得关注的主题：
- 本周知识库总体状态：

## 2. Inbox 清理建议

| 文件 | 状态 | 建议去向 | 理由 |
|---|---|---|---|

## 3. 研究编译

### 本周新增有效知识

- 

### 可沉淀为研究笔记的内容

- 

### 证据不足或需要复核

- 

## 4. Topic Hub 更新建议

| Hub | 当前问题 | 建议更新 | 优先级 |
|---|---|---|---|

## 5. 输出回流建议

| 来源 | 可回流内容 | 建议位置 | 是否需要人工确认 |
|---|---|---|---|

## 6. 知识库健康检查

- 孤立 Markdown：
- 重复文件名：
- 空目录：
- 缺少来源的结论：
- 可能过期的笔记：
- 敏感信息检查：

## 7. 本周建议处理队列

### 高优先级

- 

### 中优先级

- 

### 低优先级

- 

## 8. 下周编译重点

- 

## 9. 自动化执行边界

- 本次没有删除文件。
- 本次没有批量移动文件。
- 本次没有改写原始资料。
- 涉及删除、迁移、重命名、长期记忆写入的事项，均需人工确认后再执行。
```

7. 如果没有发现明显变化，也要生成报告，并在“本周概览”中写明“本周无重大变化”，同时列出下周建议关注点。
8. 完成后，在回复中只给出报告文件路径、最重要的 3 条发现、以及是否存在需要人工确认的事项。

## Output Format

Codex 最终回复保持简短：

```markdown
已完成本周知识库蒸馏，报告已保存到：

`D:\其他\学习\个人知识库\每周蒸馏\YYYY-MM-DD_知识库每周蒸馏.md`

最重要的 3 条发现：
1. 
2. 
3. 

需要人工确认：
- 有 / 无
```

## Quality Checklist

- [ ] 报告文件保存在 `每周蒸馏` 文件夹。
- [ ] 文件名包含本周日期。
- [ ] 没有删除文件。
- [ ] 没有批量移动文件。
- [ ] 没有泄露密钥、Token、Webhook URL。
- [ ] 报告区分了事实、建议、待确认事项。
- [ ] 每条重要建议尽量指向具体文件或目录。
- [ ] 即使无变化，也生成一份可追溯报告。

## Related Topics

- [[Obsidian Hub]]
- [[Workflow Hub]]
- [[Prompt Hub]]
- [[AI News Hub]]
- [[GEO Hub]]
