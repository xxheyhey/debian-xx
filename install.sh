#!/bin/bash

username=$(id -u -n 1000)

echo .gitconfig setup:
echo What is your name? \(With capital first letter\)
read name
echo What is your email?
read email
echo What is your preferred editor? \(nano, nvim, vim, etc.\)
read editor

cat <<EOT >> .gitconfig
[user]
	name = $name
	email = $email
[core]
	editor = $editor
EOT
mv .gitconfig /home/$username/


cp .bashrc /home/$username/.bashrc
cp .profile /home/$username/.profile
cp .tmux* /home/$username/
cp .x* /home/$username/
cp .fehbg /home/$username/
cp -R suckless/ /home/$username/
cp -R wallpapers/ /home/$username/
cp -R .config/ /home/$username/
cp -R .local/ /home/$username/
cp -R .unison/ /home/$username/

mkdir /home/$username/personal
mkdir /home/$username/Desktop
mkdir /home/$username/Downloads
mkdir /home/$username/Github
mkdir -p /home/$username/mounts/windows
mkdir /home/$username/mounts/wsl

mkdir /lib/x86_64-linux-gnu/ntfs-3g
cp ntfs-plugin-9000001a.so /lib/x86_64-linux-gnu/ntfs-3g/

chown -R $username:$username /home/$username

apt update
apt upgrade -y
apt dist-upgrade -y
apt autoremove -y
apt autoclean -y

apt install xorg r-base r-base-dev unison ntfs-3g thermald rofi evince papirus-icon-theme bluetooth blueman network-manager network-manager-gnome xbindkeys vlc htop fonts-ubuntu alsa-utils thunar picom alacritty libxft-dev libxinerama-dev git network-manager feh curl build-essential gettext unzip cmake xclip seqkit ninja-build python3 python3-dev python3-pip fzf fd-find tmux -y

wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
mv thorium.list /etc/apt/sources.list.d/
apt update
apt install thorium-browser -y

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

wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/Release.key | gpg --dearmor |  tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/ ./" |  tee /etc/apt/sources.list.d/onedrive.list
apt update
apt install --no-install-recommends --no-install-suggests onedrive -y


git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
cd .. && rm -rf neovim

cd /home/$username/suckless/dmenu/ && make clean install
cd /home/$username/suckless/dwm/ && make clean install
cd /home/$username/suckless/slstatus/ && make clean install
cd /home/$username/suckless/st/ && make clean install


ln -s $(which fdfind) /home/$username/.local/bin/fd

rm /etc/systemd/user/default.target.wants/onedrive.service


apt autoremove -y
apt clean
apt autoclean -y
