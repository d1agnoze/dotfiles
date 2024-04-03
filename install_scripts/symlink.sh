#==============
# Delete existing dot files and folders
#==============
"Delete existing dot files"
sudo rm -rf ~/.tmux > /dev/null 1>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

echo "Linking bashrc"
sudo rm -f ~/.bashrc
sudo rm -f ~/.profile
sudo rm -f ~/.bash_aliases

echo "linking tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -n 'type this in terminal if tmux is already running \ntmux source ~/.tmux.conf'

stow -D .
stow --adopt .
