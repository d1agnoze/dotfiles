#==============
# Delete existing dot files and folders
#==============
"Delete existing dot files"
sudo rm -rf ~/.tmux > /dev/null 1>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

echo "Linking bashrc"
sudo rm -f ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

echo "linking tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

echo -n 'type this in terminal if tmux is already running \ntmux source ~/.tmux.conf'

echo "Linking gitconfig"
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

echo "Linking neofetch config"
ln -sf ~/dotfiles/.config/neofetch/ ~/.config/
