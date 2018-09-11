#!/usr/bin/ruby

require_relative "../src/repo.rb"

OH_MY_ZSH = Repo.new(".oh-my-zsh", "https://github.com/robbyrussell/oh-my-zsh", ["zsh"])
zsh_custom = "#{OH_MY_ZSH.dir}/custom/plugins"
COMMAND_TIME = Repo.new("#{zsh_custom}/command-time", "https://github.com/popstas/zsh-command-time.git", ["zsh"])
ZSH_AUTOSUGGESTIONS = Repo.new("#{zsh_custom}/zsh-autosuggestions", "https://github.com/zsh-users/zsh-autosuggestions", ["zsh"])
ZSH_SYNTAX_HIGHLIGHTING = Repo.new("#{zsh_custom}/zsh-syntax-highlighting", "https://github.com/zsh-users/zsh-syntax-highlighting.git", ["zsh"])
ABDUCO = Repo.new("abduco", "https://github.com/martanne/abduco.git", ["session-manageer", "abduco"])
CTAGS = Repo.new("ctags", "https://github.com/universal-ctags/ctags.git", ["ctags"])
NVR = Repo.new("neovim-remote", "https://github.com/mhinz/neovim-remote.git", ["nvr"])
CQUERY = Repo.new("cquery", "https://github.com/mhinz/neovim-remote.git", ["cquery"])


ZSH_REPOS = [OH_MY_ZSH, COMMAND_TIME, ZSH_AUTOSUGGESTIONS, ZSH_SYNTAX_HIGHLIGHTING]
