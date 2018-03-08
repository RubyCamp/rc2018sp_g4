# encoding: utf-8
require 'dxruby'

Window.width = 800
Window.height = 600

i1 = 0
j1 = 0
k1 = 0

i2 = 0
j2 = 0
k2 = 0
c = 0
s = 0

v1 = 0
v2 = 0

@gu = Image.load('images/gu.png')
@cho = Image.load('images/cho.png')
@pa = Image.load('images/pa.png')
@bou = Image.load('images/bou.png')
@c1 = Image.load('images/c1.png')
@c2 = Image.load('images/c2.png')
@c3 = Image.load('images/c3.png')
@aiko = Image.load('images/aiko.png')
@kati = Image.load('images/kati.png')
@make = Image.load('images/make.png')
@x1 = 50
@y1 = 150
@x2 = 520
@y2 = 150

@font = Font.new(50, font_name="ＭＳ Ｐゴシック")

Window.loop do

  if Input.key_down?(K_1)
    i1 = i1 + 1
  else
    if i1 > 180
      k1 = 1
    elsif i1 > 0
      p "!!"
      j1 = (j1 + 1) % 3
      i1 = 0
    end
  end

  if Input.key_down?(K_2)
    i2 = i2 + 1
  else
    if i2 > 180
      k2 = 1
    elsif i2 > 0
      p "!!"
      j2 = (j2 + 1) % 3
      i2 = 0
    end
  end

if s <= 5 || s >= 12
 if j1 == 0
   Window.draw(@x1, @y1, @gu)
 elsif j1 == 1
   Window.draw(@x1, @y1, @cho)
 elsif j1 == 2
   Window.draw(@x1, @y1, @pa)
 end

 if j2 == 0
   Window.draw(@x2, @y2, @gu)
 elsif j2 == 1
   Window.draw(@x2, @y2, @cho)
 elsif j2 == 2
   Window.draw(@x2, @y2, @pa)
 end
end

Window.draw(385, 0, @bou)

Window.draw_font(0, 0,"P1 勝利数#{v1}", @font)
Window.draw_font(550, 0,"P2 勝利数#{v2}", @font)

break if Input.key_push?(K_4)

c += 1
s = c / 60

if s > 5 && s < 8
  Window.draw(280, 300, @c3)
elsif s >= 8 && s < 10
  Window.draw(280, 300, @c2)
elsif s >= 10 && s < 12
  Window.draw(280, 300, @c1)
elsif s >= 12
    i1 = 200
    i2 = 200
end

if s >= 12

  if j1 == j2
    Window.draw(290, 450, @aiko)
  elsif (j1 + 1) % 3 == j2
    Window.draw(0, 450, @kati)
    Window.draw(580, 450, @make)
    v1 += s / 16
  else
    Window.draw(580, 450, @kati)
    Window.draw(0, 450, @make)
    v2 += s / 16
  end

end

if v1 == 3 || v2 == 3
  s = 20

end

if s > 15 && s < 20
  i1 = 0
  j1 = 0
  k1 = 0

  i2 = 0
  j2 = 0
  k2 = 0
  c = 0
  s = 0
end

end
