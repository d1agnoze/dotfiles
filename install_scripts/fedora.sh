#!/usr/bin/env bash

set -euo pipefail

if ! command -v dnf >/dev/null 2>&1; then
  echo "dnf is required for the Fedora install script."
  exit 1
fi

echo "Installing programs..."
sudo dnf update -y
sudo dnf install -y stow tmux ripgrep python3-pip ranger fzf highlight grc fuse python3-neovim kitty git-delta meld zoxide fastfetch
