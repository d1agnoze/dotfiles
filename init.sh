#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"

# shellcheck source=install_scripts/common.sh
source "$REPO_ROOT/install_scripts/common.sh"

original_PS3="${PS3-}"

# Acsii color code
#34:blue
#33: yellow
#32: green
#31: red

echo -e "\e[0;34mInstall options:\e[0m"
PS3=$'\e[0;33mPlease select one of the options: \e[0m'
select choice in "Symlink only" "Full system install (Fedora only)" "Install extras (Fedora only)" "Exit the script"; do
    case $choice in
        "Symlink only")
            source "$REPO_ROOT/install_scripts/symlink.sh"
            break
            ;;
        "Full system install (Fedora only)")
            echo -e "\e[0;32mRunning scripts to install dependencies...\e[0m"
            source "$REPO_ROOT/install_scripts/deb.sh"
            source "$REPO_ROOT/install_scripts/symlink.sh"
            break
            ;;
        "Install extras (Fedora only)")
            source "$REPO_ROOT/install_scripts/extras.sh"
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

PS3="$original_PS3"
