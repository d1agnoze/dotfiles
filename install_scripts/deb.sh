#!/bin/bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#                    MAKE SURE TO RUN THIS SCRiPT WITH SUDO PRIVILEGE
#
#===============================================================================

echo "Getting Neovim...."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod a+x nvim.appimage
sudo mv neovim.appimage /usr/local/bin/nvim
install nvchad
echo "Installing nvchad ,make sure you have nerd font installed"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

echo "Select your linux distro:"
select distro in "Arch" "Ubuntu"; do
    case $distro in
        Arch)
            package_manager="pacman -S "
            break
            ;;
        Ubuntu)
            package_manager="apt install"
            break
            ;;
        *)
            echo "Vui lòng chọn 1 hoặc 2."
            ;;
    esac
done

echo "Selected distrobution: $distro"
echo "Using $package_manager to install programs"

echo "Installing programs"
sudo $package_manager tmux
sudo $package_manager nodejs npm
sudo $package_manager python
sudo $package_manager gcc make ripgrep
pip install virtualenv
if [ "$distro" == "Ubuntu"]; then
  sudo $package_manager python3-venv 
fi
sudo $package_manager tmux
exit 0
