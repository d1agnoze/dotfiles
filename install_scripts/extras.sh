#!/usr/bin/env bash

set -euo pipefail

if ! command -v dnf >/dev/null 2>&1; then
  echo "dnf is required for the Fedora extras script."
  exit 1
fi

echo "Installing Fedora extras..."
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

if command -v oh-my-posh >/dev/null 2>&1; then
  echo "oh-my-posh is already installed."
else
  bash -c "$(curl -fsSL https://ohmyposh.dev/install.sh)"
fi
