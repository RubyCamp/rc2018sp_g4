module Gmame1
	class Volume
		def initialize(input)
			@mic = input
			@x = 10
			@y = 550
			@font = Font.new(32, "Arial")
		end

		def draw_vol(vol)
			str = "MIN" + "|" * vol + " " * (100 - vol) + "MAX"
			Window.draw_font(@x, @y, str, @font)
		end
	end
end
