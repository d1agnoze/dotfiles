#!/bin/bash
echo "Installing programs...."
sudo dnf update -y
sudo dnf install -y tmux
sudo dnf install -y gcc make ripgrep cmake
sudo dnf install -y python3 python3-pip
sudo dnf install -y neofetch ranger
sudo dnf install -y fzf zip unzip
sudo dnf install -y highlight grc fuse

