# 开源项目借鉴记录

用于 GitHub 项目、开源 prototype、开源库和公开实现方案的产品化借鉴。

## 主动搜索时机

Brainstorming 阶段只要公开实现可能改变产品方案、技术路线、UI 模式、Agent/Harness 设计或评估方式，就主动搜索 GitHub。不要等用户明确说“去 GitHub 搜”；用户明确禁止联网、任务只是本地小改、或隐私/合规不允许时才跳过。

常见触发：

-   新 AI 产品、MVP、重大功能、Agent/RAG/workflow、API-backed feature 或复杂 UI。
-   技术栈、目录结构、部署路径、数据处理、streaming、tool calling、evaluation 还不确定。
-   用户提到类似产品、竞品、开源、prototype、最佳实践，或需要“看看别人怎么做”。

## 搜索流程

1.  用 2-4 组查询词组合产品方向、核心技术词和实现形态，例如 `ai agent <domain>`, `<domain> rag app`, `<workflow> open source`, `<feature> github`.
2.  优先筛选最近仍可读、README 清楚、license 可见、issue/activity 合理、目录结构有参考价值的项目。
3.  选 2-5 个项目即可，避免链接堆砌。
4.  只吸收产品思路、架构模式、UX 流程、evaluation 方法和工程组织。直接复用代码或依赖前必须检查 license、维护状态、兼容性、安全风险和适配成本。
5.  对长期有价值的搜索，把查询方式、观察日期、筛选标准和结论登记到 `docs/llm-wiki/raw/sources.md` 和相关 wiki page。

## 写入位置

-   Source 登记：`docs/llm-wiki/raw/sources.md`，记录链接、license、查看日期、摘要和可信度。
-   长期分析：`docs/llm-wiki/pages/`，使用 `source-summary`、`comparison`、`decision` 或 `analysis` 页面。
-   一次性查阅：在当前任务中引用即可。

## 记录模板

```markdown
# 开源项目借鉴：<功能或方向>

## Sources

| 项目 | 链接 | License | 查看日期 | 参考价值 |
| --- | --- | --- | --- | --- |
| <名称> | <URL> | <许可证> | <YYYY-MM-DD> | <产品或架构价值> |

## Ideas

### <思路名称>

- 产品价值：
- 技术特点：
- 架构模式：
- 适配方式：
- 采用前验证：

## Product Impact

- 用户体验：
- AI 行为：
- Prompt/context：
- Evaluation：
- 工程结构：
- 依赖、license、安全风险：

## Decision

- 推荐：
- 下一步：
- 风险：
```

## 记录规则

-   记录可复用 idea、来源、适用边界和验证项。
-   区分“借鉴思路”和“直接引入依赖”。
-   直接复用代码或依赖前，记录 license、维护状态、兼容性、安全风险和项目适配成本。
-   对可复用分析，同步更新 `docs/llm-wiki/index.md` 和 `docs/llm-wiki/log.md`。
