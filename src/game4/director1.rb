require_relative 'player'

require_relative 'clock_viewer'

module Game
  class Director
    MAX_TO_SEC = 20 # 20秒まで計測
    MIN_TO_SEC = 60 # 1min => 60[sec]
    SEC_TO_FRAME = 60 # 1sec => 60[frame]
    MAXIM_FRAME_NUM = 10 * MIN_TO_SEC * SEC_TO_FRAME # 10[min]が描画最大範囲
      @@current_frame =0
    def initialize(board)
      @board = board
      #@player = Player.new
      @flg = 1
      @dx = 0

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
      p @board.digital_read(2)
      set_fields
      @clock_viewer.draw(frame: @@current_frame, color: C_BLACK)

      #@objects.each do |object|
        #object.update
      #  object.draw
      #end



      @@current_frame += 1
      @@current_frame = 0 if @@current_frame > MAXIM_FRAME_NUM
    end
  end
end
