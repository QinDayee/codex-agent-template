# EVALS.md

## Evaluation Rules by Task Type

### New Feature
Check:
- requirement fit
- closed-loop business flow
- error handling
- tests where appropriate
- docs updated

### SQL Change
Check:
- result-set correctness
- null handling
- join/filter correctness
- index usage
- performance risk

### Import / ETL
Check:
- type conversion correctness
- batch strategy
- memory usage risk
- retry and logging
- bad-row handling

### Refactor
Check:
- no scope creep
- behavior unchanged unless planned
- tests pass
- docs updated if behavior changed
