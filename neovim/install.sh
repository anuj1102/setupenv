wget https://github.com/neovim/neovim/releases/download/v0.3.1/nvim.appimage

./nvim.appimage --appimage-extract
ln -s $HOME/.local/bin/nvim squash-fs/AppRun # in home dir
