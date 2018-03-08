require_relative 'player'

module Game3
  class Director
    def initialize(input, score)
      @score = score
      @input = input
      @dot1 = Player.new(50, 50)
      @dot2 = Player.new(400, 400)
      @dot3 = Player.new(300, 50)
      @dot4 = Player.new(50, 500)
      @mid = Player.new(0,0)
      @frm = 1
      @dx = 0
      @dy = 0
      @end = Image.load('images/end.png')

      self.calc
    end

    def play
      @frm += 1
      Window.draw(0, 0, @end)
      #@dot1.draw
      #@dot2.draw
      #@dot3.draw
      #@dot4.draw
      #@mid.draw
      exit if @frm > 300
    end

    def clear
      @frm = 1
      @dx = 0
    end

    def calc
      min = 9999999
      temp = 0
      d1 = 0
      d2 = 0
      d3 = 0
      d4 = 0

      for idx_x in 50..400 do
        temp = 0
        for idx_y in 50..500 do
          x1 = (idx_x - @dot1.get_x).abs
          y1 = (idx_y - @dot1.get_y).abs
          d1 = Math.sqrt(x1 * x1 + y1 * y1)
          temp += d1

          x2 = (idx_x - @dot2.get_x).abs
          y2 = (idx_y - @dot2.get_y).abs
          d2 = Math.sqrt(x2 * x2 + y2 * y2)
          temp += d2
          
          x3 = (idx_x - @dot3.get_x).abs
          y3 = (idx_y - @dot3.get_y).abs
          d3 = Math.sqrt(x3 * x3 + y3 * y3)
          temp += d3
          
          x4 = (idx_x - @dot4.get_x).abs
          y4 = (idx_y - @dot4.get_y).abs
          d4 = Math.sqrt(x4 * x4 + y4 * y4)
          temp += d4
                  
          if min > temp
            @mid.set_x(idx_x)
            @mid.set_y(idx_y)
  
            min = temp
            @dx = idx_x
            @dy = idx_y
          end
          temp = 0
        end
      end
    end


  end
end
