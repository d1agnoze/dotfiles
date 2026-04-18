# AGENTS

This folder contains shared agent instructions for OpenCode and other agents that can read local agent guidance.

## Shared Style Guides

- `opencode-style.md` contains the global coding style defaults.
- `instructions/language-style.md` contains JavaScript, TypeScript, and Go-specific style rules.

## Usage

- Apply these defaults unless the target project already defines its own formatter, linter, or established local conventions.
- Follow project-specific rules first when they conflict with these shared defaults.

## OpenCode Only

These instructions apply only to the OpenCode agent. Other agents that may read this file, such as Copilot or Claude, should ignore this section.

- When researching, gathering requirements, or filling in missing context, prefer interviewing the user with the `question` tool instead of making avoidable assumptions.
- Ask short, targeted questions when the answer would materially change the implementation, investigation, or recommendation.
- Do not interrupt straightforward execution for information that is already clear from the repo, the user's request, or prior answers.
