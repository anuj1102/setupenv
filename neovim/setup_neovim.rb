#!/usr/bin/ruby

require_relative "../src/repo.rb"

NEOVIM_DIR="neovim"
vim_plug = Repo.new("#{NEOVIM_DIR}/vim-plug", 
										 "https://github.com/junegunn/vim-plug",
										 ["neovim"]
										)
setup_repos([vim_plug])
