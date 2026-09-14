# LLM Wiki 协议

## 目标

项目内 LLM Wiki 是由 LLM 维护的 Markdown 知识层。它把有长期价值的 source、分析、用户确认、产品判断、研究材料、代码理解、失败复盘和 open questions 编译成可查询、可更新、可交叉引用的项目知识。

真实知识库放在当前项目的 `docs/llm-wiki/`。Skill 目录只保存这份维护协议。

## 核心模型

-   Raw sources: 事实来源。可以是文件、URL、PDF、截图、会议记录、用户提供文本或代码分析结果。
-   Wiki pages: LLM 维护的综合页面，用于 summary、entity、concept、decision、comparison、workflow、retrospective、evaluation、open question、analysis。
-   Schema: 当前项目的维护约定，定义目录、frontmatter、命名、链接、ingest、query、lint 和写回策略。

Ingest 以长期价值为边界，主题保持开放。Source acquisition 以用户意图、权限、隐私、版权和项目范围为边界。

## Raw Source 粒度

Raw source 不限于单个文件。只要 scope 清楚、来源可追溯、用户意图允许，以下都可以登记为 raw source：

-   单个文件、目录、附件、截图、PDF、网页或数据集。
-   整个 skill 目录、整个项目快照、仓库历史片段、release diff 或代码库检查结果。
-   当前对话中有长期价值的用户确认、需求、约束、决策、纠错和验收标准。
-   一组外部资料、GitHub prototype 搜索结果或竞品观察，只要记录查询方式、观察日期、筛选标准和适用范围。

`raw/sources.md` 是 source registry，不是唯一 raw 容器。短 source 可以只在 `sources.md` 登记；较长材料、对话摘要、项目快照、外部研究结果、截图说明或批量来源可以放到 `raw/` 下新文件，再在 `sources.md` 登记路径和摘要。按需创建目录，例如：

```text
raw/
├── sources.md
├── conversations/
│   └── YYYY-MM-DD-<topic>.md
├── external/
│   └── <source-or-topic>.md
└── project-snapshots/
    └── YYYY-MM-DD-<scope>.md
```

登记大粒度 source 时不要把全部内容复制进综合页面。记录 source id、范围、时间、来源、访问方式、置信度和摘要；raw 文件保存必要摘录、结构化摘要、筛选标准或观察记录；pages 只提炼会改变未来行动的结论。对话作为 source 时优先提炼用户确认和决策，不保存寒暄、临时推理、调试噪声、敏感信息或未授权内容。

## 目录

最小结构：

```text
docs/llm-wiki/
├── index.md
└── log.md
```

资料持续积累时再扩展：

```text
docs/llm-wiki/
├── index.md
├── log.md
├── schema.md
├── raw/
│   └── sources.md
└── pages/
    └── ...
```

按需创建文件，让空页面保持为待办项而非占位文件。

## 最小初始化

`index.md`:

```markdown
# LLM Wiki Index

Use this wiki before tasks that depend on project memory or reusable knowledge.

## Pages

- `log.md`: Chronological record of ingests, queries, and lint passes.

## Read Policy

Read this index first, then only task-relevant pages.
```

`log.md`:

```markdown
# LLM Wiki Log

## [YYYY-MM-DD] init | project wiki

- Created: `index.md`, `log.md`
- Purpose:
- Open questions:
```

## 读取

任务依赖项目记忆、历史判断、研究资料、产品决策、代码理解或用户确认时：

1.  先读 `docs/llm-wiki/index.md`。
2.  读取任务相关页面和必要 raw source。
3.  沿链接读取一阶相邻页面；全量读取用于用户明确要求、大批量整理、发布前检查或严重冲突排查。

## Ingest

适合进入 wiki 的内容：

-   用户确认的目标用户、产品判断、约束、验收标准和取舍。
-   需求文档、会议记录、访谈、客户反馈、运营观察。
-   文章、论文、书籍章节、课程笔记、播客/视频摘要、网页。
-   竞品、市场、商业模式、定价、案例、尽调材料。
-   代码库理解、架构决策、接口契约、工具边界、部署经验、测试策略。
-   Prompt/context/Agent Harness 决策、失败样例、评估标准、回归用例。
-   Query 产生的比较表、综合分析、关系发现和 open questions。
-   图片、截图、图表、设计稿、PDF、表格的摘要和稳定路径。

Source acquisition 检查：

