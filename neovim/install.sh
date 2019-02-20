#!/bin/sh
# Downlaod neovim from https://github.com/neovim/neovim/releases

LOCAL_PROG_PATH=$HOME/.local/bin
OSX_BINARY=neovim_binaries/nvim-osx64/bin/nvim

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	BINARY=$LINUX_BINARY
elif [[ "$OSTYPE" == "darwin"* ]]; then
	BINARY=$OSX_BINARY
fi

if [ -z "$BINARY" ]; then
	  echo "Unable to determin host"
    exit 1
fi

mkdir -p $LOCAL_PROG_PATH
ln -sf $PWD/ $LOCAL_PROG_PATH/nvim
./setup_neovim.rb
