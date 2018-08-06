#!/usr/bin/ruby

require_relative "../src/repo.rb"

oh_my_zsh = Repo.new(".oh-my-zsh", 
										 "https://github.com/robbyrussell/oh-my-zsh",
										 ["zsh"]
										)

zsh_custom = "#{oh_my_zsh.dir}/custom/plugins"

command_time = Repo.new("#{zsh_custom}/command-time", 
										 "https://github.com/popstas/zsh-command-time.git",
										 ["zsh"]
										)


zsh_autosuggestions = Repo.new("#{zsh_custom}/zsh-autosuggestions", 
										 "https://github.com/zsh-users/zsh-autosuggestions",
										 ["zsh"]
										)

zsh_syntax_highlighting = Repo.new("#{zsh_custom}/zsh-syntax-highlighting", 
										 "https://github.com/zsh-users/zsh-syntax-highlighting.git",
										 ["zsh"]
										)

ZSH_REPOS = [oh_my_zsh, command_time, zsh_autosuggestions, zsh_syntax_highlighting]

def setup_repos
  ZSH_REPOS.each do |repo|
  	repo.add_subtree
  	repo.pull_subtree
	end
end
