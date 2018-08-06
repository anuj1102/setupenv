
function check_dep() {
	command -v $1 >/dev/null 2>&1 || { echo >&2 "Dependency $1 not found"; exit 1; }
}

check_dep ruby
check_dep nvim
check_dep zsh
./zsh/setup_zsh.rb
./neovim/setup_neovim.rb
