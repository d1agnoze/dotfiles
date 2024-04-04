echo "Do you want to install neovim?"
PS3="Yes or No: "
select opt in yes no; do
  case $opt in
    yes)
      echo "Getting Neovim...."
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
      chmod a+x nvim.appimage
      sudo mv neovim.appimage /usr/local/bin/nvim
      break
      ;;
    no)
      echo "neovim installation canceled"
      break
      ;;
    *) 
      echo "Invalid option"
      ;;
  esac
done
