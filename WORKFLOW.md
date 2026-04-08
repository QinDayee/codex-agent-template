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

## State Definitions

### INTAKE
- Purpose:
  - Accept a new request and automatically route it into the correct workflow path.
- Required inputs:
  - AGENTS.md
  - WORKFLOW.md
  - PROJECT_PROFILE.md
  - STATE.md
  - HANDOFF.md when resuming
- Required outputs:
  - Current goal identified
  - Correct next workflow state selected
- Allowed actions:
  - Infer user intent from natural language
  - Read only the minimum additional files needed for the chosen route
  - Auto-draft PROJECT_PROFILE.md if command or environment context is missing
- Exit criteria:
  - Move to CLARIFY, TASKS_READY, BUILDING, or REVIEWING based on available artifacts

## Intake Routing Rules

- New feature, bug, or change request:
  - Default route: `CLARIFY`
- `继续`, `恢复`, `接着做`, `continue`, or equivalent:
  - Default route: reconstruct context from state and handoff files, then resume from the correct state
- `review`, `qa`, `检查`, `审一下`, or equivalent:
  - Default route: `REVIEWING` or `QA_CHECK`, depending on whether findings already exist
- “拆成任务”, “split into tasks”, or equivalent:
  - Default route: `TASKS_READY`
- If intent is ambiguous but safe to interpret:
  - Pick the least destructive route and record the assumption
- If intent is ambiguous and unsafe:
  - Ask one concise clarifying question

### CLARIFY
- Purpose:
  - Turn a vague request into a scoped requirement draft.
- Required inputs:
  - Request details
  - Existing repo context
  - PROJECT_PROFILE.md
- Required outputs:
  - SPEC.md updated with goal, users, workflows, in-scope, out-of-scope, assumptions, open questions
  - RISKS.md updated with requirement or dependency risks
- Allowed actions:
  - Explore repo
  - Ask only high-impact business questions
  - Document safe assumptions
- Exit criteria:
  - Scope, assumptions, and acceptance direction are clear enough to design

### SPEC_READY
- Purpose:
  - Mark that requirements are ready for technical design.
- Required inputs:
  - Updated SPEC.md
  - Known requirement risks
- Required outputs:
  - STATE.md updated to reflect spec readiness
- Exit criteria:
  - Technical design can begin without inventing business rules

### DESIGN_READY
- Purpose:
  - Produce buildable design and phased plan.
- Required inputs:
  - SPEC.md
  - PROJECT_PROFILE.md
  - Existing architecture constraints
- Required outputs:
  - PLANS.md updated with phases, acceptance criteria, public interface changes, risks, rollback notes
  - DECISIONS.md updated with material design choices
- Allowed actions:
  - Define modules, contracts, boundaries, dependencies, rollout shape
  - Reject over-design in favor of the smallest closed loop
- Exit criteria:
  - Tasks can be split without further architectural ambiguity

### TASKS_READY
- Purpose:
  - Convert the design into executable work.
- Required inputs:
  - SPEC.md
  - PLANS.md
  - DECISIONS.md
- Required outputs:
  - TASKS.md populated with prioritized, testable tasks
  - STATE.md updated with current phase, active task, blockers, next command
- Allowed actions:
  - Split work
  - Assign dependencies and verification method
- Exit criteria:
  - At least one approved task is ready to build

### BUILDING
- Purpose:
  - Execute one approved task or one approved phase.
- Required inputs:
  - Active task or active phase
  - PROJECT_PROFILE.md commands
- Required outputs:
  - Code or docs updated
  - CHANGELOG.md updated
  - STATE.md updated
- Allowed actions:
  - Implement
  - Run relevant verification
  - Document assumptions and failures
- Exit criteria:
  - Implementation for the current task is complete enough to review

### REVIEWING
- Purpose:
  - Evaluate changes for correctness, regressions, and maintainability.
- Required inputs:
  - Current diff
  - SPEC.md
  - PLANS.md
  - TASKS.md
- Required outputs:
  - Structured findings with severity, impact, and suggested fixes
- Exit criteria:
  - Either move to QA_CHECK or REWORK

### QA_CHECK
- Purpose:
  - Decide if work is ready to proceed.
- Required inputs:
  - Review result
  - Verification results
  - Known risks
- Required outputs:
  - Explicit verdict
  - Next action
- Exit criteria:
  - Move to PASS, REWORK, or BLOCKED

### PASS
- Purpose:
  - Confirm the current task or phase is complete.
- Required outputs:
  - HANDOFF.md updated
  - STATE.md updated
- Exit criteria:
  - Move to TASKS_READY if more work remains
  - Move to COMPLETE if the planned work is done

### REWORK
- Purpose:
  - Address review or QA findings before progressing.
- Required outputs:
  - Findings reflected in TASKS.md or active task notes
- Exit criteria:
  - Work returns to BUILDING

### BLOCKED
- Purpose:
  - Pause execution when critical information or dependencies are missing.
- Required outputs:
  - FAILURES.md updated
  - HANDOFF.md updated with blocker and next recommendation
- Exit criteria:
  - Missing dependency, information, or approval is resolved

### COMPLETE
- Purpose:
  - Close the current scope.
- Required outputs:
  - Final handoff is clear
  - Remaining risks are explicit
  - Next possible work is listed if relevant

---

## Transition Rules

### INTAKE -> CLARIFY
When the user expresses a new task or the request is incomplete.

### CLARIFY -> SPEC_READY
When SPEC.md clearly states scope, assumptions, open questions, and success direction.

### SPEC_READY -> DESIGN_READY
When technical design can proceed without guessing business rules.

### DESIGN_READY -> TASKS_READY
When PLANS.md and DECISIONS.md are sufficient to split executable work.

### TASKS_READY -> BUILDING
When there is at least one approved task or current phase with explicit verification.

### BUILDING -> REVIEWING
Immediately after the scoped implementation is complete.

### REVIEWING -> QA_CHECK
If critical findings are absent or fixed.

### REVIEWING -> REWORK
If the current changes contain blocking issues.

### QA_CHECK -> PASS
If acceptance criteria and verification are satisfied.

### QA_CHECK -> REWORK
If the quality gate fails but the work is still actionable.

### Any State -> BLOCKED
If required business information, dependency access, or safe execution preconditions are missing.

### PASS -> TASKS_READY
If more approved tasks or phases remain.

### PASS -> COMPLETE
If all currently planned scope is complete.

### REWORK -> BUILDING
After findings are converted into actionable work and implementation resumes.

---

## Automatic Progression
Continue automatically to the next step unless:
- essential business information is missing
- a hard technical blocker exists
- execution would be unsafe
- the user explicitly stops the process

---

## Escalation Rules
Ask the user only when:
- a business decision materially changes scope
- there are multiple high-impact design choices with no clear default
- execution would be unsafe or likely wrong without clarification

Otherwise, make the safest documented assumption and record it.
