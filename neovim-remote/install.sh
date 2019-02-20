#!/bin/sh

pip3 install --user neovim-remote
git config --global core.editor 'nvr --remote-wait-silent'
echo "Also add this to your ~/.gitconfig"
echo """
[diff]
    tool = nvr
[difftool "nvr"]
    cmd = nvr -s -d $LOCAL $REMOTE
[merge]
    tool = nvr
[mergetool "nvr"]
    cmd = nvr -s -d $LOCAL $BASE $REMOTE $MERGED -c 'wincmd J | wincmd ='
"""
