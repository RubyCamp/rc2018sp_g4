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
			#@back_ground = Image.load('images/throwing.png')
			@frm = 1
			@step = 0
			@cnt = 0
			@music = false
			@before = false
			@throw_music = Sound.new("game1/music/throw.wav")
			@drop_music = Sound.new("game1/music/drop.wav")
			@before_music = Sound.new("game1/music/before_throw.wav")
			@max_power = 0
			@degree = 0
			@time = 3.0
			@circle_position
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
			self.draw_msg("Push Button\n#{-@lance.degree}")
			@lance.draw

			if @input.get_sw2 == 0
				@degree += 1
				@degree = 0 if @degree == 91
			else
				@lance.degree = -@degree
				@lance.rad = @degree * Math::PI / 180
				@step += 1
			end
		end

		def draw_speed_setting
			self.draw_msg("Speed: #{@volume.vol}")
			@volume.set_vol
			@volume.draw_vol
			@lance.draw

			@time -= 0.1

			if @cnt < 180
				@cnt += 1
			else
				@cnt = 0
				@step += 1
				@lance.speed = @volume.vol / 10
			end
		end

		def draw_shot
			@lance.set_next_posiotion
			@lance.draw
			@step += 1 if @lance.hit?
			@circle_position = @circle.move_circle
		end

    	def play
			#Window.draw(0,0,@back_ground)
			@circle.draw
			@before_music.play if @before == false
			@before = true
			case @step
				when 0
					self.draw_game_title
				when 1 #set rad
					self.draw_degree_setting
				when 2 #set initialize speed
					self.draw_speed_setting

				when 3 #shot
					@before_music.stop
					@throw_music.play
					self.draw_shot
				when 4
					@throw_music.stop
					@drop_music.play if @music == false
					@music = true
					Window.draw_font(250, 280, "Score: #{Score.get_score(@lance.x, @circle_position)}", @font)
					@lance.draw
					if @input.get_input then
						Scene.move_to(:game)
						self.clear
					end
			end

    	end

		def frm_count(max_cnt)
			@frm += 1
			@frm = 1 if @frm > max_cnt
		end

		def clear
			@frm = 1
			@step = 0
			@cnt = 0
			@max_power = 0
			@degree = 0
			@time = 3.0
			@lance.clear
			@volume.clear
			@circle.clear
			@music = false
			@before = false
		end

	end
end
