# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

GNU Stow-based personal dotfiles. Paths at the repo root map directly onto `$HOME` when stowed. The main entrypoint is `./init.sh`, which offers an interactive menu for symlinking or full system install.

## Bootstrap

```bash
./init.sh          # interactive: Symlink only / Full install (Fedora) / Install extras (Fedora)
```

`Symlink only` previews a Stow adopt plan, backs up conflicts to `~/.dotfiles-backups/<timestamp>/`, then applies. It also offers to clone the tmux plugin manager and wipe existing Neovim plugins.

Stow excludes `README*`, `init.sh`, and `install_scripts/` (see `.stow-local-ignore`).

## Verification

No CI, no test harness. Verify changes by reading the relevant config and, when needed, running the specific tool that consumes it (e.g. `nvim`, `tmux source ~/.tmux.conf`, `bash -n <file>`).

Lua files under `.config/nvim/` can be formatted with `stylua` using `.config/nvim/.stylua.toml`.

## Key Architecture

### Neovim Profiles

Two separate configs coexist:
- `.config/nvim/` — main profile: NvChad v2.5 via `lazy.nvim`, local plugins in `lua/plugins/`, custom options/mappings in `lua/options.lua` and `lua/mappings.lua`.
- `.config/nvim-core/` — minimal profile: accessed via the shell alias `vim='NVIM_APPNAME=nvim-core nvim'`.

### Shared AI Agent Config

`.config/agents/` is the single source of truth for agent instructions:
- `AGENTS.md` — PR conventions and general coding guidelines. Loaded on every turn, so it stays thin.
- `instructions/` — per-language style rules, loaded only when the work touches that language.
- `skills/` — shared agent skills.

The style guides were cleared on 2026-09-18 and are being rewritten from scratch; `instructions/` is
empty until that lands. Until then there is no checked-in style guidance for any language.

`.config/opencode/`, `.copilot/`, and `.codex/` symlink into `.config/agents/` so style guides and skills only need to be maintained once. Keep tool-specific config files (e.g. `.config/opencode/opencode.json`) in their native folders.

### Install Scripts

- `install_scripts/common.sh` — shared helpers (`repo_root`, `ensure_command`).
- `install_scripts/symlink.sh` — non-destructive Stow flow with backup.
- `install_scripts/deb.sh` — dispatches to `fedora.sh` for full installs.
- `install_scripts/fedora.sh` — `dnf`-based package installation.
- `install_scripts/extras.sh` — lazygit (COPR) and oh-my-posh.

Scripts derive `REPO_ROOT` from their own location; never assume `~/dotfiles`.

## Coding Style

No style guide is checked in right now — see the note under *Shared AI Agent Config*. Match the
surrounding file until `instructions/` is repopulated.

## Notes

- Ignore `.config/opencode/node_modules/` during searches — it's vendored noise.
- `.config/opencode/opencode.json` references `.github/*.md` paths that do not exist in this repo.
- Some shell and app configs contain machine-specific paths.
