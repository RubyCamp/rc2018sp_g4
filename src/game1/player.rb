module Game1
	class Player
	  attr_accessor :x
	  attr_accessor :y
	  attr_accessor :speed
	  attr_accessor :rad

	  GRAVITY = 5.0
 	 	def initialize
	 	  @image = Image.load('images/player.png')
			@image.set_color_key(C_BLACK)
			@x = 10
			@y = 500
			@speed = 0
			@rad = 0
			@time = 0
		 end

		def get_x
			return @speed * @time * Math.cos(@rad)
		end

		def get_y
				  return -0.5 * GRAVITY * @time * @time + @speed.to_f * Math.sin(@rad)
		end

		def draw
			Window.draw(@x, @y, @image)
			@time += 0.1
			@y = 500 - get_y
			@x = 10 + get_x
  		end
	end
end
