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
- `coding-style.md` — global formatting defaults (tabs, minimal changes, readability over compactness).
- `instructions/language-style.md` — JS/TS/Go-specific rules.
- `skills/` — shared agent skills.

`.config/opencode/`, `.copilot/`, and `.codex/` symlink into `.config/agents/` so style guides and skills only need to be maintained once. Keep tool-specific config files (e.g. `.config/opencode/opencode.json`) in their native folders.

### Install Scripts

- `install_scripts/common.sh` — shared helpers (`repo_root`, `ensure_command`).
- `install_scripts/symlink.sh` — non-destructive Stow flow with backup.
- `install_scripts/deb.sh` — dispatches to `fedora.sh` for full installs.
- `install_scripts/fedora.sh` — `dnf`-based package installation.
- `install_scripts/extras.sh` — lazygit (COPR) and oh-my-posh.

Scripts derive `REPO_ROOT` from their own location; never assume `~/dotfiles`.

## Coding Style

From `.config/agents/coding-style.md`:
- Tabs for indentation by default.
- Minimal, local changes — don't touch adjacent code unless necessary.
- Match existing project style when it conflicts with these defaults.

## Notes

- Ignore `.config/opencode/node_modules/` during searches — it's vendored noise.
- `.config/opencode/opencode.json` references `.github/*.md` paths that do not exist in this repo.
- Some shell and app configs contain machine-specific paths.
