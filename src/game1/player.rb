module Game1
	class Player
	  	attr_accessor :x
	  	attr_accessor :y
	  	attr_accessor :speed
		attr_accessor :rad

		GRAVITY = 9.8
		def initialize(input)
			@input = input
	  		@image = Image.load('images/lance.png', nil, nil, 20, 10)
			@image.set_color_key(C_BLACK)
			@image_width = 30
			@image_height = 5
			
			@x = 10
			@dx = 10
			@y = 500
			@dy = 500

			@weight = 10
			@speed = 0
			@rad = 0
			@time = 0
		end

		def get_x
			k = 10
			return @speed * @time * Math.cos(@rad)
			#return (@weight * self.get_speed / k) * (1 - Math::E ** -(k * @time / @weight))* Math.cos(@rad)
		end

		def get_y
			k = 10
			return -0.5 * GRAVITY * @time * @time + @speed.to_f * @time * Math.sin(@rad)
			#return (@weight / k) * ((@speed * Math.sin(@rad) + @weight * GRAVITY / k) * (1 - Math::E ** -(k * @time / @weight)) - GRAVITY * @time)
		end

		def ch_power
			return power = @input.get_light / 100 - 5
		end
		def draw_lance(degree)
				  Window.draw_rot(@x, @y, @image, degree, 0, @image.height / 2)
		end

		def draw
			@time += 1.0/60.0
			@dy = @y
			@y = 500 - get_y * 8
			@dx = @x
			@x = 10 + get_x * 4 
			p degree = (Math.atan((@y - @dy) / (@x - @dx))) * 180 / Math::PI
			Window.draw_rot(@x, @y, @image, degree, @image.width / 2, @image.height / 2)
  		end
	end
end
