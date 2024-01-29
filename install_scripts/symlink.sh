#==============
# Delete existing dot files and folders
#==============
"Delete existing dot files"
sudo rm -rf ~/.tmux > /dev/null 1>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
echo "linking tmux"
ln -sf dotfiles/.tmux.conf ~/.tmux.conf
ln -sf dotfiles/.tmux ~/

echo "linking neovim configs"
ln -sf ~/dotfiles/.config/nvim/lua/custom/ ~/.config/nvim/lua/

echo "Linking gitconfig"
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
