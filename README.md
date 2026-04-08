# Codex Agent Project Template

一个可直接 `git init` 使用的 Codex 工程化模板，目标是把 Codex 用成：

- 需求澄清 Agent
- 技术规划 Agent
- 分阶段开发 Agent
- Review / QA / Quality Gate Agent
- 可恢复、可追踪的长任务执行系统

## 建议用法

### 1. 初始化仓库
```bash
git init
git add .
git commit -m "init codex agent template"
```

### 2. 给 Codex 的起始指令
```text
Read AGENTS.md, WORKFLOW.md, STATE.md, TASKS.md, and all skills under .codex/skills.
Then act as the coordinator and follow the required workflow.
```

### 3. 新需求启动
```text
我要做一个新的功能，但需求还不完整。请按 AGENTS.md 和 WORKFLOW.md 先做需求澄清、规划和设计，不要直接写代码。
```

### 4. 中断恢复
```text
继续当前任务。请先读取 STATE.md、TASKS.md、HANDOFF.md、FAILURES.md 和 CHANGELOG.md，然后继续推进。
```

## 目录说明

- `.codex/skills/`：可复用工作流
- `.codex/agents/`：角色定义
- `AGENTS.md`：全局行为约束
- `WORKFLOW.md`：状态机与推进规则
- `STATE.md`：当前执行状态
- `TASKS.md`：任务池
- `PLANS.md`：分阶段计划
- `HANDOFF.md`：交接信息
- `ROLLBACK.md`：回滚预案
- `EVALS.md` / `SCORECARD.md`：评估与打分

## 推荐节奏

1. requirement-plan
2. technical-design
3. task-split
4. build-current-phase / task-executor
5. change-review
6. quality-gate
7. handoff-update

## 适配建议

如果你是 `.NET + PostgreSQL` 项目，记得把下面这些命令改成你真实项目里的命令：

- Build
- Test
- Format
- Migration
- Run app
