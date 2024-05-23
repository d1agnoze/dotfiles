update_neovim_linux() {
    echo -e "Updating Neovim on Linux...\nMake sure you have the following dependencys installed: \033[33mcurl, jq, fuse, fzf\033[0m"

    # Download the latest Neovim release from GitHub
    LATEST_RELEASE=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.tag_name')
    
    echo -e "\033[32mLatest Neovim release: ${LATEST_RELEASE}\033[0m"
    selectMenu=$(echo -e "Yes\nNo" | fzf --prompt="Proceed with installation?: " --height=30% --layout=reverse --border)

    if [ "$selectMenu" == "Yes" ]; then
      DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/${LATEST_RELEASE}/nvim.appimage"
      echo "Proceeding with download and installation..."
      echo "Downloading from: ${DOWNLOAD_URL}"

      curl -LO ${DOWNLOAD_URL}

      sudo chmod +x nvim.appimage
      sudo rm -rf /usr/local/bin/nvim
      sudo mv nvim.appimage /usr/local/bin/nvim

      echo -e "\033[32mNeovim updated successfully to version ${LATEST_RELEASE}.\033[0m\n"
    else
      echo -e "\033[33mInstallation aborted by the user.\033[0m\n"
    fi
}

update_neovim_linux
