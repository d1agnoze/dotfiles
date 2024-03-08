echo "Getting Neovim...."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod a+x nvim.appimage
sudo mv neovim.appimage /usr/local/bin/nvim

#install nvchad
echo "Installing neovim profiles, make sure you have nerd font installed"

rm -rf ~/.config/nvims
rm -rf ~/.local/share/nvim

#core
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
rm -rf ~/.config/nvim
git clone https://github.com/d1agnoze/Mininal.nvim.git ~/dotfiles/.config/nvim
echo "Remeber to run :PlugInstall on default profiles"

#Nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvims/Nvchad --depth 1

#symlink
echo "linking neovim configs"
rm -rf ~/.config/nvims/Nvchad/lua/custom
ln -sf ~/dotfiles/.config/nvims/Nvchad/lua/custom/ ~/.config/nvims/Nvchad/lua/
ln -sf ~/dotfiles/.config/nvim/ ~/.config/nvim/
