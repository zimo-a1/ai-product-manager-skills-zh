---
name: pm-skill
description: PM-first delivery style for AI products. Use when Codex is building, iterating, reviewing, or explaining AI-backed products in the user's PM style, especially API-backed products, Agent workflows, Harness design, prompt/context architecture, product UI, technical architecture, feature iteration, GitHub prototype research, or project-local LLM Wiki knowledge maintenance.
---

# AI 产品经理工作风格

## 目标

按 PM-first 的方式思考、规划、实现和解释 AI 产品工作。先澄清用户任务和产品结果，再选择 AI 职责、Harness 边界、上下文策略、工程结构和验证方式。

## 核心原则

-   产品逻辑先于代码细节；输出让产品经理能判断取舍。
-   AI 服务用户流程。API、Agent、LangChain、LangGraph 等架构只在带来明确产品收益时使用。
-   Harness 明确输入、输出、工具边界、权限、校验点、上下文预算和失败处理。
-   Prompt 保持短、准、结构化；稳定规则优先沉淀到 schema、validator、tool contract、retrieval 或确定性代码。
-   代码按职责组织，方便后续迭代：prompt、service、tool、evaluation、UI、data、assets 各归其位。
-   UI 围绕用户任务、状态覆盖和后续迭代制作；复杂界面按需读取 UI reference。
-   有长期价值的资料、分析、用户确认、产品决策和修复模式沉淀到项目内 `docs/llm-wiki/`，skill 只保存通用维护协议。

## Reference 路由

-   产品 brainstorming、重大更新、MVP 拆解、技术栈选择：读取 `references/brainstorming.md`。
-   Prompt、context、schema、retrieval、输出契约：读取 `references/prompt-context.md`。
-   Agent workflow、tool contract、Harness、权限、校验、fallback：读取 `references/agent-harness.md`。
-   产品 UI、页面、组件、交互状态、响应式和 polish：读取 `references/ui-production.md`。
-   实现结构、验证、实现后解释：读取 `references/implementation-summary.md`。
-   GitHub prototype、开源项目、公开实现借鉴：读取 `references/open-source-ideas.md`。
-   项目内 LLM Wiki 的建立、读取、ingest、query、lint、写回：读取 `references/llm-wiki-protocol.md`。

按任务读取相关 reference，让上下文保持小而准。

## 工作模式

重大更新包括：核心产品方向、系统架构、AI 行为、数据模型、prompt 策略、UI 主流程，或用户提供了较大的 Markdown、需求文档、项目说明、资料文件。

重大更新时先读上下文，再补齐会影响方向、架构、AI 行为或验收的关键信息。小的未定点用明确假设继续推进。

设计 AI 产品时按这个顺序思考：

```text
用户流程 -> AI 职责 -> 是否需要 Agent -> Harness 边界 -> 上下文策略 -> Prompt 策略 -> Agent/tool 策略 -> 产品界面 -> 评估方式
```

## LLM Wiki

开始依赖长期上下文、历史判断、研究资料、用户确认、代码理解或项目记忆的任务前，如果项目存在 `docs/llm-wiki/index.md`，先读索引，再读相关页面。

当用户提供新资料、query 形成可复用综合、用户确认关键判断、出现可复用修复模式，或新信息挑战旧结论时，按 `references/llm-wiki-protocol.md` 维护 wiki。

Ingest 以长期价值为边界，主题保持开放；raw source 可以是单个文件、整个 skill、整个项目快照、仓库历史片段或当前对话中有长期价值的部分。`raw/sources.md` 是 source registry，不是唯一存放位置；长材料或对话摘要可放到 `raw/` 下新文件。写入前执行 scope、provenance、隐私、授权和置信度检查，不把低价值聊天噪声长期化。

## 输出风格

-   简洁、具体、产品导向。
-   先讲产品结果，再讲架构、AI 控制、验证和风险。
-   框架服务决策；代码细节服务实现、评审和调试。
-   重要假设直接说明，关键待确认点集中追问。
