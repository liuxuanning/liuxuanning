---
type: project-status
project: Horizon
status: active
tags:
  - project/horizon
  - topic/ai-news
  - topic/mcp
  - topic/content-creation
---

# Horizon Project Status

## 当前状态

本地已有 Horizon 项目资料，定位偏向 AI 博主信息雷达、AI 新闻筛选、信息源聚合、MCP 集成和内容选题输入。

## 已完成事项

- 已存在 Horizon 项目目录。
- 已存在本地使用说明、README、MCP 文档和配置文档。
- 已纳入本知识库项目状态系统。

## 待办事项

- 检查 `.env` 是否只保留本地密钥，不进入公开同步。
- 明确日更/周更信息雷达的输出格式。
- 将高价值信息源沉淀到 `04-Research/Information-Sources`。
- 将可复用流程沉淀到 `97-AI-Memory/Workflows.md`。

## 下一步

先跑 2-3 天样例日报，观察信息质量、重复率、选题价值，再微调来源权重。

## 风险

- API Key、Webhook、Token 不应提交到 GitHub。
- 当前 Vault 被上一级 Git 仓库包裹，GitHub 同步前需要修正仓库边界。
- README 文件存在终端显示乱码迹象，后续应检查文件编码。

## 决策

- Horizon 暂时作为内容选题和信息源系统项目管理。
- 研究结论进入 Research，执行状态留在 Projects。

