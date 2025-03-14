sudo chmod -R 777 ~/dotfiles/install_scripts
orginal_PS3="$PS3"

# Acsii color code
#34:blue
#33: yellow
#32: green
#31: red

echo -e "\e[0;34mInstall options:\e[0m"
PS3=$'\e[0;33mPlease select one of the options: \e[0m'
select choice in "symlink only" "Full system install" "Install Extras(Fedora Only)" "Exit the script"; do
    case $choice in
        "symlink only")
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        "Full system install")
            echo -e "\e[0;32mRunning scripts to install dependencies...\e[0m"
            source ~/dotfiles/install_scripts/deb.sh
            source ~/dotfiles/install_scripts/symlink.sh
            break
            ;;
        "Install Extras(Fedora Only)")
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
