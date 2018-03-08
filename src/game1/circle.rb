module Game1
	class Circle
		def initialize(input)
			@x = 400
			@y = 500
			@circle = Image.load('images/circle.png')
			@input = input
			@frm = 0
			@rnd = Random.new()
		end

		def move_circle
			@frm += 1
			if @frm == 1
				@frm = 0
				dx = @rnd.rand(0..10)
				case @input.get_tilt
				when 0
					@x += -dx
				when 1
					@x += dx
				end
			end
			return @x
		end

		def draw
			Window.draw(@x, @y, @circle)
		end
	end
end
