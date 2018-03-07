# encoding: utf-8
require 'dxruby'

Window.width = 800
Window.height = 600

@bar = Image.load('images/bar.png')
@hako = Image.load('images/hako.png')
@end = Image.load('images/gameover.png')
@huji = Image.load('images/019AME5031_TP_V.png')
@an = 0
@iti = 350
@aiti = 51

mod = 1
c = 0
cs = 0
s = 0

@font = Font.new(50, font_name="ＭＳ Ｐゴシック")

Window.loop do

  if mod == 1 || mod == 2
    Window.draw_rot(0, 300, @bar, @an, 401, 0)
    Window.draw_rot(@iti, 200, @hako, @an, @aiti, 101)
    Window.draw(249, 265, @huji)
    @an += 1 if Input.key_down?(K_1)
    @an -= 1 if Input.key_down?(K_2)
    @iti += @an / 3
    @aiti -= @an / 3
    if mod == 1
      c += 1
      Window.draw_font(0, 0,"プレイヤー１", @font)
    else
      c -= 1
      Window.draw_font(0, 0,"プレイヤー２", @font)
    end
    Window.draw_font(300, 0,"タイム #{c/60}", @font)
  end

  if (@iti < 20 || @iti > 680) && cs < 180
    mod = 0
  end

  if (@iti < 20 || @iti > 680) && cs >= 180
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
    if cs == 180
      @an = 0
      @iti = 350
      @aiti = 51
      mod = 2
    end
  end

  if mod == 3
    if s == 1
      Window.draw_font(200, 200,"勝利　プレイヤー１", @font)
    elsif s == 2
      Window.draw_font(200, 200,"勝利　プレイヤー２", @font)
    end
  end

  break if Input.key_push?(K_5)

end
