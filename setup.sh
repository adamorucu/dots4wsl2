#!/bin/bash
# Installations
echo "Upgrade..."
apt upgrade
echo "Installs..."
apt-get install python3-pip
pip3 -y install numpy matplotlib pandas notebook
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
