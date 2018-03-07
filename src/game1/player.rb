module Game1
	class Player
	  attr_accessor :x
	  attr_accessor :y
	  attr_accessor :speed
	  attr_accessor :rad

	  GRAVITY = 9.8
 	 	def initialize
	 	  @image = Image.load('images/player.png')
			@image.set_color_key(C_BLACK)
			@x = 10
			@y = 10
			@speed = 0
			@rad = 0
			@time = 0
		end

		def get_x
			return @speed * @time * Math.cos(@rad)
		end

		def get_y
			return -(1/2) * GRAVITY * @time * @time + @speed * Math.sin(@rad)
		end

		def draw
			Window.draw(@x, @y, @image)
			@time += 1
			@y = get_y
			@x = get_x 
  		end
	end
end
