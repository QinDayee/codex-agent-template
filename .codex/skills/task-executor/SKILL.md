---
name: task-executor
description: Execute one task at a time, keep status updated, and leave a resumable state.
---

# Goal
Pick one approved task and complete it safely.

# Rules
- Only one active task at a time unless explicitly parallelized.
- Keep implementation aligned with the current plan.
- Update status when starting and finishing.

# Required Updates
- TASKS.md
- TODO.md
- CHANGELOG.md
- STATE.md

# Final Output
Summarize:
- task executed
- changed files
- checks run
- task result
- next recommended task
