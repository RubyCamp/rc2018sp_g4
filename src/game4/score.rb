module Score
  class Director
    MAX_TO_SEC = 20 # 20秒まで計測
    MIN_TO_SEC = 60 # 1min => 60[sec]
    SEC_TO_FRAME = 60 # 1sec => 60[frame]
    MAXIM_FRAME_NUM = 10 * MIN_TO_SEC * SEC_TO_FRAME # 10[min]が描画最大範囲
      @@current_frame =0
    def initialize(input,current_frame)
      @input = input
      @current_frame = current_frame
      @frm = 1
      @time = 0
      @font = Font.new(128, 'ＭＳ Ｐゴシック')
      @score = 0
    end

    def play
      #Window.draw_font(300, 280, @score.to_s"点", @font)
      @frm += 1
      @frm = 0 if @frm > 30


      if @frm == 1
        p @current_frame
        @time = ((10 * SEC_TO_FRAME ) - @current_frame).abs
        p @time

        if @time <= 6
          @score = 10
        elsif @time <= 12
          @score = 7
        elsif @time <= 18
          @score = 5
        elsif @time <= 30
          @score = 3
        else
          @score = 0
        end
      end
      Window.draw_font(350, 280, @score.to_s, @font)
      Window.draw_font(440, 280, "点", @font)

      if @input.get_input then
        Scene.move_to(:game)
      end


    end
  end
end
