#!/bin/bash

function check_dep() {
	command -v $1 >/dev/null 2>&1 || { echo >&2 "Dependency $1 not found. $2"; exit 1; }
}

# OS must provide these through default packages
check_dep ruby
check_dep zsh
check_dep pip3
check_dep wget
check_dep curl



# Run ./packages/install_packages.rb to install these binaries locally
check_dep nvim "Run cd neovim && ./install.sh to set this up"
check_dep abduco "Run cd abduco && ./install.sh to set this up"
check_dep nvr "Run cd neovim-remote && ./install.sh to set this up"
./zsh/setup_zsh.rb
