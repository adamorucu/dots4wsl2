#!/bin/bash
# Installations
echo "Upgrade..."
apt-get update
apt-get upgrade
echo "Installs..."
apt-get install python3-pip
pip3 install numpy matplotlib pandas notebook
apt-get install tmux

# Symlinks
echo "Symlinking..."
ln -sf $(pwd)/.jupyter ~/.jupyter
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.vim ~/.vim
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

# Intall packages
echo "Vim installs..."
vim -c PlugInstall
