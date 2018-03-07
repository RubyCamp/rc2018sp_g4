require_relative 'player'
require 'smalrubot'
require_relative 'clock_viewer'
require_relative 'score'
require_relative '../scene'
require_relative '../scene_game/director'
require_relative '../sensor_input'

module Game4
  class Director
    MAX_TO_SEC = 30 # 20秒まで計測
    MIN_TO_SEC = 60 # 1min => 60[sec]
    SEC_TO_FRAME = 60 # 1sec => 60[frame]
    MAXIM_FRAME_NUM = 10 * MIN_TO_SEC * SEC_TO_FRAME # 10[min]が描画最大範囲
      @@current_frame =0
    def initialize(input)
      @input = input
      #@player = Player.new
      @flg = 0
      @dx = 0
      @db = 0
      @db2 = 0
    end

    def set_fields
      @clock_image = Image.load("images/clock.png")
      @clock_viewer = ClockViewer::Director.new(
                                      x: Window.width / 2.0 - @clock_image.width / 2.0 ,
                                      y: Window.height / 2.0 - @clock_image.height / 2.0,
                                      width: @clock_image.width, height: @clock_image.height,
                                      image: @clock_image
                                     )
    end

    def play

      @db = @input.get_sw1
      @db2 = @input.get_sw2
      if @db2 == 1
        if @db == 0 && @flg ==0
          set_fields
          @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
          @@current_frame += 1
          @@current_frame = 0 if @@current_frame > MAXIM_FRAME_NUM
        elsif @db == 1
          set_fields
          @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
          @flg = 1
        end

        if @flg == 1
          set_fields
          @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
          sleep(2)
          Scene.add(Score::Director.new(@input,@@current_frame), :score)
          Scene.move_to(:score)
          Scene.play
        end
      else
        if @db == 0 && @flg ==0

          @@current_frame += 1
          @@current_frame = 0 if @@current_frame > MAXIM_FRAME_NUM
        elsif @db == 1

          @flg = 1
        end

        if @flg == 1
          set_fields
          @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
          sleep(2)
          Scene.add(Score::Director.new(@input,@@current_frame), :score)
          Scene.move_to(:score)
          Scene.play
        end
      end
    end
  end
end
