class Stage

	def initialize(cmd, msg = "")
		@cmd = cmd
		@msg = msg
	end

	def ask
		show(false)
		puts " [press enter to continue]"
		prompt = STDIN.gets
		unless prompt == "y\n" || prompt == "\n"
			puts "Quiting..."
			exit 1
		end
		self
	end

	def wait(sleep_time)
		sleep sleep_time
		self
	end

	def run
		puts @cmd
		@result = system(@cmd)
		puts "[Stage] Failed cmd!: #{@cmd}" unless @result
		self
	end

	def fail
		exit 1 unless @result
		self
	end

	def show(newline = true)
		s = @msg.empty? ? @cmd : @msg
		if newline
			puts s
		else
			print s
		end
		self
	end
end

def stage(*args)
	Stage.new(*args)
end
