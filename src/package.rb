require_relative "stage.rb"


module Installation
	def compile(cmd)
		puts "Compiling #{@repo}"
		stage(make_cmd(cmd)).ask.run
	end

	def install(cmd)
		puts "Installing #{@repo} to #{@install_dir}"
		stage(make_cmd(cmd)).ask.run
	end

	def make_cmd(cmd)
		 "cd #{@repo.dir} && #{cmd}"
	end
end

class Package
	include Installation
	def initialize(repo, install_dir)
		@repo = repo
		@install_dir = install_dir
	end
end
