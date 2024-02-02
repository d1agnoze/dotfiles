
echo "Getting Neovim...."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod a+x nvim.appimage
sudo mv neovim.appimage /usr/local/bin/nvim
install nvchad
echo "Installing nvchad ,make sure you have nerd font installed"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo "linking neovim configs"
ln -sf ~/dotfiles/.config/nvim/lua/custom/ ~/.config/nvim/lua/
