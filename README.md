# debian-xx
### This is made for Debian Bookworm, Trixie and Sid (Debian 12 is stable at time of writing)
This is my debian installation setup.

Look at [install.sh](https://github.com/xxheyhey/debian-xx/blob/master/install.sh) (or [vminstall.sh](https://github.com/xxheyhey/debian-xx/blob/master/vminstall.sh) for virtual machines) to see what's going to be installed on your system.

### To install:
- On a real machine:
```
git clone https://github.com/xxheyhey/debian-xx.git
cd debian-xx
sudo ./install.sh
```
During the installation you will be prompted to install [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq). Follow the instructions that are given to install auto-cpufreq or not. The auto-starting daemon won't be installed, no matter your choice.

- On a virtual machine:
```
git clone https://github.com/xxheyhey/debian-xx.git
cd debian-xx
sudo ./vminstall.sh
```

Make changes to the xrandr lines in the .xinitrc file in your home directory as needed for your system. See [this](https://askubuntu.com/questions/377937/how-do-i-set-a-custom-resolution) for help.

Reboot.

### Manually do after (mainly for myself):
- Remove OneDrive auto-start service after running ```onedrive --synchronize``` once with: ```rm /etc/systemd/user/default.target.wants/onedrive.service```
- Bootstrap [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)
- Install NVIDIA drivers
- Install [BLAST+](https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/)
- Install [iqtree2](https://github.com/iqtree/iqtree2/blob/master/README.md)
