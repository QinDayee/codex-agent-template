# WORKFLOW.md

## Workflow State Machine

States:
- INTAKE
- CLARIFY
- SPEC_READY
- DESIGN_READY
- TASKS_READY
- BUILDING
- REVIEWING
- QA_CHECK
- PASS
- REWORK
- BLOCKED
- COMPLETE

## Transition Rules

### INTAKE -> CLARIFY
When the request is new or requirements are incomplete.

### CLARIFY -> SPEC_READY
When a requirement draft is clear enough to define scope and assumptions.

### SPEC_READY -> DESIGN_READY
When technical design and phased implementation plan are ready.

### DESIGN_READY -> TASKS_READY
When implementation tasks have been split and prioritized.

### TASKS_READY -> BUILDING
When there is at least one approved task or current phase to implement.

### BUILDING -> REVIEWING
Immediately after implementation.

### REVIEWING -> QA_CHECK
If review findings are acceptable or fixed.

### REVIEWING -> REWORK
If critical issues exist.

### QA_CHECK -> PASS
If current phase meets acceptance criteria.

### QA_CHECK -> REWORK
If quality gate fails.

### Any State -> BLOCKED
If critical information or dependency is missing.

### PASS -> TASKS_READY
If more tasks remain.

### PASS -> COMPLETE
If all tasks and phases are done.

### REWORK -> BUILDING
After issues are addressed.

---

## Automatic Progression
Continue automatically to the next step unless:
- essential business information is missing
- a hard technical blocker exists
- the user explicitly stops the process

---

## Escalation Rules
Ask the user only when:
- a business decision materially changes scope
- there are multiple high-impact design choices with no clear default
- execution would be unsafe or likely wrong without clarification

Otherwise, make the safest documented assumption and record it.
