#!/bin/bash

function check_dep() {
	command -v $1 >/dev/null 2>&1 || { echo >&2 "Dependency $1 not found. $2"; exit 1; }
}

function manual_install() {
	CMD="cd $1 && ./install.sh"
	if [ -z $INSTALL_ALL ]
	then
		echo "Run $CMD to setup $2 "
	else
		echo "Installing $2 with $CMD!"
		$($CMD)
	fi
}

# OS must provide these through default packages
check_dep ruby
check_dep zsh
check_dep pip3
check_dep wget
check_dep curl

# Run ./packages/install_packages.rb to install these binaries locally
manual_install zsh zsh
echo "Run chsh -s /bin/zsh to set default shell to zsh if you haven't already."
manual_install neovim nvim
manual_install abduco abduco
manual_install neovim-remote nvr
