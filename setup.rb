#!/usr/bin/ruby

class Repo
	attr_reader :dir, :url, :tags
	def initialize(dir, url, tags)
		@dir = dir
		@url = url
		@tags = tags
	end
	
	def to_s
		puts "Repo: [#{@dir}, #{@url}, #{@tags}]"
	end

	def add_subtree
		run_system(subtree_cmd("add"))
	end

	def pull_subtree
		run_system(subtree_cmd("pull"))
	end

	private
		def subtree_cmd(cmd)
			"git subtree #{cmd} --prefix #{@dir} #{@url} master --squash"
		end
		
		def run_system(cmd)
			result = system(cmd)
			puts "Failed cmd!: #{cmd}" unless result
		end
end

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

ZSH_REPOS = [oh_my_zsh, command_time, zsh_autosuggestions]
ZSH_REPOS.each do |repo|
	repo.add_subtree
	repo.pull_subtree
end
#puts ZSH_REPOS

#def sutbtree_cmd(cmd)
#	"git #{cmd} --prefix "
#end
