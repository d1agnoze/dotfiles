#==============
# Delete existing dot files and folders
#==============
echo -e "\e[1;91mDelete existing dot files\e[0m"
sudo rm -rf ~/.tmux > /dev/null 1>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

echo -e "\e[1;94mRemoving previous rcs\e[0m"
sudo rm -f ~/.bashrc
sudo rm -f ~/.profile
sudo rm -f ~/.bash_aliases
sudo rm -f ~/.bash_profile

echo -e "\e[1;94mDownload tmux plugins?\e[0m"
select yn in "Yes" "No"; do
  case $yn in
    Yes) echo -e "\e[1;93mDowloading tmux plugins manager\e[0m"; sudo rm -f ~/.tmux/plugins/tpm; git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; echo -e "type this in terminal if tmux is already running "; echo -e "\e[1;92mtmux source ~/.tmux.conf \e[0m";;
    No ) break ;;
      *) echo "Invalid option";;
    esac
done

echo -e "\e[1;94mRemoving existing neovim config\e[0m"
rm -rf ~/.config/nvim
echo -e "\e[1;94mDo you wish to delete existing neovim plugins?\e[0m"
select yn in "Yes" "No"; do
    case $yn in
      Yes ) rm -rf ~/.local/share/nvim; break;;
      No ) break ;;
      *) echo "Invalid option";;
    esac
done

#==============
# Linking dot files
#==============
echo -e "\e[1;92mLinking using stow\e[0m"
cd ~/dotfiles/
stow -D .
stow .
cd -
