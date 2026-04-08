# Codex Agent Project Template

一个面向 Codex 的流程治理模板，用来把 agent 约束成可规划、可追踪、可恢复、可交接的工程执行系统，而不是一次性代码生成器。

这个模板默认适用于：

- 需求还不完整的新功能
- 需要分阶段推进的长期任务
- 需要 review、QA、quality gate 的闭环开发
- 容易中断、需要恢复上下文的仓库协作

## 初始化

```bash
git init
git add .
git commit -m "init codex agent template"
```

初始化后先填写 [PROJECT_PROFILE.md](./PROJECT_PROFILE.md)，把你的真实项目命令、运行依赖、目录约定和验证入口写进去。核心治理文件不要写死具体技术栈。

## 给 Codex 的基础入口

```text
Read AGENTS.md, WORKFLOW.md, PROJECT_PROFILE.md, STATE.md, TASKS.md, SPEC.md, PLANS.md, RISKS.md, HANDOFF.md, and the required skills under .codex/skills.
Act as the coordinator and follow the repository workflow strictly.
```

## 固定入口提示词

### 1. 新需求入口

```text
我有一个新的需求，但信息还不完整。请先读取 AGENTS.md、WORKFLOW.md、PROJECT_PROFILE.md、STATE.md、TASKS.md、SPEC.md、RISKS.md，然后以 coordinator 身份推进 requirement-plan。先完成需求澄清和范围收敛，不要直接写代码。
```

### 2. 中断恢复入口

```text
继续当前任务。请先读取 STATE.md、TASKS.md、HANDOFF.md、FAILURES.md、CHANGELOG.md、DECISIONS.md 和 RISKS.md，重建当前上下文，确认下一个正确 workflow step，然后继续推进，不要重复已经完成的阶段。
```

### 3. Review / QA 入口

```text
请对当前改动执行 change-review 和 quality-gate。先读取 AGENTS.md、WORKFLOW.md、PROJECT_PROFILE.md、SPEC.md、PLANS.md、TASKS.md、RISKS.md、CHANGELOG.md，然后输出 findings、verdict、remaining risks 和 next action。
```

## 目录说明

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

## 标准节奏

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
- `PROJECT_PROFILE.md` 是唯一允许写入项目特定命令和环境假设的地方。
- 如果需求、设计或验证信息缺失，先补文档，再决定是否继续执行。
- 如果 workflow 没有进入 `BUILDING`，默认不应该开始编码。
