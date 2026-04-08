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
- dependencies
- acceptance criteria
- rollout order

## 6. Task List
Update TODO.md with prioritized tasks.

# Stop Condition
Do not start coding automatically.
