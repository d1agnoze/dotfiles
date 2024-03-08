#!/bin/bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#                    MAKE SURE TO RUN THIS SCRiPT WITH SUDO PRIVILEGE
#
#===============================================================================
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
            echo "Vui lòng chọn 1 hoặc 2."
            ;;
    esac
done
~/dotfiles/install_scripts/symlink.sh
exit 0
