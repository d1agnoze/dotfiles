# AGENTS

This folder contains shared agent instructions for OpenCode and other agents that can read local agent guidance.

## OpenCode Only

These instructions apply only to the OpenCode agent. Other agents that may read this file, such as Copilot or Claude, should ignore this section.

- When researching, gathering requirements, or filling in missing context, prefer interviewing the user with the `question` tool instead of making avoidable assumptions.
- Ask short, targeted questions when the answer would materially change the implementation, investigation, or recommendation.
- Do not interrupt straightforward execution for information that is already clear from the repo, the user's request, or prior answers.

# Pull Requests

**After creating PRs, end the response with a bare list of their URLs — nothing else.**

One URL per line, in a fenced code block with **no language tag** (a language tag adds a Run button;
this block is for copying, not running). No bullets, no numbering, no repo names, no titles, no
markdown link syntax, no commentary inside the block:

```
https://github.com/dikasoft/pawdo-backend/pull/1036
https://github.com/dikasoft/pawdo-admin/pull/451
https://github.com/dikasoft/pawdo-inhouse/pull/923
```

**Why:** I feed that block straight into my own review workflow, which is faster than opening each
link by hand. Anything mixed into a line — a repo name, a dash, a description — has to be stripped
out first, and losing the line breaks defeats it entirely: bare URLs written as ordinary markdown get
joined into a single paragraph. The code fence is what guarantees the breaks survive rendering and
that the block selects cleanly in one drag.

**How to apply:** put the block last, after any summary. It applies to a single PR too — one line,
same format. This is the one place that overrides the usual "reference a PR as a markdown link"
convention; prose above the block can still use markdown links freely. When review or merge order
matters, order the lines accordingly and say so in the prose, never inside the block.
