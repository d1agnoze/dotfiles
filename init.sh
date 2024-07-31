sudo chmod -R 777 ~/dotfiles/install_scripts
orginal_PS3="$PS3"

# Acsii color code
#34:blue
#33: yellow
#32: green
#31: red

echo -e "\e[0;34mInstall options:\e[0m"
PS3=$'\e[0;33mPlease select one of the options: \e[0m'
select choice in "Neovim and symlink only" "Full system install" "Update Neovim" "Install Extras" "Exit the script"; do
    case $choice in
        "Neovim and symlink only")
            source ~/dotfiles/install_scripts/neovim.sh
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        "Full system install")
            echo -e "\e[0;32mRunning scripts to install dependencies...\e[0m"
            source ~/dotfiles/install_scripts/deb.sh
            source ~/dotfiles/install_scripts/neovim.sh
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        "Update Neovim")
            source ~/dotfiles/install_scripts/update_neovim.sh
            break
            ;;
        "Install Extras")
            source ~/dotfiles/install_scripts/extras.sh
            break
            ;;
        "Exit the script")
            break
            ;;
        *)
            echo "Please select one of the options"
            ;;
    esac
done

PS3="$orginal_PS3"
