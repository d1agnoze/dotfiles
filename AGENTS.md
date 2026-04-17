# AGENTS

## Repo Shape
- This is a GNU Stow-style dotfiles repo: paths at repo root map onto `$HOME` when stowed.
- `.stow-local-ignore` excludes `README*`, `init.sh`, and `install_scripts/` from symlinking.
- The main bootstrap entrypoint is `./init.sh`; it offers `Symlink only`, `Full system install (Fedora only)`, and `Install extras (Fedora only)`.

## Setup Commands
- The install scripts now derive the repo root from the script location instead of assuming `~/dotfiles`.
- `Full system install` and `Install extras` are explicitly Fedora-only: `install_scripts/deb.sh` dispatches to `fedora.sh`, and `extras.sh` requires `dnf`.
- `symlink.sh` is no longer destructive by default: it moves existing conflicting files into `~/.dotfiles-backups/<timestamp>/` before running Stow.
- The Stow flow is preview with `stow --dir="$REPO_ROOT" --target="$HOME" --adopt -nv .`, then apply with `stow --dir="$REPO_ROOT" --target="$HOME" --adopt .` after confirmation.

## Key Config Boundaries
- There are two Neovim configs: `.config/nvim/` and `.config/nvim-core/`.
- Default `nvim` uses `.config/nvim/`. Shell alias `vim='NVIM_APPNAME=nvim-core nvim'` switches `vim` to the separate `.config/nvim-core/` profile.
- `.config/nvim/` is the richer active config: `init.lua` bootstraps `lazy.nvim`, loads NvChad `v2.5`, and imports local plugins from `lua/plugins/`.

## Verification
- There is no repo-level CI, test, or lint harness checked in here; verify changes by reading the relevant config and, when needed, using the exact local tool the file expects.
- For `.config/nvim/**/*.lua`, the only checked-in formatter config I found is `.config/nvim/.stylua.toml`.

## Agent Notes
- Ignore `.config/opencode/node_modules/` during searches; it is vendored dependency noise inside this dotfiles repo.
- `.config/opencode/opencode.json` references `.github/*.md` and `.github/instructions/*.md`, but those paths do not currently exist in this repo.
