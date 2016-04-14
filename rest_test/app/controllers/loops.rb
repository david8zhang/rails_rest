class Looper
	@@instance_var = 10
	def while_loop
		x = 0
		while x < @@instane_var do
			puts "loop " + x.to_s
		end
	end
end