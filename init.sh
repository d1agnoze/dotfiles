sudo chmod -R 777 ~/dotfiles/install_scripts
sudo chmod -R 777 ~/dotfiles/preset-scripts

# Acsii color code
#34:blue
#33: yellow
#32: green
#31: red
echo -e "\e[0;34mInstall options (neovim only, full-system setup):\e[0m"
select distro in "Neovim" "Full"; do
    echo -e "\e[0;32mInstalling neovim\e[0m"
    ~/dotfiles/install_scripts/neovim.sh.sh
    case $distro in
        Neovim)
            break
            ;;
        Full)
            echo -e "\e[0;32mRunning scripts to install dependencies...\e[0m"
            ~/dotfiles/install_scripts/deb.sh
            break
            ;;
        *)
            echo "Please select one of the options"
            ;;
    esac
done
