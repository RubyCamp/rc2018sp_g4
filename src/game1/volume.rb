module Game1
	class Volume
		attr_accessor :vol
		attr_accessor :max_vol
		def initialize(input)
			@input = input
			@vol = 0
			@max_vol = 0
			@x = 10
			@y = 550
			@font = Font.new(32, "Arial")
		end

		def set_vol
			@vol = @input.get_light
			@max_vol = @vol if @max_vol < @vol
		end

		def draw_vol
			Window.draw_font(@x, @y, "|" * (@vol / 5), @font)
		end

		def clear
			@vol = 0
			@max_vol = 0
			@x = 10
			@y = 550
		end
	end
end
