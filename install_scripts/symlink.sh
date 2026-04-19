#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME:?HOME is not set}"

# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

REPO_ROOT="$(repo_root)"
BACKUP_ROOT="$HOME_DIR/.dotfiles-backups/$(date +%Y%m%d-%H%M%S)"
backup_created=false

backup_path() {
  local target="$1"
  local name
  name="$(basename "$target")"

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ "$backup_created" = false ]; then
      mkdir -p "$BACKUP_ROOT"
      backup_created=true
      echo -e "\e[1;93mBacking up existing files to $BACKUP_ROOT\e[0m"
    fi

    mv "$target" "$BACKUP_ROOT/$name"
	fi
}

cleanup_legacy_copilot_link() {
	local target="$HOME_DIR/.copilot/AGENTS.md"

	if [ ! -e "$target" ] && [ ! -L "$target" ]; then
		return
	fi

	if [ -L "$target" ]; then
		echo -e "\e[1;93mRemoving legacy Copilot symlink $target\e[0m"
		rm "$target"
		return
	fi

	backup_path "$target"
}

ensure_command stow
ensure_command git

echo -e "\e[1;94mPreparing existing dotfiles for stow\e[0m"
cleanup_legacy_copilot_link
backup_path "$HOME_DIR/.tmux.conf"
backup_path "$HOME_DIR/.gitconfig"
backup_path "$HOME_DIR/.bashrc"
backup_path "$HOME_DIR/.profile"
backup_path "$HOME_DIR/.bash_aliases"
backup_path "$HOME_DIR/.bash_profile"
backup_path "$HOME_DIR/.config/nvim"

echo -e "\e[1;94mDownload tmux plugins?\e[0m"
select yn in "Yes" "No"; do
  case $yn in
    Yes)
      echo -e "\e[1;93mDownloading tmux plugin manager\e[0m"
      rm -rf "$HOME_DIR/.tmux/plugins/tpm"
      mkdir -p "$HOME_DIR/.tmux/plugins"
      git clone https://github.com/tmux-plugins/tpm "$HOME_DIR/.tmux/plugins/tpm"
      echo "If tmux is already running, reload it with:"
      echo -e "\e[1;92mtmux source ~/.tmux.conf\e[0m"
      break
      ;;
    No)
      break
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done

echo -e "\e[1;94mDelete existing neovim plugins?\e[0m"
select yn in "Yes" "No"; do
  case $yn in
    Yes)
      rm -rf "$HOME_DIR/.local/share/nvim"
      break
      ;;
    No)
      break
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done

echo -e "\e[1;92mLinking using stow\e[0m"
echo -e "\e[1;92mStow adopt linking plan\e[0m"
stow --dir="$REPO_ROOT" --target="$HOME_DIR" --adopt -nv .

echo -e "\e[1;94mProceed to run stow?\e[0m"
select yn in "Yes" "No"; do
  case $yn in
    Yes)
      stow --dir="$REPO_ROOT" --target="$HOME_DIR" --adopt .
      break
      ;;
    No)
      break
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done
