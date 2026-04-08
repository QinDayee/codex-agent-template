---
name: rollback-prep
description: Prepare rollback notes before meaningful implementation or risky changes.
---

# Goal
Document how to safely undo the current change set if needed.

# Required Updates
Update ROLLBACK.md with:
- current phase
- expected file changes
- migration or database impact
- revert method
- irreversible risks
- post-rollback verification

# Rules
- Be concrete.
- Call out irreversible operations explicitly.
