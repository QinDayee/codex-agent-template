# CHANGELOG.md

## Initial Template
### Changed
- Created codex multi-agent project template
- Added skills, agents, workflow, and tracking files

### Verified
- Directory structure created
- Template markdown files created

### Remaining Risks
- Project commands may need adjustment
- Skill prompts may need adaptation to repo conventions

## Governance Template Hardening
### Changed
- Reworked README entry prompts and template usage rules
- Added PROJECT_PROFILE.md for project-specific commands and environment data
- Tightened AGENTS.md and WORKFLOW.md with explicit workflow boundaries and artifact requirements
- Replaced loose state, task, plan, handoff, failure, decision, and risk files with stricter templates
- Aligned `.codex/agents` and core workflow skills with the new governance model

### Verified
- Repository structure inspected
- Existing workflow files reviewed and normalized

### Remaining Risks
- Downstream projects still need to fill PROJECT_PROFILE.md with real commands
- Teams may need to tailor skill wording to their own repo conventions

## Template Bootstrap Automation
### Changed
- Added a `scripts/new-project.ps1` bootstrap script to copy the template into a new directory and initialize a fresh git repo
- Documented natural-language template bootstrap in README, AGENTS.md, and WORKFLOW.md
- Defined the default behavior for excluding the template `.git`, making an initial commit, and continuing work in the new repo

### Verified
- Script arguments and target-path rules reviewed
- Template bootstrap rules aligned across README, AGENTS.md, and WORKFLOW.md

### Remaining Risks
- Remote repository creation is still optional and depends on the user's hosting workflow
- New projects still need PROJECT_PROFILE.md to be refined from real repo evidence after bootstrap
