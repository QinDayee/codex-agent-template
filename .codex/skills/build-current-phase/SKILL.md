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

# Required Steps
1. Read AGENTS.md
2. Read PLANS.md and identify current phase
3. Implement only that phase
4. Run relevant build/test/verification commands
5. Update TODO.md
6. Update CHANGELOG.md
7. Update STATE.md

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
