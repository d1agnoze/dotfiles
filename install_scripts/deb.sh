#!/bin/bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#                    MAKE SURE TO RUN THIS SCRiPT WITH SUDO PRIVILEGE
#
#===============================================================================

echo "NOTE: you already have all the dependencies? run neovim.sh and symlink.sh to begin linking"

echo "Select your linux distro:"
select choice in "Fedora"; do
  echo "Selected distrobution: $choice"
    case $choice in
        Fedora)
            source ~/dotfiles/install_scripts/fedora.sh
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
