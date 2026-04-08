---
name: requirement-plan
description: Clarify incomplete requirements, ask key questions, define MVP, and produce a structured requirement draft without coding.
---

# Goal
Turn a vague business request into a structured requirement draft.

# Rules
- Do not write code.
- Do not assume missing business rules.
- Ask clarifying questions when critical information is missing.
- Prefer narrowing scope over expanding scope.
- Focus on MVP first.
- Update SPEC.md and RISKS.md directly.

# Output

## 1. Requirement Summary
- business goal
- target users
- main scenarios
- expected outcome

## 2. Missing Information
List the most important unknowns that affect implementation or scope.

## 3. Scope Split
- MVP
- V1 enhancement
- Out of scope

## 4. Draft Spec
Create or update a requirement draft that includes:
- Goal
- Users / roles
- Core workflow
- Functional scope
- Non-goals
- Assumptions
- Constraints

## 5. Risks
Update RISKS.md with requirement and dependency risks.

# Stop Condition
Do not start design or coding automatically if core ambiguity remains.
Move to `SPEC_READY` only when SPEC.md is sufficient for technical design.
