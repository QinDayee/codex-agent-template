---
name: build-current-phase
description: Implement only the current approved phase, keep scope tight, run checks, and update tracking files.
---

# Goal
Implement one approved phase from PLANS.md.

# Rules
- Only work on the requested phase.
- Do not expand scope.
- Do not perform unrelated refactors.
- Reuse existing project patterns.
- Keep changes minimal but sufficient for current acceptance criteria.
- Use PROJECT_PROFILE.md for commands and verification.

# Required Steps
1. Read AGENTS.md
2. Read PROJECT_PROFILE.md
3. Read PLANS.md and identify current phase
4. Implement only that phase
5. Run relevant build/test/verification commands
6. Update TASKS.md
7. Update CHANGELOG.md
8. Update STATE.md

# Final Output
Summarize:
- changed files
- purpose of each change
- commands run
- verification results
- completed tasks
- remaining tasks
- known risks
- suggested next step
