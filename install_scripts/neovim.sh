echo "Getting Neovim...."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod a+x nvim.appimage
sudo mv neovim.appimage /usr/local/bin/nvim

#install nvchad
echo "Installing neovim profile, make sure you have nerd font installed"

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

#symlink
echo "linking neovim configs"
ln -sf ~/dotfiles/.config/nvim/ ~/.config/nvim/
