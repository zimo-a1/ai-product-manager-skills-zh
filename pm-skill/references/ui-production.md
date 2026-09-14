# UI 制作参考

用于制作、重构或评审 AI/SaaS 产品中的产品界面、页面、组件、交互状态和前端 polish。目标是让 UI 服务用户任务、产品结构和后续迭代。

## 目录

-   任务路由
-   UI 基线
-   产品界面原则
-   页面和流程
-   组件制作
-   交互规则
-   动效和性能
-   排版和布局
-   文案和命名
-   可访问性和移动端
-   视觉 polish
-   验证清单

## 任务路由

先判断当前 UI 工作属于哪一类，只加载相关规则。

| 任务 | 主要关注 |
| --- | --- |
| 新页面、dashboard、settings、工作台 | 信息架构、布局模式、状态覆盖、响应式 |
| 表单、搜索、表格、列表、modal、导航 | 用户流程、错误处理、反馈位置、键盘操作 |
| 复用组件 | API、variant、size、状态模型、可访问性 |
| 视觉 polish | 层级、间距、对齐、圆角、阴影、触控、滚动、平台细节 |
| UI 文案 | 操作标签、错误、空状态、helper text、loading、success |
| UI 评审 | 任务完成度、状态缺口、可访问性、移动端、文案和视觉一致性 |

复杂 UI 制作按这个顺序推进：

```text
用户任务 -> 页面/流程结构 -> 组件和状态 -> 文案和反馈 -> 响应式和可访问性 -> 视觉 polish -> 浏览器验证
```

评审 UI 时输出：

-   问题：引用具体页面、组件、class、状态或片段。
-   影响：用一句话说明它如何影响用户任务、可访问性、视觉层级或稳定性。
-   修复：给出可执行的代码级建议或组件级改法。

## UI 基线

快速 polish 或新增 UI 时先执行这些规则：

-   使用项目现有组件、样式工具和设计 token；不要为了小改动迁移 UI 库或动画库。
-   交互组件优先使用已有可访问 primitives；没有现成组件时优先用原生 HTML。
-   同一个交互面不要混用多套 primitive 系统，例如 dialog/menu/tabs 不要一半自写一半来自不同库。
-   icon-only button 必须有 `aria-label`，装饰图标加 `aria-hidden="true"`。
-   destructive 或不可逆操作使用确认组件，并把后果写清楚。
-   loading 优先用结构接近真实内容的 skeleton；短暂局部等待才用 spinner。
-   fixed 底部或边缘 UI 使用 `safe-area-inset`；全屏高度优先用 `dvh` 而不是固定 `vh`。
-   错误出现在触发动作或字段附近；不要只靠 toast 传达关键错误。
-   不阻止用户在 `input` 或 `textarea` 中粘贴。
-   empty state 必须有一个自然下一步，不能只说“暂无数据”。
-   每个视图只使用少量 accent 色；优先用现有主题或 Tailwind 默认色阶。

## 产品界面原则

-   先说明用户要完成的任务，再决定页面结构、组件和视觉层级。
-   每个主要界面都要有主操作、次操作、返回/取消路径和失败恢复路径。
-   信息密度匹配产品场景：dashboard 和运营工具偏紧凑，onboarding 和营销页偏舒展。
-   复杂功能使用渐进披露，把高级设置、批量操作和危险操作放到更明确的位置。
-   AI 输出区域要支持查看、编辑、接受、重试、纠正或回滚；用户要能理解 AI 当前状态。
-   重要反馈放在触发它的位置附近；表单错误、复制成功、保存失败优先做 inline feedback。

## 页面和流程

制作页面前先列出状态：

-   初始状态
-   配置/输入状态
-   loading 状态
-   AI 分析/生成/检索状态
-   等待用户确认或补充状态
-   empty 状态
-   error 状态
-   partial/分页状态
-   complete 状态
-   disabled/permission 状态
-   optimistic update 和 rollback 状态

AI 产品界面还要列出工作流阶段：

