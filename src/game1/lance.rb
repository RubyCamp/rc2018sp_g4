module Game1
	class Lance
	  	attr_accessor :x
	  	attr_accessor :y
	  	attr_accessor :speed
		attr_accessor :rad
		attr_accessor :degree

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
			@degree = 0
			@time = 0
		end

		def ch_degree(degree)
			@degree = degree
			@rad = @degree * Math::PI / 180
		end

		def set_next_posiotion
			@time += 1.0 / 60.0
			@dx = @x
			@x = 10 + (@speed * @time * Math.cos(@rad)) * 8
			@dy = @y
			@y = 500 - (-0.5 * GRAVITY * @time * @time + @speed.to_f * @time * Math.sin(@rad)) * 4
			@degree = (Math.atan((@y - @dy) / (@x - @dx))) * 180 / Math::PI

			puts "x: #{@x} y: #{@y}"
		end

		def ch_power
			return power = @input.get_light / 100 - 5
		end
		
		def hit?
			if @y > 500
				return true
			else
				return false
			end
		end

		def draw
			Window.draw_rot(@x, @y, @image, degree, @image.width, @image.height / 2)
  		end
	end
end
