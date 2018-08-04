#!/usr/bin/ruby
# Setup neovim, oh_my_zsh, and various plugins automatically

# Step 1. Intall oh_my_zsh
repos = [
	{
		name: "colorschemes",
		notes: "Install 3024 Night Shell colors",
		urls: ["https://github.com/mbadolato/iTerm2-Color-Schemes"]
	},
	{
		name: "ohmyzsh",
		notes: "Install the basic oh my zsh",
	  urls: ["https://github.com/robbyrussell/oh-my-zsh"]
	},
	{
		name: "neovim",
	  notes: "Neovim, a better vim",
		urls: ["https://github.com/neovim/neovim/wiki/Installing-Neovim"]
	},
  {
		name: "oceanic-theme",
    notes: "The best neovim theme",
    urls: ["https://github.com/mhartington/oceanic-next"]
  },
	{
		name: "deoplete_pre",
	  notes: "Some python env setup necessary before installing deoplete vim plugin",
		urls: ["https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim",
				   "https://github.com/Shougo/deoplete.nvim"]
	},
	{
		name: "vim_plug",
		notes: "Plugin manager for neovim see included neovim config",
		urls: ["https://github.com/junegunn/vim-plug"]
	},
	{
		name: "zsh_command_time",
	  notes: "Zsh command time plugin",
		urls: ["https://github.com/popstas/zsh-command-time"]
	},
	{
		name: "zsh_autosuggestions",
		notes: "Autosuggestions in terminal",
		urls: ["https://github.com/zsh-users/zsh-autosuggestions"]
	},
	{
		name: "deoplete-ruby",
	  notes: "Ruby autocomplete",
		urls: ["https://github.com/fishbullet/deoplete-ruby"]
	},
	{
		name: "ctags",
	  notes: "google ctags",
	},
	{
		name: "deoplete-clang",
	  notes: "Good syntax highlighting in shell",
		urls: ["https://github.com/zchee/deoplete-clang"]
	},
	{
		name: "neoinclude",
	  notes: "So include files can be autocompleted",
		urls: ["https://github.com/Shougo/neoinclude.vim"]
	},
	{
		name: "ctrlp",
	  notes: "sublime like text for completing stuff",
		urls: ["https://github.com/kien/ctrlp.vim"]
	},
]

puts """Ready to setup neovim, zsh and related plugins? 
We're going to provide the steps one at a time.
Follow the links and the install instructions in the github repos.
"""
repos.each do |repo|
	puts "-----------------"
	puts "#{repo[:name]}"
	puts "#{repo[:notes]}"
	puts "#{repo[:urls]}"
	puts "-----------------"
	puts "Press any key to continue ..."
	STDIN.getc
end
puts "That's everything. You're ready to code!"
