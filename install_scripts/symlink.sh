#==============
# Delete existing dot files and folders
#==============
echo "\e[1;91mDelete existing dot files\e[0m"
sudo rm -rf ~/.tmux > /dev/null 1>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

echo "\e[1;94mRemoving previous rcs\e[0m"
sudo rm -f ~/.bashrc
sudo rm -f ~/.profile
sudo rm -f ~/.bash_aliases

echo "\e[1;93mDowloading tmux plugins manager\e[0m"
sudo rm -f ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "type this in terminal if tmux is already running "
echo "\e[1;92mtmux source ~/.tmux.conf \e[0m"

echo "\e[1;94mRemoving previous neovim\e[0m"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

echo "\e[1;92mLinking using stow\e[0m"

cd ~/dotfiles/

stow -D .
stow .

cd -
