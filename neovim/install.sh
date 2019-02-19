#!/bin/sh
# Install neovim from https://github.com/neovim/neovim/releases

LOCAL_PROG_PATH=$HOME/.local/bin
cd $HOME
wget https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
mkdir -p $LOCAL_PROG_PATH
ln -s squashfs-root/AppRun $LOCAL_PROG_PATH/nvim
cd -
