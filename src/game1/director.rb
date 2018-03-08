require_relative 'lance'
require_relative 'volume'
require_relative 'score'
require_relative 'circle'

module Game1
	class Director
		def initialize(input)
			@input = input
			@lance = Lance.new(input)
			@volume = Volume.new(input)
			@circle = Circle.new(input)
			@font = Font.new(32, 'Arial')
			@frm = 1
			@step = 0
			@cnt = 0
			@max_power = 0
			@degree = 0
<<<<<<< HEAD
=======
			@time = 3.0
			@circle_position
>>>>>>> 298a64876afcbdff4cd364aa29205843ebba4a23
		end

		def draw_msg(msg)
			Window.draw_font(250, 280, msg, @font)
		end

		def draw_game_title
			self.draw_msg("Throwing Game")
			@cnt += 1
			if @cnt == 120
				@cnt = 0
				@step += 1
			end
		end

		def draw_degree_setting
			@lance.ch_degree(-@degree)
			self.draw_msg("Push Button\n#{@lance.degree}degree")
			@lance.draw

			if @input.get_sw2 == 0
				@degree += 1
				@degree = 0 if @degree == 91
			else
				@lance.degree = -@degree
				p @lance.rad = @degree * Math::PI / 180
				@step += 1
			end
		end

		def draw_speed_setting
			self.draw_msg("Shout!!\nSpeed: #{@volume.vol}\n#{@time}")
			@volume.set_vol
			@volume.draw_vol
			@lance.draw

			@time -= 0.1

			if @cnt < 180
				@cnt += 1
			else
				@cnt = 0
				@step += 1
				p @lance.speed = @volume.vol / 10
			end
		end

		def draw_shot
			@lance.set_next_posiotion
			@lance.draw
			@step += 1 if @lance.hit?
			@circle_position = @circle.move_circle
		end

    	def play
			@circle.draw	
			case @step
				when 0
					self.draw_game_title
				when 1 #set rad
					self.draw_degree_setting
				when 2 #set initialize speed
					self.draw_speed_setting
				when 3 #shot
					self.draw_shot
				when 4
					Window.draw_font(250, 280, "Score: #{Score.get_score(@lance.x, @circle_position)}", @font)
					@lance.draw
			end

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
