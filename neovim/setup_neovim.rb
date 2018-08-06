#!/usr/bin/ruby

require_relative "../src/repo.rb"
require_relative "../src/stage.rb"

DIR=File.expand_path(File.dirname(__FILE__))
NVIM_INIT="#{DIR}/init.vim"
TMP_INIT= "tmp_init.vim"

vim_plug = Repo.new("#{DIR}/vim-plug", 
										 "https://github.com/junegunn/vim-plug",
										 ["neovim"]
										)
setup_repos([vim_plug])

stage("mkdir -p ~/.local/share/nvim/site/autoload && cp #{DIR}/vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim").run

# Install only plugins in config first so we can use vim-plug to install deps
nvim_init_config="~/.config/nvim/init.vim"
neovim_plugins="~/.config/nvim/plugins.vim"
def install_vim_config(config, neovim_config_loc)
	stage("ln -s #{DIR}/#{config} #{neovim_config_loc}").run
end

def delete_vim_config(config)
	stage("rm #{config}").run
end

def create_tmp_plugin_file(plugin_file)
	puts "Creating #{TMP_INIT}"
	plugin_lines = ["call plug", "Plug"]
	File.open(TMP_INIT, "w") do |f|
   	File.open(plugin_file).each_line do |l|
   		next unless plugin_lines.any? { |pattern| l.start_with?(pattern) }
			f.write(l)
   	end
	end
end

stage("rm #{nvim_init_config}").run # make it idempotent
create_tmp_plugin_file("#{NVIM_INIT}")
stage("cp #{TMP_INIT} #{nvim_init_config}").run
stage("nvim +PlugInstall +qall").run
stage("rm #{TMP_INIT}").run
stage("rm #{nvim_init_config}").run
install_vim_config("init.vim", nvim_init_config)
