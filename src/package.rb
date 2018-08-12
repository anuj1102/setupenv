require_relative "stage.rb"


module Installation
	def compile(cmd)
		cmd = "cd #{@repo.dir} && #{cmd}"
		stage(cmd, "Compiling #{@repo}").show.run
	end

	def install(cmd)
		stage(cmd, "Installing #{@repo} to #{@install_dir}").ask.run
	end
end

class Package
	include Installation
	def initialize(repo, install_dir)
		@repo = repo
		@install_dir = install_dir
	end
end
