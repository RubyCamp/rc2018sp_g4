module Title
  class Director
    def initialize(input)
      @input = input
      @logo = Image.load('images/log.png')
      @color = [C_BLACK, C_RED,C_GREEN, C_BLUE, C_YELLOW, C_CYAN, C_MAGENTA, C_WHITE]
      @temp = 1
      @frm = 0
    end

    #実行するゲームを選択して分岐するゲームはgame1, game2, game3, game4, game5
    def play
      self.display 
      Window.draw(300, 150, @logo)
      @frm += 1
      @frm = 0 if @frm > 50
      @temp += @temp % 3 if @frm == 1
      Scene.move_to(:game) if @input.get_input
    end

    #背景を描く
    def display
      x = 800 / 20
      y = 600 / 20
      x1 = 0
      y1 = 0
      x2 = x
      y2 = y
      for i in 0..20 do
        for j in 0..20 do
          Window.draw_box_fill(x1,y1 ,x2 ,y2,@color[@temp % 6])
          @temp += 1
          x1 += x
          x2 += x 

        end
        x1 = 0
        x2 = x
        y1 += y
        y2 = y1 + y
      end
      @temp -= 399
    end    
  end
end
