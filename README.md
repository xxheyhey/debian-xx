# debian-xx
### This is made for Debian Bookworm, Trixie and sid (Debian 12 is stable at time of writing)
This is my debian installation setup.

Look at [install.sh](https://github.com/xxheyhey/debian-xx/blob/master/install.sh) (or [vminstall.sh](https://github.com/xxheyhey/debian-xx/blob/master/vminstall.sh) for virtual machines) to see what's going to be installed on your system.

Make changes to the xrandr lines in the .xinitrc file for your own system. See [this](https://askubuntu.com/questions/377937/how-do-i-set-a-custom-resolution) for help.

### To install:
- On a real machine:
```
git clone https://github.com/xxheyhey/debian-xx.git
cd debian-xx
sudo ./install.sh
```
- On a virtual machine:
```
git clone https://github.com/xxheyhey/debian-xx.git
cd debian-xx
sudo ./vminstall.sh
```

Reboot after the installation is complete.

### Manually do after (mainly for myself):
- Bootstrap [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)
- Install NVIDIA drivers
- Install [BLAST+](https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/)
- Install [iqtree2](https://github.com/iqtree/iqtree2/blob/master/README.md)
