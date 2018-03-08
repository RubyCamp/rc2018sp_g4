class Output
  def initialize
    @image = Image.load('images/score.png')
    @x = 0
    @y = 0
    @image.set_color_key(C_BLACK)
  end

  def draw
    Window.draw(@x,@y,@image)
  end
end
