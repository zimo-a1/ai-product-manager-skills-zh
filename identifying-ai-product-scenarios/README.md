# AI Product Skills

一组面向 AI 产品经理和业务同事的 Codex skills，用来把常见 AI 产品工作流标准化。

业务同事安装后，不需要记命令，直接用自然语言提问即可。

## 应该安装什么

请安装 `skills/` 目录下的这些拆分版 skills：

```text
skills/
├── assessing-ai-scenarios/
├── writing-ai-prds/
├── planning-ai-mvps/
├── designing-ai-metrics/
└── checking-ai-acceptance/
```

根目录的 `SKILL.md` 是早期的“AI 场景识别”完整原稿，适合参考和继续迭代，不是推荐给业务同事安装的入口。

## 包含的 skills

| Skill | 用途 |
|---|---|
| `assessing-ai-scenarios` | 判断业务场景是否适合 AI、是否值得立项、该用 AI 还是非 AI |
| `writing-ai-prds` | 把 AI 产品想法、会议纪要或业务需求整理成 PRD |
| `planning-ai-mvps` | 把复杂 AI 需求收敛成可试点 MVP，明确先做和暂不做 |
| `designing-ai-metrics` | 设计 AI 产品指标、评测口径、验收阈值和护栏指标 |
| `checking-ai-acceptance` | 检查 AI 产品方案、PRD、MVP 或上线计划的验收缺口 |

## 安装

先克隆仓库：

```bash
git clone https://github.com/xihuishawpy/ai_product_skills.git
cd ai_product_skills
```

Windows PowerShell:

```powershell
.\install.ps1
```

macOS / Linux:

```bash
bash install.sh
```

安装后重启 Codex 或新开会话。

安装脚本会把 5 个正式 skill 复制到你的 Codex skills 目录：

- Windows: `%USERPROFILE%\.codex\skills`
- macOS / Linux: `~/.codex/skills`
- 如果设置了 `CODEX_HOME`，macOS / Linux 脚本会安装到 `$CODEX_HOME/skills`

## 手动安装

如果不想运行脚本，也可以手动复制。

Windows PowerShell:

```powershell
mkdir $env:USERPROFILE\.codex\skills -Force
Copy-Item .\skills\assessing-ai-scenarios $env:USERPROFILE\.codex\skills -Recurse -Force
Copy-Item .\skills\writing-ai-prds $env:USERPROFILE\.codex\skills -Recurse -Force
Copy-Item .\skills\planning-ai-mvps $env:USERPROFILE\.codex\skills -Recurse -Force
Copy-Item .\skills\designing-ai-metrics $env:USERPROFILE\.codex\skills -Recurse -Force
Copy-Item .\skills\checking-ai-acceptance $env:USERPROFILE\.codex\skills -Recurse -Force
```

macOS / Linux:

```bash
mkdir -p ~/.codex/skills
cp -R skills/assessing-ai-scenarios ~/.codex/skills/
cp -R skills/writing-ai-prds ~/.codex/skills/
cp -R skills/planning-ai-mvps ~/.codex/skills/
cp -R skills/designing-ai-metrics ~/.codex/skills/
cp -R skills/checking-ai-acceptance ~/.codex/skills/
```

## 使用

不需要记命令，直接用自然语言提问：

```text
帮我判断这个 AI 客服场景适不适合立项。
```

```text
把这个 AI 报告审核需求整理成 PRD。
```

```text
第一版 MVP 应该做什么，不做什么？
```

```text
这个 AI 功能怎么设计验收指标？
```

也可以直接点名 skill：

```text
用 assessing-ai-scenarios 评估这个场景：……
```

## 该问什么

| 你想做什么 | 可以这样问 |
|---|---|
| 判断 AI 项目值不值得做 | `这个场景适不适合用 AI？值不值得立项？` |
| 写 AI 产品 PRD | `把这个需求整理成 AI 产品 PRD。` |
| 砍 MVP 范围 | `第一版 MVP 应该做什么，不做什么？` |
| 设计指标 | `这个 AI 功能怎么衡量效果，怎么验收？` |
| 检查方案风险 | `帮我检查这个 AI 方案上线前还有什么缺口。` |

## 路由说明

看 `skills/RESOLVER.md`。

## 目录说明

```text
README.md                 给使用者看的安装和使用说明
install.ps1               Windows 安装脚本
install.sh                macOS / Linux 安装脚本
SKILL.md                  AI 场景识别原始完整版
skills/                   推荐安装的拆分版 skills
skills/RESOLVER.md        选择哪个 skill 的路由说明
```
