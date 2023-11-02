#!/bin/bash

echo What is your name? \(With capital first letter\)
read name
echo What is your email?
read email
echo What is your preferred editor? \(nano, nvim, vim, etc.\)
read editor

cat <<EOT >> ~/.gitconfig
[user]
	name = $name
	email = $email
[core]
	editor = $editor
[pull]
	rebase = false
EOT

cp .bashrc ~
cp .profile ~
cp .tmux* ~
cp .x* ~
cp .fehbg ~
cp -r suckless/ ~
cp -r Pictures/ ~
cp -r .config/ ~
cp -r .local/ ~


apt update
apt upgrade -y
apt dist-upgrade -y
apt autoremove -y
apt autoclean -y

apt install evince papirus-icon-theme xorg-dev gfortran libbz2-dev libpcre2-dev libreadline-dev libcurl4-openssl-dev bluetooth blueman network-manager network-manager-gnome xbindkeys vlc htop fonts-ubuntu alsa-utils thunar picom alacritty libxft-dev libxinerama-dev xorg git network-manager feh curl build-essential gettext unzip cmake xclip seqkit ninja-build python3 python3-dev python3-pip fzf fd-find pipx tmux -y

pipx install cmake

wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
mv thorium.list /etc/apt/sources.list.d/
apt update
apt install thorium-browser -y

git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
cd .. && rm -rf neovim

apt update
apt install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=21
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install nodejs -y

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt update
apt install dotnet-sdk-7.0 -y


wget https://cloud.r-project.org/src/base/R-4/R-4.3.2.tar.gz
tar -xf R-4.3.2.tar.gz
cd R-4.3.2/
./configure
make
make install

wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/Release.key | gpg --dearmor |  tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/ ./" |  tee /etc/apt/sources.list.d/onedrive.list
apt update
apt install --no-install-recommends --no-install-suggests onedrive -y

cd ~/suckless/dmenu/ && make clean install
cd ~/suckless/dwm/ && make clean install
cd ~/suckless/slstatus/ && make clean install
cd ~/suckless/st/ && make clean install


git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq &&  ./auto-cpufreq-installer
cd .. && rm -rf auto-cpufreq
auto-cpufreq --install

apt autoremove -y
apt clean
apt autoclean -y