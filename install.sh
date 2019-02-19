
function check_dep() {
	command -v $1 >/dev/null 2>&1 || { echo >&2 "Dependency $1 not found. $2"; exit 1; }
}

# OS must provide these through default packages
check_dep ruby
check_dep zsh
check_dep pip3
check_dep wget
check_dep curl


# Optional but nice
# check_dep rg # ripgrep

# Run ./packages/install_packages.rb to install these binaries locally
check_dep nvim "Run neovim/install.sh to set this up"
check_dep abduco
check_dep nvr

# Update dotfiles and neovim plugins
./zsh/setup_zsh.rb
./neovim/setup_neovim.rb
