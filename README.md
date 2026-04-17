# Dotfiles

GNU Stow-based personal dotfiles for shell, tmux, Neovim, kitty, and related CLI tools.

## Prerequisites
- `git`
- `bash`
- `stow` for `Symlink only`
- `dnf` for `Full system install (Fedora only)` and `Install extras (Fedora only)`

## Usage
Clone the repo wherever you want, then run:

```bash
cd /path/to/dotfiles
./init.sh
```

The menu currently provides:
- `Symlink only`
- `Full system install (Fedora only)`
- `Install extras (Fedora only)`

## What The Scripts Do
### Symlink only
- Previews a GNU Stow adopt plan before applying it.
- Backs up existing conflicting files into `~/.dotfiles-backups/<timestamp>/` instead of deleting them.
- Optionally installs the tmux plugin manager.
- Optionally removes `~/.local/share/nvim` to force a clean Neovim plugin reinstall.

### Full system install (Fedora only)
- Runs `dnf update`.
- Installs the base packages used by this setup.
- Runs the symlink flow afterward.

### Install extras (Fedora only)
- Installs `lazygit` from COPR.
- Installs `oh-my-posh` if it is not already available.

## Installed Packages In Full System Install
If you are using a distro that is not supported by the scripts, install the equivalent packages manually:

- `stow`
- `tmux`
- `ripgrep`
- `python3-pip`
- `ranger`
- `fzf`
- `highlight`
- `grc`
- `fuse`
- `python3-neovim`
- `kitty`
- `git-delta`
- `meld`
- `zoxide`
- `fastfetch`

## Neovim Profiles
- `nvim` uses `.config/nvim/`
- `vim` is aliased to `NVIM_APPNAME=nvim-core nvim`, which uses `.config/nvim-core/`

## Notes
- This repo is meant to be stowed into `$HOME`.
- Some shell and app configs still contain machine-specific paths and optional tool assumptions.
- There is no repo-level CI; verify changes with the relevant local tool when needed.
