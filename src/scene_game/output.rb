class Out
    def initialize
        @image = Image.load('images/player.png')
        @title = Image.load('images/title_mini.png')
        @back1 = Image.load('images/back1.png')
        @font = Font.new(32, 'ＭＳ Ｐゴシック')
        @font2 = Font.new(40, 'ＭＳ Ｐゴシック')
        @x = 240
        @y = 150
        @image.set_color_key(C_BLACK)

    end

    def draw
#        Window.draw_font(300, 150, "Throwing Game", @font,:color=>C_BLACK)
        Window.draw(0,0,@title)
        Window.draw_font(300, 80, "Game menu", @font2)
        Window.draw_font(300, 150, "Throwing Game", @font)
        Window.draw_font(300, 200, "Balance Game", @font)
        Window.draw_font(300, 250, "Timer Stop Game", @font)
        Window.draw_font(300, 300, "Rock-paper-scissors", @font)
        Window.draw_font(300, 350, "Exit", @font)
        Window.draw(@x, @y, @image)
    end

    def set_y(dot)
        @y = dot
        #@menu_select.play
    end
  end
