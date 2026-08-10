---
name: ewc-workspaces
description: Manage logical development workspaces spanning multiple independent Git repositories with the ewc CLI. Use when an agent needs to initialize or validate ewc.json, create, inspect, enter, run commands in, or safely remove an EWC workspace backed by Worktrunk.
---

# EWC Workspaces

Use `ewc` as the workspace-level interface. It delegates each repository worktree operation to Worktrunk (`wt`); do not substitute `git worktree` commands.

## Prepare

1. Run `ewc doctor --json` to confirm that `git` and `wt` are available.
2. From the directory containing `ewc.json`, run `ewc validate` before creating or changing a workspace.
3. If `ewc.json` does not exist, run `ewc init` to create an empty configuration, or `ewc init --discover` only when every immediate Git-child repository has a resolvable `origin/HEAD`. Then review and complete the configuration before continuing.

Keep repository paths outside `workspace_root`. Give each repository an explicit `default_branch`. Use safe lowercase-slug workspace names such as `stale-shipment`.

## Create and use a workspace

Create all configured repositories:

```sh
ewc create stale-shipment
```

Create a dependency-valid subset or choose one base branch for all selected repositories:

```sh
ewc create stale-shipment --repos backend,frontend
ewc create stale-shipment --base release/2026-08
```

Inspect a workspace before acting in it:

```sh
ewc list
ewc status stale-shipment
ewc path stale-shipment
```

Enter the workspace root with the safely quoted command emitted by EWC:

```sh
eval "$(ewc open stale-shipment --shell-command)"
```

Run a command at the workspace root, in selected repositories, or in all repositories:

```sh
ewc exec stale-shipment -- task test
ewc exec stale-shipment --repos backend,frontend -- go test ./...
ewc exec stale-shipment --all --parallel 4 -- git status --short
```

Place `--json` before positional arguments when another program or agent needs a stable single-object response. Treat diagnostics written to stderr as separate from JSON output.

## Removal safeguards

Before removal, run `ewc status <workspace>` and commit, stash, or otherwise resolve every dirty worktree. EWC also refuses removal when a worktree is missing, its checked-out branch differs from the workspace branch, or its branch has commits not reachable from its recorded base.

Only run the destructive operation after those checks succeed:

```sh
ewc remove stale-shipment
```

Do not use `--keep-branches`: the current EWC/Worktrunk integration cannot remove worktrees while retaining branches. Do not delete workspace directories manually; let EWC and Worktrunk perform the coordinated cleanup.

## Failure handling

If creation fails, report the command output and inspect `ewc list`, `ewc status <workspace>`, and the source repositories before retrying. EWC rolls back worktrees it created, but retain the workspace directory and metadata until the cause is understood. Never bypass a missing `wt` installation with direct Git worktree commands.
