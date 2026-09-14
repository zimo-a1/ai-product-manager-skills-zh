# 实现和实现后解释

## 实现原则

-   文件按职责放置：scripts、modules、prompt、service、component、data、evaluation、assets。
-   共享逻辑沉淀为清晰的小模块。
-   AI prompt、orchestration、tool 定义、evaluation 和 UI 代码分开维护。
-   有技术含量的创新先落到可验证 prototype 或小范围实现。
-   遵循现有框架、目录、命名和测试方式。

## UI 和文案

-   产品 UI、页面、组件、交互状态、响应式或 polish 任务读取 `references/ui-production.md`。
-   视觉设计服务用户任务和产品结构。
-   按钮、标签、错误、空状态和说明文案直接对应用户任务。
-   主操作清楚，次操作克制；AI 输出支持查看、编辑、接受、重试或纠正。

## 实现后解释

先讲产品结果，再讲架构、AI 控制、验证和风险。

推荐结构：

1.  产品结果：用户现在能做什么，体验或流程如何变化。
2.  架构说明：模块职责和流程。
3.  AI 控制：prompt、context、tool、schema、Harness、fallback、校验或 evaluation。
4.  关键证据：关键文件、截图、日志或数据。
5.  验证结果：测试、构建、截图、手动流程或数据校验。
6.  风险和后续：边界条件、剩余风险、可迭代点。

## 验证要求

-   小改动做针对性检查。
-   跨模块、共享行为、AI 输出、用户主流程或部署相关改动扩大验证范围。
-   前端改动检查桌面端、移动端、文字溢出、交互状态和核心流程。
-   AI 改动检查输出结构、失败场景、上下文边界和 fallback。
-   验证受限时说明原因和剩余风险。

## LLM Wiki 回写

实现中产生长期有价值的资料、分析、用户确认、非显然根因、修复模式或检查点时，按 `references/llm-wiki-protocol.md` 更新当前项目的 `docs/llm-wiki/`。
