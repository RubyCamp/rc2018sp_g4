module Gmame1
	class Volume
		attr_accessor :vol
		attr_accessor :max_vol
		def initialize(input)
			@mic = input
			@vol = 0
			@max_vol = 0
			@x = 10
			@y = 550
			@font = Font.new(32, "Arial")
		end

		def set_vol
			@vol = @input.get_sound
			@max_vol = @vol if @max_vol < @vol
		end

		def draw_vol
			str = "MIN" + "|" * @vol + " " * (100 - @vol) + "MAX"
			Window.draw_font(@x, @y, str, @font)
		end
	end
end
