class Player
  attr_accessor :x

  def initialize
    @image = Image.load('images/player.png')
    @image.set_color_key(C_BLACK)
    @x = 400
    @y = 300
  end

  def draw
    Window.draw(@x, @y, @image)
    @y += Input.y
  end
end