-   用户提供、上传、粘贴或指向的资料可按任务读取。
-   用户当前对话、整个项目、整个 skill 或仓库 diff 可以作为 raw source 单元登记，但要写清 scope、时间边界和哪些部分被用于综合。
-   公开资料研究要记录来源、访问日期和置信度。
-   登录态、付费内容、客户资料、个人敏感信息、公司内部资料和受版权/保密约束的 source，先确认保存方式。
-   Raw source 可读取；长期登记、摘要和写回还要通过价值判断。

Ingest 流程：

1.  识别 source：标题、来源、日期、作者/提供者、可信度、适用范围。
2.  登记 raw：短 source 可直接在 `raw/sources.md` 记录路径、URL、摘要和访问方式；较长 source 可新建 `raw/` 子文件保存摘要、摘录、筛选标准或观察记录，再在 `sources.md` 登记。
3.  读 `index.md`，定位受影响页面。
4.  更新相关 pages，覆盖新增、修正、冲突、待确认问题和被替代结论。
5.  更新 `index.md`。
6.  追加 `log.md`。

## 写回权限

直接写回：

-   用户要求建立、维护、更新或整理 LLM Wiki。
-   当前任务产生明确长期价值：产品判断、用户确认、source summary、架构理解、验证结论、open question、修复模式。
-   Wiki 中存在过时路径、命名、断链、状态、引用或与用户最新指令冲突的结论。
-   新资料挑战旧结论，需要标记 `disputed`、`superseded` 或追加 contradiction。

先确认：

-   批量 ingest 外部资料、会议记录、聊天记录、网页、PDF 或代码分析结果。
-   涉及个人、客户、公司、商业、医疗、财务、法律等敏感信息。
-   创建大量页面、重组目录、修改 schema 或改变长期分类体系。
-   将聊天中的推理、偏好或判断长期固化为项目知识。
-   保存外部 source 的本地快照、图片、附件或大段摘录。

保持在聊天中：

-   临时命令输出、调试噪声、机械 diff 复述、寒暄和一次性执行细节。
-   缺少 source provenance 的重要事实。
-   低置信推测；需要保留时写成 open question 或 hypothesis。
-   secrets、token、密码、未脱敏隐私数据和未授权信息。

## Query

需要项目记忆的问题按这个流程：

1.  读 `index.md`，再读相关页面和必要 raw source。
2.  回答中区分 confirmed facts、current inference、needs confirmation。
3.  有长期价值的新综合、比较、决策、检查清单或 open questions，写回 wiki 或建议写回。
4.  高价值 query 写回后追加 `log.md`。

写回聊天内容时提炼为页面更新、决策记录、source summary、analysis 或 open question。

## Lint

周期性或重大 ingest 后做 scoped lint：

-   断链、孤立页面、重复页面、过期页面。
-   高频概念缺少独立页面。
-   新 source 挑战旧结论，但页面缺少 contradiction。
-   页面缺少 source、更新时间、状态或置信度。
-   `index.md` 与实际 pages 的同步状态。
-   `open-questions.md` 长期停滞。

确定性检查交给工具或文本扫描；LLM 负责矛盾、过时结论、缺失概念和薄弱综合等语义判断。

## 页面模板

```yaml
---
type: concept | entity | decision | source-summary | comparison | workflow | retrospective | evaluation | open-question | analysis
status: active | draft | disputed | superseded | archived
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources:
  - raw/sources.md#source-id
confidence: low | medium | high
tags: []
---
```

```markdown
# <Page Title>

## Summary

## Key Points

## Evidence

## Links

## Open Questions

## Change Notes
```

## 冲突块

```markdown
### Contradiction

Status: unresolved | resolved | accepted-contextual
Severity: soft | scope-mismatch | hard
New source:
Old claim:
Why it conflicts:
Resolution:
User decision:
```

`soft` 表示可共存并补充条件差异；`scope-mismatch` 表示适用范围存在差异；`hard` 表示直接矛盾，需要用户确认或保持 unresolved。

## 质量检查

-   记录能改变下次行动。
-   重要 claim 链接到 source、evidence、文件、测试、用户确认或日志。
-   每条结论保留适用范围。
-   被新资料推翻的页面标记 `superseded`、`disputed` 或写出变更说明。
-   用户新指令优先，并同步更新过时 wiki 内容。
-   连续跨项目复用的经验可提炼为 skill 通用规则。
