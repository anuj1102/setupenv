
function check_dep() {
	command -v $1 >/dev/null 2>&1 || { echo >&2 "Dependency $1 not found"; exit 1; }
}

check_dep ruby
check_dep nvim # at least 0.3.0
check_dep rg # ripgrep
check_dep zsh

check_dep ctags #--version should say universal
check_dep abduco
check_dep pip3
check_dep nvr
./zsh/setup_zsh.rb
./neovim/setup_neovim.rb
