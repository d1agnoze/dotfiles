# AGENTS

This folder contains shared agent instructions for OpenCode and other agents that can read local agent guidance.

## Style Guides

Apply these defaults unless the target project already defines its own formatter, linter, or established local conventions. Follow project-specific rules first when they conflict with these shared defaults.

### Global Rules

- Use tabs for indentation by default.
- Keep changes minimal and local to the task.
- Prefer one-line functions or one-line control flow only when the logic stays simple and readable.
- Do not force one-line style onto complex logic.
- Preserve existing project structure and naming unless there is a clear reason to change it.

### Readability

- Prefer compact code for straightforward transformations and guards.
- Expand code when multiple branches, multi-step logic, or dense literals would become harder to read in one line.
- Avoid stylistic rewrites that do not improve the result for the current task.

### JavaScript and TypeScript

- Use tabs for indentation.
- Use double quotes.
- Do not use semicolons.
- Use trailing commas where supported.
- Prefer `function` declarations or function expressions for named logic and non-trivial callbacks.
- Arrow functions are fine for short inline callbacks, especially in `map`, `filter`, `reduce`, event handlers, and similar callsites.
- Follow the surrounding file or project style when it already has a clear function-style convention.
- Prefer `interface` over `type` when both are valid and the shape is object-like.
- Prefer `null` over `undefined` when choosing an explicit empty value.
- Prefer `async`/`await` over raw promise chains.
- Prefer concise one-line guards and short transformations when readability stays good.

```ts
if (!config.appSetting) throw new Error("Something went wrong")
const out = listOrder.map(o => ({ ...o.Items, appContext: currentAppContext }))
```

### Go

- Let `gofmt` decide formatting.
- Use lowercase error messages.
- Wrap errors with `fmt.Errorf("... %w", err)` only when the extra context is useful for internal error handling and composition with the `errors` package.
- Use `context.Context` as the first argument when a function performs API calls or database operations.
- Prefer table-driven tests.
- Prefer small functions.
- Prefer `slog` over `log`, unless the project is very small and log levels are not needed.
- Do not wrap logging lines. Keep `log` and `slog` calls on a single line even when the message or arguments are long.
- Prefer concise one-line forms when they remain readable.
- Prefer short `if` statements with an initializer when the initialized value is only used by that condition.

```go
if v := math.Pow(x, n); v < lim { return v }
slog.InfoContext(app.Context, "Very long message", "error", err, "data", data)
```

Struct literals: one-line for fewer than 2 fields; multi-line for 2 or more fields.

```go
out := response{Status: true, Data: orders}

out := response{
	App:     app,
	Data:    orders,
	Message: "it worked",
}
```

HTTP handlers: declare request body/query/param structs inside the handler if only used there; use short local names `b`, `q`, `p`.

```go
func handleOrderDelete(c *fiber.Ctx) error {
	type body struct {
		ID string `json:"id"`
	}
	var b body
	// ...
}
```

GORM repository functions: prefer returning only `error` for create/update; accept a pointer to the model when creation or update mutates the entity.

```go
func CreateOrder(ctx context.Context, order *Order) error {
	return db.WithContext(ctx).Create(order).Error
}
```

## OpenCode Only

These instructions apply only to the OpenCode agent. Other agents that may read this file, such as Copilot or Claude, should ignore this section.

- When researching, gathering requirements, or filling in missing context, prefer interviewing the user with the `question` tool instead of making avoidable assumptions.
- Ask short, targeted questions when the answer would materially change the implementation, investigation, or recommendation.
- Do not interrupt straightforward execution for information that is already clear from the repo, the user's request, or prior answers.

# Coding Guidelines

Behavioral guidelines to reduce common LLM coding mistakes, derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.
