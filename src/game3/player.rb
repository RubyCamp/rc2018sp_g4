module Game3
  class Player

    def initialize(x, y)
      @image = Image.load('images/player.png')
      @image.set_color_key(C_BLACK)
      @x = x
      @y = y
      @angle = 0
    end

    def draw
      Window.draw(@x, @y, @image)
    end

    def set_x(x)
      @x = x
    end

    def set_y(y)
      @y = y
    end

    def get_x
      return @x
    end

    def get_y
      return @y
    end


  end
end
