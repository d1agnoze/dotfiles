echo "Installing programs"
sudo apt install tmux
sudo apt install nodejs npm
sudo apt install python
sudo apt install gcc make ripgrep cmake
sudo apt install python3-venv 
sudo apt install neofetch ranger
echo "Installing peaclock"
sudo apt install build-essential 
sudo apt install libpthread-stubs0-dev
sudo apt install libicu-dev
workdir = $( pwd )
git clone https://github.com/octobanana/peaclock.git ~/peaclock && cd ~/peaclock && ./RUNME.sh install
cd $workdir
