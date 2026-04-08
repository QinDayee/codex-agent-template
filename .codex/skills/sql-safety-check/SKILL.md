---
name: sql-safety-check
description: Analyze SQL for correctness, performance, indexing, and result-set stability.
---

# Goal
Check SQL changes for both correctness and performance impact.

# Rules
- Do not assume unstated business semantics.
- Call out where result sets may change.
- Separate correctness risk from performance risk.

# Output

## 1. Current Query Behavior
Explain what the SQL is doing.

## 2. Correctness Risks
- duplicate rows
- missing rows
- changed aggregation semantics
- null handling
- join/filter edge cases

## 3. Performance Risks
- full scans
- non-sargable predicates
- sort/aggregate pressure
- likely missing indexes

## 4. Recommendations
- safer rewrite if needed
- index suggestions
- verification steps
