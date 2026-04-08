---
name: quality-gate
description: Decide whether the current phase is ready to proceed based on acceptance criteria, verification, and documented risks.
---

# Goal
Determine whether the current phase can move forward.

# Checks

## Delivery Checks
- Does the implementation satisfy acceptance criteria in PLANS.md?
- Did the work stay within scope?

## Engineering Checks
- Does the project build successfully?
- Did relevant tests pass?
- Did required checks run?

## Risk Checks
- Are known risks documented?
- Are unresolved blockers present?
- Is rollback information available?
- Is the next workflow state explicit?

# Output

## Verdict
- PASS
- PASS WITH MINOR RISKS
- REWORK REQUIRED
- BLOCKED

## Findings
- issue
- severity
- impact

## Next Action
- continue
- rework
- request user input
- block on dependency
