---
name: feature-priority-zh
description: 功能优先级排序助手。输入需求列表，使用 RICE 或 MoSCoW 框架自动评估优先级，输出可直接用于排期的优先级矩阵。
version: "1.0.0"
license: MIT
metadata:
  author: AgiWish
  tags: [pm, priority, feature, rice, moscow, 优先级, 排期]
  category: product
  platforms: [claude-code, cursor, cli]
---

# 功能优先级排序 (feature-priority-zh)

## When to Use

- "这些需求怎么排优先级"、"帮我评估一下哪个先做"
- 需求池积压，需要客观框架决策
- 和研发对齐排期前需要明确优先级
- `/feature-priority-zh [需求列表]`

## Quick Reference

```
/feature-priority-zh [需求描述列表]

可选参数：
  --method=RICE     # 用 RICE 评分（适合量化决策，默认）
  --method=MoSCoW   # 用 MoSCoW 分类（适合快速分层）
  --method=ICE      # 用 ICE 评分（Impact / Confidence / Ease）
  --context=[背景]  # 提供业务目标，帮助校准权重
```

## Procedure

1. **了解背景**（如未提供，追问）
   - 当前最重要的业务目标是什么？
   - 团队规模和研发资源？
   - 有没有硬性截止时间或里程碑？

2. **RICE 评分输出**

```markdown
## 功能优先级矩阵（RICE）

**业务目标**：[本期最重要的目标]
**评分说明**：R=Reach(影响用户数) I=Impact(影响程度1-5) C=Confidence(置信度%) E=Effort(人周)

| 功能 | R | I | C | E | RICE分 | 优先级 | 备注 |
|------|---|---|---|---|--------|--------|------|
| [功能A] | 5000 | 4 | 80% | 2 | 8000 | 🔴 P0 | [理由] |
| [功能B] | 2000 | 3 | 60% | 1 | 3600 | 🟡 P1 | |
| [功能C] | 500  | 5 | 40% | 4 | 250  | 🟢 P2 | |

RICE 分 = R × I × C ÷ E

**建议排期**：
- P0（本期必做）：功能A
- P1（本期尽量）：功能B
- P2（下期规划）：功能C

**需要讨论的假设**：
- [影响评分的关键不确定因素]
```

3. **MoSCoW 分类输出**（--method=MoSCoW）

```markdown
## MoSCoW 优先级分类

**Must Have（必须有，否则产品无法发布）**
- [功能]：[原因]

**Should Have（应该有，重要但可以延后）**
- [功能]：[原因]

**Could Have（可以有，时间允许则做）**
- [功能]：[原因]

**Won't Have（本期不做）**
- [功能]：[原因，何时重新评估]
```

## Pitfalls

- RICE 分数只是辅助，不是答案——强依赖性需求要人工调整
- Effort 估算要让研发确认，不要 PM 自己拍
- 评分假设要透明，方便后续复盘

## Verification

- [ ] 评分维度有明确定义
- [ ] 关键假设已列出（方便质疑和复盘）
- [ ] 强依赖关系已在备注标注
- [ ] 建议排期可以直接用于和研发对齐
