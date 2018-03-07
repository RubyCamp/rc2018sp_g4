require_relative 'player'

#ìäù±ÉQÅ[ÉÄ
module Game1
	class Director
		SCORE = [30, 20, 10, 0]
		RANGE = [10, 30, 50]

		def initialize(input)
			@input = input
			@player = Player.new(input)
			p @player
			@font = Font.new(32, 'Arial')
			@frm = 1
			@step = 0
			@cnt = 0
			@max_power = 0
			@degree = 0
		end

    	def play
			case @step
				when 0
					Window.draw_font(250, 280, "Throwing Game", @font)
					@cnt += 1
					if @cnt == 60
						@cnt = 0
						@step += 1
					end
				when 1 #set rad
					Window.draw_font(250, 280, "Push Button!!\n#{@degree}", @font)
					@player.draw_lance(-@degree)
					if @input.get_sw2 == 0
						@degree += 1
						@degree = 0 if @degree == 91
					else
						@player.rad = @degree * Math::PI / 180
						@step += 1
					end
				when 2 #set initialize speed
					Window.draw_font(250, 280, "Shout!!\nPower: #{@max_power}", @font)
					@player.draw_lance(-@degree)
					Window.draw_font(10, 550, "|" * (@input.get_sound / 10), @font)
					if @cnt < 30
						if frm_count(6) == 1
							@cnt += 1
							power = @input.get_sound 
							@max_power = power if @max_power < power
						end
					else
						@player.speed = @max_power / 10
						p @player
						@step += 1
					end
				when 3 #shot
					Window.draw_font(250,280, "Go!!\nx: y: ", @font)
					@player
					@player.draw
					@step += 1 if @player.y >= 500
				when 4
					Window.draw_font(250, 280, "Score: #{(@player.x - 10).to_i}", @font)
					@player.draw_lance(@degree)
			end

    	end

		def get_score
			center_position = 400
			hit_position = @player.x

		end
		def frm_count(max_cnt)
			@frm += 1
			@frm = 1 if @frm > max_cnt
		end
	end

    def clear
      @frm = 1
      @dx = 0
    end
  end
