#!/bin/sh
# Downlaod neovim from https://github.com/neovim/neovim/releases

LOCAL_PROG_PATH=$HOME/.local/bin
LOCAL_NVIM_PATH=$HOME/.local/bin/nvim
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

echo "Using binary: $BINARY"

# Install nvim binary symlink in local bin
mkdir -p $LOCAL_PROG_PATH
rm $LOCAL_NVIM_PATH
ln -s $HOME/setupenv/neovim/$BINARY $LOCAL_NVIM_PATH
./setup_neovim.rb
