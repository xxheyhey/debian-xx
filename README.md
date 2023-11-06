# debian-xx
### This is made for Debian Bookworm, Trixie or sid (Debian 12 is stable at time of writing)
This is my debian installation setup.

Look at install.sh to see what's going to be installed on your system.

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
Bootstrap [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)

Install NVIDIA drivers

Check [auto-cpufreq troubleshooting](https://github.com/AdnanHodzic/auto-cpufreq#troubleshooting) if experiencing problems with CPU performance

Install [BLAST+](https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/)

Install [iqtree2](https://github.com/iqtree/iqtree2/blob/master/README.md)
