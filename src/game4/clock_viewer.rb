module ClockViewer
  class Director
    FRAME_TO_SEC = 1.0 / 60.0 # 60[frame] => 1[sec]
    SEC_TO_MIN = 1.0 / 60.0   # 60[sec] => 1[min]
    STR_BRANK_WIDTH = 12      # 程よく間隔があいていて程よく太字になる余白
    STR_BRANK_HEIGHT = 12     # 程よく間隔があいていて程よく太字になる余白
    STR_LENGTH = 7            #=> (m：ss：ff).legnth = 7
    HALF_TO_FULL = 2
    FULL_TO_HALF = 0.5
    MIN_TO_SEC = 60

    def initialize(x: 0,y: 0,width: 0,height: 0,image: nil)
      @x = x
      @y = y
      @width = width
      @height = height
      @image = image ? image : Image.new(width, height, C_WHITE)
    end

    # 時計出力(strの内容・位置やフォントサイズを定め、Windowに表示する)
    def draw(frame: , color: C_BLACK)
      str_x = @x + STR_BRANK_WIDTH
      str_y = @y + STR_BRANK_HEIGHT
      str_width = @width - STR_BRANK_WIDTH * 2
      str_height = @height - STR_BRANK_HEIGHT * 2

      font_size = range_to_font_size(str_width, str_height)
      str_font = Font.new( font_size )

      if font_size == str_height
        str_brank_width = (@width - font_size * FULL_TO_HALF * STR_LENGTH) / 2
        str_x = @x + str_brank_width
      else
        str_brank_height = (@height - font_size) / 2
        str_y = @y + str_brank_height
      end

      str = set_time_str(frame)
      Window.draw(@x , @y, @image)
      Window.draw_font(str_x, str_y, str, str_font, color: color)
    end

    private

    # 文字が出力できるサイズからフォントサイズを求める
    def range_to_font_size(width, height)
      font = width / STR_LENGTH * HALF_TO_FULL
      return height if font > height
      return font
    end

    # 時刻をフレームから時刻表示の文字列に変換する
    def set_time_str(frame)
      str = ""
      str += "%1d：" % (frame * FRAME_TO_SEC * SEC_TO_MIN )
      str += "%02d：" % ( frame * FRAME_TO_SEC % MIN_TO_SEC )
      str += "%02d" % ( (frame * FRAME_TO_SEC % MIN_TO_SEC) * 100.0 % 100 )
      return str
    end
  end
end
