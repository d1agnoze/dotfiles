# this file have not been tested

echo "Installing base dependencies"
sudo pacman -S tmux
sudo pacman -S nodejs npm
sudo pacman -S python python-pip
sudo pacman -S gcc make ripgrep 
sudo pacman -S neofetch
sudo pacman -S ranger
sudo pacman -S fzf
sudo pacman -S highlight grc
sudo pacman -S zip unzip


#yay no long needed since EndeavourOS have it in installation process
#uncomment these if you need yay
#
#
# echo "Installing yay"
# pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

