#!/bin/bash

username=$(id -u -n 1000)

# Add bookworm repository if user is on trixie or sid. This has to be done for
# the installation of picom, which currently does not have a package in the
# Trixie or Sid repositories.
echo Are you on Trixie or Sid? \(y/n\)
read distro
if [[ $distro == "y" ]]; then
   echo "deb http://deb.debian.org/debian/ bookworm main" >> /etc/apt/sources.list
   echo "deb-src http://deb.debian.org/debian/ bookworm main" >> /etc/apt/sources.list
fi


# make .gitconfig file
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


# copy files to home directory
cp dotfiles/.bashrc /home/$username/.bashrc
cp dotfiles/.profile /home/$username/.profile
cp dotfiles/.tmux* /home/$username/
cp dotfiles/.x* /home/$username/
cp dotfiles/.fehbg /home/$username/
cp -R dotfiles/.config/ /home/$username/
cp -R dotfiles/.unison/ /home/$username/
cp -R suckless/ /home/$username/
cp -R wallpapers/ /home/$username/

# make some useful directories
mkdir /home/$username/personal
mkdir /home/$username/Desktop
mkdir /home/$username/Downloads
mkdir /home/$username/Github
mkdir -p /home/$username/.local/bin
mkdir -p /home/$username/mounts/windows
mkdir /home/$username/mounts/wsl


# give user permission to home directory
chown -R $username:$username /home/$username


# update
apt update
apt upgrade -y
apt dist-upgrade -y
apt autoremove -y
apt autoclean -y

# install packages
apt install xorg r-base r-base-dev unison ntfs-3g guestmount thermald rofi evince papirus-icon-theme bluetooth blueman network-manager network-manager-gnome xbindkeys vlc htop fonts-ubuntu alsa-utils thunar picom alacritty libxft-dev libxinerama-dev feh curl build-essential gettext unzip cmake xclip seqkit ninja-build python3 python3-dev python3-pip fzf fd-find tmux -y

# install Thorium browser
wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
mv thorium.list /etc/apt/sources.list.d/
apt update
apt install thorium-browser -y

# install nodejs
apt install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=21
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install nodejs -y

# install dotnet
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt update
apt install dotnet-sdk-7.0 -y

# install OneDrive linux client
wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/Release.key | gpg --dearmor |  tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/ ./" |  tee /etc/apt/sources.list.d/onedrive.list
apt update
apt install --no-install-recommends --no-install-suggests onedrive -y

# install neovim
git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
cd .. && rm -rf neovim

# install suckless software
cd /home/$username/suckless/dmenu/ && make clean install
cd /home/$username/suckless/dwm/ && make clean install
cd /home/$username/suckless/slstatus/ && make clean install
cd /home/$username/suckless/st/ && make clean install

# install auto-cpufreq, but don't install the daemon
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
cd .. && rm -rf auto-cpufreq


# link "fd" to "fdfind" as suggested by fd-find devs
ln -s $(which fdfind) /home/$username/.local/bin/fd

# prevent onedrive to startup automatically
rm /etc/systemd/user/default.target.wants/onedrive.service

# add ntfs-3g plugin to access OneDrive files in windows drive
mkdir /lib/x86_64-linux-gnu/ntfs-3g
cp ntfs-plugin-9000001a.so /lib/x86_64-linux-gnu/ntfs-3g/

# disable intel power save to stop white noise to appear when using headphone jack
echo "0" | sudo tee /sys/module/snd_hda_intel/parameters/power_save

# general cleaning
apt autoremove -y
apt clean
apt autoclean -y
