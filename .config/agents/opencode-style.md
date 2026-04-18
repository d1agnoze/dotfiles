# OpenCode Global Coding Style

Apply these defaults unless the target project already defines a formatter, linter, or established local convention. When a project has explicit formatting or style rules, follow the project first.

## Global Rules

- Use tabs for indentation by default.
- Keep changes minimal and local to the task.
- Prefer one-line functions or one-line control flow only when the logic stays simple and readable.
- Do not force one-line style onto complex logic.
- Preserve existing project structure and naming unless there is a clear reason to change it.

## Readability

- Prefer compact code for straightforward transformations and guards.
- Expand code when multiple branches, multi-step logic, or dense literals would become harder to read in one line.
- Avoid stylistic rewrites that do not improve the result for the current task.
