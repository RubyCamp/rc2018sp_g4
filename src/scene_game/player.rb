class Player
  attr_accessor :x

  def initialize
    @x = 50
    @y = 100
    @font = Font.new(32, 'ＭＳ Ｐゴシック')
  end

  def draw
    @y += Input.y
  end
end
