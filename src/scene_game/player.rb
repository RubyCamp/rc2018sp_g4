class Player
  attr_accessor :x

  def initialize
    @image = Image.load('images/select.png')
    @image.set_color_key(C_BLACK)
    @x = 50
    @y = 100
    @font = Font.new(32, 'ＭＳ Ｐゴシック')
  end

  def draw
    Window.draw_font(250, 280, "テスト１", @font)
    Window.draw(@x, @y, @image)
    @y += Input.y
  end
end
