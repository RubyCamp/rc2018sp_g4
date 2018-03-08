class Out
    def initialize
        @image = Image.load('images/player.png')
        @back1 = Image.load('images/back1.png')
        @font = Font.new(32, 'ＭＳ Ｐゴシック')
        @x = 240
        @y = 150
        @image.set_color_key(C_BLACK)

    end

    def draw
#        Window.draw_font(300, 150, "Throwing Game", @font,:color=>C_BLACK)
        Window.draw_font(300, 150, "Throwing Game", @font)
        Window.draw_font(300, 200, "Balance Game", @font)
        Window.draw_font(300, 250, "Timer Stop Game", @font)
        Window.draw_font(300, 300, "Rock-paper-scissors", @font)
        Window.draw_font(300, 350, "終了", @font)
        Window.draw(@x, @y, @image)
    end

    def set_y(dot)
        @y = dot
        #@menu_select.play
    end
  end
