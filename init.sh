sudo chmod -R 777 ~/dotfiles/install_scripts

# Acsii color code
#34:blue
#33: yellow
#32: green
#31: red

echo -e "\e[0;34mInstall options (symlink only, full-system setup):\e[0m"
select distro in "Symlink" "Full"; do
    echo -e "\e[0;32mInstalling neovim\e[0m"
    ~/dotfiles/install_scripts/neovim.sh.sh
    case $distro in
        Neovim)
            source ~/dotfiles/install_scripts/neovim.sh
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        Full)
            echo -e "\e[0;32mRunning scripts to install dependencies...\e[0m"
            source ~/dotfiles/install_scripts/deb.sh
            source ~/dotfiles/install_scripts/neovim.sh
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        *)
            echo "Please select one of the options"
            ;;
    esac
done
