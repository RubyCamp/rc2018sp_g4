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
    def initialize(input, score)
      @input = input
      #@player = Player.new
      @stop = false
      @start = false
      @dx = 0
      @db = 0
      @db2 = 0
      @al = 0
      @music =0
      @bgm_on = false #bgmが流れたかどうか　1回流れたらゲーム終了時止める
      @font = Font.new(64, 'ＭＳ Ｐゴシック')
      @sound1 = Sound.new("game4/music/jump.wav")
      @sound2 = Sound.new("game4/music/coin.wav")
      @sound3 = Sound.new("game4/music/1UP.wav")
      @sound4 = Sound.new("game4/music/mario_die.wav")
      @bgm =  Sound.new("game4/music/timer.mid")
      @sound1.set_volume(200,0)
      @sound2.set_volume(200,0)
      @sound3.set_volume(200,0)
      @sound4.set_volume(200,0)
      @bgm.set_volume(255,0)
      @score = score
    end

    def set_fields

      @clock_image = Image.load("images/clock2.png")
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
      @al = @input.get_light

      if @bgm_on == false
        @bgm.play
        @bgm_on = true
      end
      puts(@al)

      #puts(@al)

      Window.draw_font(240, 50, "20秒で止めろ!", @font)
      if @db2 ==1  && @@current_frame %120 == 0
        @start = true
      end

      if @start
        if @@current_frame % 45 ==0
          if @al <= 380
            puts("aaaaaa")

            if @music % 4 ==0
              @sound1.play
              @music += 1
            elsif @music % 4 ==1
              @sound2.play
              @music += 1
            elsif @music % 4 ==2
              @sound3.play
              @music += 1
            elsif @music % 4 ==3
              @sound4.play
              @music += 1
            end
          end
        end

        if @db2 == 1
          if @db == 0 && !@stop
            set_fields
            @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
            @@current_frame += 2.5
            @@current_frame = 0 if @@current_frame > MAXIM_FRAME_NUM
          elsif @db == 1
            set_fields
            @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
            @stop = true
          end

          if @stop
            set_fields
            @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
            @bgm.stop
            @bgm_on = false
            Scene.add(Score::Director.new(@input,@@current_frame), :score)
            Scene.move_to(:score)
            Scene.play
            self.clear
          end
        else
          if @db == 0 && !@stop

            @@current_frame += 2.5
            @@current_frame = 0 if @@current_frame > MAXIM_FRAME_NUM
          elsif @db == 1

            @stop = true
          end

          if @stop
            set_fields
            @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
            @bgm.stop
            @bgm_on = false
            Scene.add(Score::Director.new(@input,@@current_frame), :score)
            Scene.move_to(:score)
            Scene.play
            self.clear
          end
        end
      else
        set_fields
        @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)
      end
    end
    def clear
      @stop = false
      @dx = 0
      @db = 0
      @db2 = 0
      @@current_frame =0
    end
  end
end
