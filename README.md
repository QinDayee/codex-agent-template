# Codex Agent Project Template

一个面向 Codex 的流程治理模板，用来把 agent 约束成可规划、可追踪、可恢复、可交接的工程执行系统，而不是一次性代码生成器。

## 初始化

```bash
git init
git add .
git commit -m "init codex agent template"
```

默认不要求你先手填一堆文档，也不要求你复制长提示词。直接像平时用 cc 那样说人话就行，模板会在后台自动判断是新需求、恢复还是 review。

## 最简单用法

```text
接管这个仓库，按模板推进：做一个用户登录功能。
```

## 最小输入示例

```text
做一个用户登录功能
```

```text
继续
```

```text
review
```

```text
把这个需求拆成任务
```

## 默认行为

- 你直接描述一个需求，agent 默认按新任务处理
- 你说“继续”，agent 默认按恢复流程处理
- 你说“review”或“检查一下”，agent 默认按 review / QA 处理
- 如果 `PROJECT_PROFILE.md` 还是空的，agent 会先自动扫描仓库并补草稿
- 只有在关键命令、环境或业务决策无法安全推断时，agent 才会追问

## 显式说法

如果你想更稳，也可以用这些短句：

```text
继续当前任务
```

```text
review 当前改动
```

```text
按模板启动一个新需求：<需求内容>
```

## 模板内容

- `.codex/skills/`: 可复用流程技能
- `.codex/agents/`: 角色定义
- `AGENTS.md`: 全局行为约束、角色边界、默认决策规则
- `WORKFLOW.md`: 状态机、阶段输入输出、准入与退出条件
- `PROJECT_PROFILE.md`: 与具体仓库绑定的命令、路径、环境、验证入口
- `STATE.md`: 当前最小可恢复上下文
- `TASKS.md`: 严格任务板，唯一任务事实源
- `SPEC.md`: 需求规格模板
- `PLANS.md`: 分阶段交付计划模板
- `DECISIONS.md`: 技术与产品决策日志
- `RISKS.md`: 风险登记
- `HANDOFF.md`: 交接模板
- `FAILURES.md`: 失败与阻塞记录
- `ROLLBACK.md`: 回滚预案
- `EVALS.md` / `SCORECARD.md`: 评估与质量打分

## 后台节奏

1. `requirement-plan`
2. `technical-design`
3. `task-split`
4. `task-executor` or `build-current-phase`
5. `change-review`
6. `quality-gate`
7. `handoff-update`

## 使用原则

- `TASKS.md` 是任务事实源，`TODO.md` 只作为可选草稿区。
- `STATE.md` 必须能让陌生 agent 在中断后恢复执行。
- `PROJECT_PROFILE.md` 是唯一允许写入项目特定命令和环境假设的地方，但允许 agent 先自动生成草稿。
- 如果需求、设计或验证信息缺失，先补文档，再决定是否继续执行。
- 如果 workflow 没有进入 `BUILDING`，默认不应该开始编码。
