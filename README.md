# debian-xx
### This is made only for Debian 12 Bookworm
This is my debian installation setup.

Look at install.sh to see what's going to be installed on your system.

Make changes to the xrandr lines for your own system see [this](https://askubuntu.com/questions/377937/how-do-i-set-a-custom-resolution) for help.

### To install:
```
git clone https://github.com/xxheyhey/debian-xx.git
cd debian-xx
sudo ./install.sh
```
During the installation you will be prompted to install [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq). Follow the instructions that are given to install auto-cpufreq or not.

Reboot after the installation is complete.

### Manually do after (this is for myself):
Bootstrap [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)

Install [BLAST+](https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/)

Install [iqtree2](https://github.com/iqtree/iqtree2/blob/master/README.md)

Copy my files (documents, pictures, etc.)

Install LSP's through :Mason in Neovim

Check [auto-cpufreq troubleshooting](https://github.com/AdnanHodzic/auto-cpufreq#troubleshooting) if experiencing problems with it

Check if there's a newer version of [R](https://cloud.r-project.org/src/base/R-4/) (currently installing R-4.3.2)
