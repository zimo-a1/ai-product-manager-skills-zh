# AI 产品经理 10 个独立 Skill

面向中国大陆互联网产品团队的 AI 产品经理工作流。仓库中的 10 个 Skill 相互独立，按产品流程节点分别使用，不要求每次全部调用。

## 一、完整流程对应关系

| 产品节点 | 使用 Skill | 为什么用 | 什么时候用 |
|---|---|---|---|
| 1. 想法模糊、需求入口 | `ai-collaboration-calibration` | 先判断问题是否定义正确，避免一上来就做错功能 | 用户说“我有个想法”“老板提了个需求”“感觉哪里不对”“方案越来越复杂” |
| 2. 用户问题研究 | `user-research-zh` | 把访谈、问卷、客服反馈、投诉整理成痛点、用户分层和机会点 | 新产品立项、重大改版、用户反馈很多但没有结论时 |
| 3. AI 场景判断 | `identifying-ai-product-scenarios` | 判断问题是否真的适合 AI，还是规则、BI、RPA、人工更合适 | 想做 AI 客服、AI 助手、AI 审核、AI 推荐等，但还没确定是否值得做 |
| 4. 竞品与市场分析 | `ai-product-competitive-analysis` | 分析竞品定位、功能、用户流程、AI 能力、定价和市场空白 | 新赛道探索、产品定位、竞品冲击、写 PRD 前需要外部依据时 |
| 5. 产品决策与取舍 | `product-decision-agent` | 综合用户、竞品、业务目标、资源和风险，明确当前做什么、不做什么 | 资源不足、需求冲突、临时插需求、增长停滞、指标异常、跨部门无法拍板时 |
| 6. 需求优先级与版本范围 | `feature-priority-zh` | 用 RICE、ICE、MoSCoW 把需求排成 P0/P1/P2，方便排期和研发对齐 | 需求池积压、版本规划、MVP 定范围、研发资源有限时 |
| 7. 常规产品 PRD | `prd-writer-zh` | 把需求整理成业务、功能、边界、异常、验收、埋点和上线计划 | 已经决定要做，需要输出普通功能 PRD 时 |
| 8. AI 专项 PRD | `ai-prd` | 补充模型选型、Prompt、RAG、评测集、成本、稳定性、灰度和安全策略 | 产品确定包含大模型、Agent、RAG、AI 生成或 AI 审核时 |
| 9. 研发设计与 AI 产品落地 | `pm-skill` | 把用户流程落到 AI 职责、Agent、工具、上下文、Prompt、UI 和验证机制 | PRD 通过后，进入技术方案、原型、Agent 流程、接口和实际开发时 |
| 10. PRD 业务评审 | `prd-review` | 检查业务逻辑、状态、权限、数据关系、异常流程、跨模块影响和可测试性 | PRD 交给设计、研发、测试前；重大改版或上线前复审时 |

## 二、推荐的实际调用顺序

```text
需求想法
  ↓
协作校准
  ↓
用户调研 + 竞品分析
  ↓
AI 场景判断
  ↓
产品决策
  ↓
优先级与 MVP 范围
  ↓
常规 PRD
  ↓
AI 专项 PRD
  ↓
PRD 评审
  ↓
研发设计与落地
  ↓
评测、灰度、上线
  ↓
用户反馈与数据复盘
  ↓
重新进入产品决策和迭代
```

其中：

1. `user-research-zh` 和 `ai-product-competitive-analysis` 通常可以并行。
2. `prd-writer-zh` 和 `ai-prd` 不建议重复写两份完整 PRD。普通产品先用 `prd-writer-zh`，AI 功能再用 `ai-prd` 补模型、Prompt、评测和灰度部分。
3. `product-decision-agent` 负责拍板和取舍，`pm-skill` 负责方案落地，两者贯穿多个阶段。

## 三、10 个独立 Skill

| 目录 | 用途 |
|---|---|
| [`ai-collaboration-calibration`](ai-collaboration-calibration/) | 协作校准、问题定义和假设挑战 |
| [`user-research-zh`](user-research-zh/) | 用户访谈、问卷和反馈洞察整理 |
| [`identifying-ai-product-scenarios`](identifying-ai-product-scenarios/) | AI 与非 AI 方案判断、可行性和 MVP 评估 |
| [`ai-product-competitive-analysis`](ai-product-competitive-analysis/) | AI 产品竞品、定位、功能和商业模式分析 |
| [`product-decision-agent`](product-decision-agent/) | 中国大陆互联网产品、运营和项目决策 |
| [`feature-priority-zh`](feature-priority-zh/) | RICE、ICE、MoSCoW 优先级排序 |
| [`prd-writer-zh`](prd-writer-zh/) | 常规产品 PRD 生成 |
| [`ai-prd-skill`](ai-prd-skill/) | AI 专项 PRD、Prompt、评测和上线策略；Skill 名称显示为 `ai-prd` |
| [`pm-skill`](pm-skill/) | AI 产品方案设计、研发协作和落地 |
| [`prd-review`](prd-review/) | PRD 业务逻辑、权限、状态和测试性评审 |

## 四、按场景选择

### 新做一个 AI 产品

```text
ai-collaboration-calibration
→ user-research-zh
→ ai-product-competitive-analysis
→ identifying-ai-product-scenarios
→ product-decision-agent
→ feature-priority-zh
→ prd-writer-zh
→ ai-prd
→ prd-review
→ pm-skill
```

### 迭代已有 AI 功能

```text
user-research-zh
→ product-decision-agent
→ feature-priority-zh
→ ai-prd
→ prd-review
→ pm-skill
```

### 普通互联网功能，不涉及 AI

```text
user-research-zh
→ product-decision-agent
→ feature-priority-zh
→ prd-writer-zh
→ prd-review
```

## 五、安装单个 Skill

使用 Codex Skill Installer 时，可以按目录单独安装，例如：

```bash
python install-skill-from-github.py \
  --repo <你的 GitHub 用户名>/ai-product-manager-skills-zh \
  --path product-decision-agent
```

每个目录都包含独立的 `SKILL.md`；部分 Skill 还包含自己的 `references/`、`agents/`、`scripts/` 或 `assets/` 支持文件。
