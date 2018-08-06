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
