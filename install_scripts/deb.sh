#!/bin/bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#                    MAKE SURE TO RUN THIS SCRiPT WITH SUDO PRIVILEGE
#
#===============================================================================

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts

echo "NOTE: you already have all the dependencies? run neovim.sh and symlink.sh to begin linking"

echo "Select your linux distro:"
select choice in "Arch" "Ubuntu" "Fedora"; do
  echo "Selected distrobution: $choice"
    case $choice in
        Arch)
            source ~/dotfiles/install_scripts/arch.sh
            ;;
        Ubuntu)
            source ~/dotfiles/install_scripts/ubuntu.sh
            ;;
        Fedora)
            source ~/dotfiles/install_scripts/fedora.sh
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
