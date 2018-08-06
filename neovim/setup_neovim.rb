#!/usr/bin/ruby

require_relative "../src/repo.rb"
require_relative "../src/stage.rb"

DIR=File.expand_path(File.dirname(__FILE__))
vim_plug = Repo.new("#{DIR}/vim-plug", 
										 "https://github.com/junegunn/vim-plug",
										 ["neovim"]
										)
#setup_repos([vim_plug])

stage("mkdir -p ~/.vim/autoload && cp #{DIR}/vim-plug/plug.vim ~/.vim/autoload/plug.vim").run
stage("ln -s #{DIR}/init.vim ~/.config/nvim/init.vim").run

