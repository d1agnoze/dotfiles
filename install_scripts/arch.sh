echo "Installing base dependencies"
sudo pacman -S tmux
sudo pacman -S nodejs npm
sudo pacman -S python
sudo pacman -S gcc make ripgrep 
sudo pacman -S neofetch
sudo pacman -S ranger
echo "Installing yay"
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
echo "Installing peaclock, please select peaclock from the AUR list"
yay peaclock

