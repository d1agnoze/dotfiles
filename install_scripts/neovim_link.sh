#! /bin/bash
echo "linking neovim configs"
rm -rf ~/.config/nvim/lua/custom
ln -sf ~/dotfiles/.config/nvim/lua/custom/ ~/.config/nvim/lua/
