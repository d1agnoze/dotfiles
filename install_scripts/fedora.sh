#!/bin/bash
echo "Installing programs...."
sudo dnf update -y
sudo dnf install -y tmux ripgrep python3-pip neofetch ranger fzf highlight grc fuse stow btop go neovim python3-neovim kitty
