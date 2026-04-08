---
name: change-review
description: Review current changes against requirements, correctness, maintainability, and performance risk.
---

# Goal
Perform a structured review of current changes.

# Checklist
Check for:
- requirement mismatch
- logic errors
- null / exception handling gaps
- performance issues
- SQL correctness and result-set changes
- unnecessary file changes
- missing tests
- missing documentation updates

# Output

## Findings
For each issue include:
- issue
- severity
- affected area
- why it matters

## Suggested Fixes
List the most important corrections first.

## Release Risk
State one of:
- safe
- needs small fixes
- needs major fixes
