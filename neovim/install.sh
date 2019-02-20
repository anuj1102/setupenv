#!/bin/sh
# Downlaod neovim from https://github.com/neovim/neovim/releases

LOCAL_PROG_PATH=$HOME/.local/bin
mkdir -p $LOCAL_PROG_PATH
ln -sf $PWD/squashfs-root/AppRun $LOCAL_PROG_PATH/nvim
./setup_neovim.rb
