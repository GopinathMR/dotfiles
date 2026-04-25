# Claude Code Setup Skill

## Goal

Install and configure all required marketplaces and plugins for Claude Code, with auto-update enabled.

## Prerequisites

- `claude` CLI is installed and authenticated
- `git` is available in PATH
- Internet access to reach GitHub

## Steps

### 1. Add Marketplaces

Add each marketplace source:

```bash
\claude plugin marketplace add anthropics/skills
\claude plugin marketplace add wshobson/agents
\claude plugin marketplace add VoltAgent/awesome-claude-code-subagents
```

### 2. Install Plugins from `anthropics/skills`

```bash
\claude plugin install example-skills
```

### 3. Install Plugins from `wshobson/agents`

```bash
\claude plugin install agent-teams
\claude plugin install backend-development
\claude plugin install cicd-automation
\claude plugin install cloud-infrastructure
\claude plugin install code-documentation
\claude plugin install code-refactoring
\claude plugin install codebase-cleanup
\claude plugin install comprehensive-review
\claude plugin install context-management
\claude plugin install dependency-management
\claude plugin install deployment-strategies
\claude plugin install developer-essentials
\claude plugin install documentation-generation
\claude plugin install documentation-standards
\claude plugin install git-pr-workflows
\claude plugin install security-scanning
\claude plugin install startup-business-analyst
\claude plugin install systems-programming
```

### 4. Install Plugins from `VoltAgent/awesome-claude-code-subagents`

```bash
\claude plugin install voltagent-core-dev
\claude plugin install voltagent-lang
\claude plugin install voltagent-infra
\claude plugin install voltagent-dev-exp
\claude plugin install voltagent-biz
\claude plugin install voltagent-meta
\claude plugin install voltagent-research
```

### 5. Install `rust-skills` (Non-Standard Plugin via Git Clone)

This plugin is not available through the marketplace. Install it by cloning directly:

```bash
git clone https://github.com/leonardomso/rust-skills.git ~/.claude/skills/rust-skills
```

### 6. Verify Installation

After completing the steps, verify everything is installed:

```bash
\claude plugin marketplace list
\claude plugin list
```

Confirm the following appear in the output:

- Marketplaces: `anthropic-agent-skills`, `claude-code-workflows`, `voltagent-subagents`
- All plugins listed in steps 2–4 (status: ✔ enabled)
- `rust-skills` present under `~/.claude/skills/`

## Notes

- If any `claude plugin install` command fails, check that the marketplace was added successfully first (`\claude plugin marketplace list`).
- The correct CLI subcommands are `claude plugin marketplace` (not `claude marketplace`) and `claude plugin install` (not `claude marketplace install`).
- Re-run this skill after a Claude CLI upgrade to ensure all plugins are still active.
