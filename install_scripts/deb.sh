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

echo "Select your linux distro:"
select distro in "Arch" "Ubuntu"; do
  echo "Selected distrobution: $distro"
    case $distro in
        Arch)
            source ~/dotfiles/install_scripts/arch.sh
            break
            ;;
        Ubuntu)
            source ~/dotfiles/install_scripts/ubuntu.sh
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

nvm install --lts

exit 0
