#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install gfortran libbz2-dev libpcre2-dev libreadline-dev libcurl4-openssl-dev bluetooth blueman network-manager network-manager-gnome xbindkeys vlc htop fonts-ubuntu alsa-utils thunar picom alacritty libxft-dev libxinerama-dev xorg git network-manager feh curl build-essential gettext unzip cmake xclip seqkit ninja-build python3 python3-dev python3-pip fzf fd-find pipx tmux -y

pipx install cmake

wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
sudo mv thorium.list /etc/apt/sources.list.d/
sudo apt update
sudo apt install thorium-browser -y

git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd .. && rm -rf neovim

sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=21
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install nodejs -y

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install dotnet-sdk-7.0 -y


wget https://cloud.r-project.org/src/base/R-4/R-4.3.2.tar.gz
tar -xf R-4.3.2.tar.gz
cd R-4.3.2/
./configure
make
sudo make install

wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
sudo apt update
sudo apt install --no-install-recommends --no-install-suggests onedrive -y

cd ~/suckless/dmenu/ && sudo make clean install
cd ~/suckless/dwm/ && sudo make clean install
cd ~/suckless/slstatus/ && sudo make clean install
cd ~/suckless/st/ && sudo make clean install

sudo apt autoremove -y
sudo apt clean
sudo apt autoclean -y


# nog doen
# blast installeren
# iqtree installeren
# alle files op drive kopieren
# Mason lsp's installeren
# .xbindkeysrc
# backlight control (try xbacklight or light for example)
# bluetooth setup (blueman-manager)
# IF NECESSARY: pair bluetooth keys between windows and linux
# bluetooth system tray
#!/bin/bash

