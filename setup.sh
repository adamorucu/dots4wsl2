#!/bin/bash
# Installations
apt upgrade
apt-get install python3-pip
pip3 -y install numpy matplotlib pandas notebook
apt-get install tmux

# Symlinks
echo "Stating Symlinking"
ln -sf $(pwd)/.jupyter ~/.jupyter
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.vim ~/.vim
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

# Intall packages
vim -c PlugInstall
