require_relative 'clock_viewer'
require_relative 'output.rb'
module Score
  class Director
    MAX_TO_SEC = 20 # 20秒まで計測
    MIN_TO_SEC = 60 # 1min => 60[sec]
    SEC_TO_FRAME = 60 # 1sec => 60[frame]
    MAXIM_FRAME_NUM = 10 * MIN_TO_SEC * SEC_TO_FRAME # 10[min]が描画最大範囲
      @@current_frame =0
    def initialize(input,current_frame)
      @input = input
      @output = Output.new
      @current_frame = current_frame
      @frm = 1
      @time = 0
      @music = false
      @font = Font.new(128, 'ＭＳ Ｐゴシック')
      @sound_0 = Sound.new("game4/music/score_0.wav")
      @sound_3 = Sound.new("game4/music/score_3.wav")
      @sound_5= Sound.new("game4/music/score_5.wav")
      @sound_7 = Sound.new("game4/music/score_7.wav")
      @sound_10 = Sound.new("game4/music/score_10.wav")

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
      @output.draw
      @frm += 1
      @frm = 1 if @frm > 120

      if @frm == 5
        @time = ((20 * SEC_TO_FRAME ) - @current_frame).abs

        if @time <= 30
          @sound_10.play if !@music
          @music = true
          @score = 10
        elsif @time <= 60
          @sound_7.play if !@music
          @music = true
          @score = 7
        elsif @time <= 90
          @sound_5.play if !@music
          @music = true
          @score = 5
        elsif @time <= 120
          @sound_3.play if !@music
          @music = true
          @score = 3
        else
          @sound_0.play if !@music
          @music = true
          @score = 0
        end

      end
      set_fields
      @clock_viewer.draw(frame: @current_frame, color: C_BLACK)
      Window.draw_font(320, 100, @score.to_s, @font)
      Window.draw_font(440, 100, "点", @font)

      if @input.get_sw1 == 1 && @frm % 15 == 0 then
        Scene.move_to(:game)
      end
    end
  end
end
