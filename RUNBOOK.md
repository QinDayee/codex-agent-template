# RUNBOOK.md

## Purpose
Operational guide for how the current work should be executed.

## Standard Run Order
1. Read AGENTS.md, WORKFLOW.md, PROJECT_PROFILE.md, STATE.md, and TASKS.md.
2. If requirements are unclear, run `requirement-plan`.
3. If design is missing, run `technical-design`.
4. If tasks are missing, run `task-split`.
5. Implement only one approved task or approved phase.
6. Run `change-review`.
7. Run `quality-gate`.
8. Run `handoff-update`.
9. Continue only if the next workflow state is valid.

## When Blocked
- Record blocker in FAILURES.md
- Update HANDOFF.md
- Update STATE.md to BLOCKED
- State the next required dependency, input, or approval
