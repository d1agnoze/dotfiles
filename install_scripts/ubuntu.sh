#!/bin/bash
echo "Installing programs...."
sudo apt update
sudo apt install -y tmux
sudo apt install -y gcc make ripgrep cmake
sudo apt install -y python3-venv python3-pip python3
sudo apt install -y neofetch ranger
sudo apt install -y build-essential 
sudo apt install -y libpthread-stubs0-dev
sudo apt install -y libicu-dev
sudo apt install -y fzf zip unzip
sudo apt install -y highlight grc fuse

