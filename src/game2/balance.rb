# encoding: utf-8
require 'dxruby'
require 'smalrubot'
board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)

Window.width = 800
Window.height = 600

@bar = Image.load('images/bar.png')
@hako = Image.load('images/hako.png')
@end = Image.load('images/gameover.png')
@huji = Image.load('images/019AME5031_TP_V.png')
@ran = 0
@an = 0
@iti = 350
@aiti = 51

start=0
count=0
mod = 1
title = 0
c = 0
cs = 0
s = 0
l=board.analog_read(0)
d=board.digital_read(2)


@font = Font.new(50, font_name="ＭＳ Ｐゴシック")
@font2 = Font.new(100, font_name="ＭＳ Ｐゴシック")

Window.loop do

  if title == 0
  Window.draw_font(70, 10,"バランスゲーム", @font2)
  count +=1
  if count == 300
    title = 1
    count = 0
  end
elsif title == 1

  puts d
  puts l
  count +=1
  start +=1

  if count==25
     count=0
    d=board.digital_read(2)
    l=board.analog_read(0)
  end
    l= l/3.0 + 4
  if start <= 300
    l = 5
  end

  if mod == 1 || mod == 2
    Window.draw_rot(0, 300, @bar, @ran, 401, 0)
    Window.draw_rot(@iti, 200, @hako, @ran, @aiti, 101)
    Window.draw(249, 265, @huji)
    @an += l if d==0
    @an -= l if d==1
    @ran = @an / 60
    @iti += @ran / 3
    @aiti -= @ran / 3
    if mod == 1
      c += 1
      Window.draw_font(0, 0,"一回戦", @font)
    else
      c -= 1
      Window.draw_font(0, 0,"二回戦", @font)
    end
    Window.draw_font(300, 0,"タイム #{c/60}", @font)
  end

  if (@iti < 20 || @iti > 680) && cs < 600
    mod = 0
  end

  if (@iti < 20 || @iti > 680) && cs >= 600
    mod = 3
    s = 1
  elsif c < 0
    mod = 3
    s = 2
  end

  if mod == 0
    Window.draw(0, 0, @end)
    Window.draw_font(250, 0,"タイマー #{c/60}", @font)
    cs += 1
    if cs == 600
      @an = 0
      @iti = 350
      @aiti = 51
      mod = 2
      start = 0
    end
  end

  if mod == 3
    if s == 1
      Window.draw_font(200, 200,"勝利　プレイヤー１", @font)
    elsif s == 2
      Window.draw_font(200, 200,"勝利　プレイヤー２", @font)
    end
  end
end
  break if Input.key_push?(K_5)

end
