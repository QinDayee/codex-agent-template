---
name: technical-design
description: Convert an approved requirement draft into modules, data design, interface design, and phased delivery plan without implementation code.
---

# Goal
Transform the confirmed requirement into an implementation-ready design.

# Rules
- Do not write implementation code.
- Favor the smallest deliverable closed loop.
- Keep design practical and buildable.
- Explicitly identify dependencies and acceptance criteria.
- Update PLANS.md and DECISIONS.md directly.

# Output

## 1. Module Design
- modules
- responsibilities
- boundaries

## 2. Data Design
- tables / entities
- key fields
- relationships
- constraints notes

## 3. Interface Design
- APIs or contracts
- inputs / outputs
- validation rules

## 4. Workflow Design
- main business flow
- error paths
- role or permission checks if needed

## 5. Delivery Plan
Update PLANS.md with:
- phases
- goals
- in scope
- out of scope
- public interface changes
- dependencies
- acceptance criteria
- validation
- rollback notes
- rollout order

## 6. Decision Log
Update DECISIONS.md with material design choices and tradeoffs.

# Stop Condition
Do not start coding automatically.
Move to `DESIGN_READY` only when the design is detailed enough for task splitting.
