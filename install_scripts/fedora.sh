#!/bin/bash
echo "Installing programs...."
sudo dnf update -y
sudo dnf install -y stow tmux ripgrep python3-pip ranger fzf highlight grc fuse stow python3-neovim kitty git-delta meld zoxide fastfetch
