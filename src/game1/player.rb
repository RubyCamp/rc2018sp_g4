module Game1
	class Player
	  	attr_accessor :x
	  	attr_accessor :y
	  	attr_accessor :speed
		attr_accessor :rad

		GRAVITY = 9.8
		def initialize
	  		@image = Image.load('images/lance.png', nil, nil, 20, 10)
			@image.set_color_key(C_BLACK)
			@image_width = 30
			@image_height = 5
			@x = 10
			@dx = 10
			@y = 500
			@dy = 500
			@speed = 0
			@rad = 0
			@time = 0
		end

		def get_x
			return @speed * @time * Math.cos(@rad)
		end

		def get_y
				  return -0.5 * GRAVITY * @time * @time + @speed.to_f * @time * Math.sin(@rad)
		end

		def draw_lance(degree)
				  Window.draw_rot(@x, @y, @image, degree, 0, @image.height / 2)
		end

		def draw
			@time += 1.0/60.0
			@dy = @y
			@y = 500 - get_y * 5
			@dx = @x
			@x = 10 + get_x * 2
			p degree = (Math.atan((@y - @dy) / (@x - @dx)))
			Window.draw_rot(@x, @y, @image, -degree, @x, @y)
  		end
	end
end
