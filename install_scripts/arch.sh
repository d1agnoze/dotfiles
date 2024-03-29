echo "Installing base dependencies"
sudo pacman -S tmux
sudo pacman -S nodejs npm
sudo pacman -S python
sudo pacman -S gcc make ripgrep 
sudo pacman -S neofetch
sudo pacman -S ranger
sudo pacman -S fzf


#yay no long needed since EndeavourOS have it in installation process
#uncomment these if you need yay
#
#
# echo "Installing yay"
# pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