-   用户输入阶段：用户提供目标、文件、数据、偏好或约束。
-   系统准备阶段：解析、校验、索引、检索、排队或建立会话。
-   AI 执行阶段：分析、选择工具、生成、流式输出或后台任务。
-   证据展示阶段：展示引用、来源、使用的数据范围、置信度或缺口。
-   用户接管阶段：用户编辑、确认、重试、纠正、撤销或选择下一步。
-   持久化阶段：保存、发布、同步、写回记忆或记录操作日志。

不要把这些阶段都做成复杂页面；根据任务选择最小可理解的状态反馈。

常见模式：

-   表单：短表单 submit 时校验；中长表单 blur + submit；实时校验只用于密码强度、用户名可用性、字数限制等即时反馈字段。
-   表单错误：错误出现在字段下方，提交失败时滚动并聚焦到第一个错误字段，保留用户已输入内容。
-   表格：适合比较结构化数据。需要排序、筛选、结果数量、分页或加载更多，以及移动端策略。
-   列表：适合 feed、搜索结果、通知、消息。列表项结构保持一致，支持空、加载、错误、部分加载。
-   Modal：适合确认危险操作、短创建流程、快速预览。复杂多步流程使用页面或 route。
-   搜索：输入 debounce，支持清除、空结果、错误重试、键盘上下选择和 Enter 选中。

## AI 产品状态

AI 产品 UI 要让用户理解系统正在做什么、用了什么、还能怎么干预：

-   显示 AI 当前阶段，例如准备、检索、生成、校验、保存或失败。
-   长任务用流式进度、阶段日志、骨架屏或局部结果，避免只有通用 loading。
-   当输出依赖资料、历史或工具时，展示可理解的来源、证据摘要或数据范围。
-   AI 输出支持编辑、接受、重试、纠正、撤销、复制、下载或继续追问。
-   失败时保留用户输入和已生成内容，给出重试、改用文本、跳过或手动处理路径。
-   写操作、外部副作用、发布、删除、付费和长期记忆写回要有确认或明显状态提示。
-   用户能区分系统状态、AI 判断、可编辑草稿、已保存结果和历史记录。

## 组件制作

共享组件要先定义契约，再写样式。

-   统一 prop 名称：`variant`、`size`、`disabled`、`loading`、`open`、`className`、`ref`。
-   多值维度使用 string union，例如 `size="sm" | "md" | "lg"`。
-   有限视觉差异用 variant；结构差异用 composition 或 compound components。
-   组件接受 `className`，合并现有样式工具，保留项目既有组件模式。
-   button 默认 `type="button"`，只有明确提交表单时使用 `type="submit"`。
-   图标继承 `currentColor`，同一产品界面使用同一套 icon 风格。

交互组件覆盖：

-   default
-   hover
-   focus
-   active/pressed
-   disabled
-   loading

数据组件覆盖：

-   empty
-   loading
-   error
-   partial
-   complete

loading 优先用贴近真实布局的 skeleton；通用 spinner 用于短暂、局部、结构难预测的等待。

## 交互规则

-   按钮使用动词结果命名，例如 `Save changes`、`Retry`、`Delete project`。
-   主操作每个区域只保留一个；次操作视觉权重低于主操作。
-   禁用按钮旁边或 tooltip 中说明禁用原因；不要让用户猜。
-   表单 submit 失败时保留用户输入，滚动并聚焦到第一个错误字段。
-   Modal、drawer、menu 关闭后焦点回到触发元素。
-   hover-only 信息必须有 keyboard/focus 等价路径。
-   搜索、筛选和分页要显示结果数量、空结果、加载中、错误和清除入口。
-   长任务允许用户取消、回退、稍后查看或继续处理已完成部分。

## 动效和性能

