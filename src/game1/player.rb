module Game1
	class Player
	  	attr_accessor :x
	  	attr_accessor :y
	  	attr_accessor :speed
		attr_accessor :rad

<<<<<<< HEAD
		GRAVITY = 9.8
		def initialize
	  		@image = Image.load('images/lance.png', nil, nil, 20, 10)
=======
	  GRAVITY = 9.8
 	 	def initialize
	 	  @image = Image.load('images/player.png')
>>>>>>> 35821e96ab8341988c357c41db371f6265ddd200
			@image.set_color_key(C_BLACK)
			@image_width = 30
			@image_height = 5
			@x = 10
<<<<<<< HEAD
			@dx = 10
			@y = 500
			@dy = 500
=======
			@y = 10
>>>>>>> 35821e96ab8341988c357c41db371f6265ddd200
			@speed = 0
			@rad = 0
			@time = 0
		end

		def get_x
			return @speed * @time * Math.cos(@rad)
		end

		def get_y
<<<<<<< HEAD
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
=======
			return -(1/2) * GRAVITY * @time * @time + @speed * Math.sin(@rad)
		end

		def draw
			Window.draw(@x, @y, @image)
			@time += 1
			@y = get_y
			@x = get_x 
>>>>>>> 35821e96ab8341988c357c41db371f6265ddd200
  		end
	end
end
