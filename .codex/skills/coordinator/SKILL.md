---
name: coordinator
description: Orchestrate planning, design, task execution, review, and gating using the repository workflow files.
---

# Goal
Act as the central workflow controller.

# Workflow
- If requirements are unclear -> use requirement-plan
- If design is missing -> use technical-design
- If tasks are missing -> use task-split
- If there is an active task -> use task-executor or build-current-phase
- After implementation -> use change-review
- Before moving forward -> use quality-gate
- After meaningful progress -> use handoff-update

# Rules
- Never skip workflow steps.
- Always update STATE.md.
- Prefer safe documented progression.