-   不为装饰目的默认加动效；动效要服务方向感、状态反馈或层级变化。
-   交互反馈通常不超过 200ms；页面进入动效使用短的 ease-out。
-   优先动画 `transform` 和 `opacity`；不要连续动画 `width`、`height`、`top`、`left`、`margin`、`padding`。
-   避免在大面积容器上动画 blur、backdrop-filter、渐变、mask 或 box-shadow。
-   `will-change` 只在动画前后短暂使用，不要长期挂在元素上。
-   requestAnimationFrame 循环必须有暂停或停止条件；离屏、标签页隐藏或 reduced-motion 时停止非必要循环。
-   Scroll-linked motion 优先用 CSS view/scroll timeline 或 IntersectionObserver；不要频繁读取 `scrollY` 驱动动画。
-   动效尊重 `prefers-reduced-motion`，保留信息和操作完整性。

## 排版和布局

-   标题使用清晰层级，正文保持可读行长；dashboard 可更宽但要保持扫描路径。
-   标题长文本使用 balance 策略；正文长文本使用 pretty wrapping 或合理 line-height。
-   数据、金额、计数、表格数字使用 tabular numbers。
-   密集列表、表格和卡片用 `truncate` 或 `line-clamp`，同时保留查看完整内容的方式。
-   square icon/button/avatar 使用稳定 `size`，避免 hover、loading、label 改变元素尺寸。
-   固定 z-index scale；不要随手加任意巨大 z-index。
-   grid/list/table 要定义 empty、loading、error、partial、complete 状态的稳定高度或占位，避免布局跳动。
-   mobile first 检查长词、按钮标签、表格列、底部固定操作和输入框字号。

## 文案和命名

-   操作标签要直接对应结果，例如 `Delete project`、`Save changes`、`Retry`。
-   错误文案说明发生了什么，以及用户下一步能做什么。
-   empty state 说明当前为什么为空，并给出自然的第一步操作。
-   helper text 用于提前减少错误，放在控件附近。
-   tooltip 用于解释低熟悉度图标或短约束；关键说明放在页面流程中。
-   AI 产品里的文案要区分系统状态、AI 思考/生成状态、用户可执行操作。

## 可访问性和移动端

-   所有 interactive element 可用 Tab 到达，焦点样式清晰可见。
-   icon-only button、link、toggle 有明确 `aria-label`。
-   表单 input 绑定 label，输入区域放在 `<form>` 中。
-   颜色只作为辅助状态提示，配合文字、图标、位置或形状。
-   文本对比度达到 WCAG 2.x AA；深浅色主题都要检查。
-   touch target 至少 44px；小图标按钮用 wrapper 或伪元素扩大点击区域。
-   移动端 input 字号至少 16px，保持 iOS Safari 输入时字号稳定。
-   hover 样式限定到支持 hover 的设备，触屏设备使用 active/focus 反馈。
-   固定在底部或边缘的移动端 UI 使用 safe-area inset。
-   动效尊重 `prefers-reduced-motion`。

## 视觉 polish

-   卡片、面板、工具栏和列表项使用稳定尺寸，hover、loading、错误状态保持布局稳定。
-   嵌套圆角保持视觉一致：外层圆角约等于内层圆角加间距。
-   图标按钮做光学校正，图标侧 padding 可以比文字侧少 2-4px。
-   文本容器限制宽度，正文控制在易读行长内；dashboard 内容可以更宽。
-   交互控件之间填满点击热区，减少列表、菜单、toast 中的空隙。
-   模态、抽屉、菜单关闭后焦点返回触发元素。
-   主题切换时处理 transition flash；SSR/CSR 项目处理 hydration flash。

## 验证清单

完成 UI 工作前做针对性验证：

-   桌面和移动端布局都能完成主流程。
-   文字完整显示，无遮挡，按钮标签长度可控。
-   loading、empty、error、disabled、permission 状态都有处理。
-   表单错误保留输入并能恢复。
-   键盘可操作主要控件和 modal。
-   图标按钮有可访问名称。
-   触屏交互稳定，输入字号和底部固定区域表现正常。
-   视觉 polish 覆盖对齐、圆角、间距、阴影和滚动稳定性。
-   使用浏览器截图或手动流程验证关键页面。
