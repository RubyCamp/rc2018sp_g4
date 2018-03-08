class Out
    def initialize
        @image = Image.load('images/player.png')
        @back1 = Image.load('images/back1.png')
        @back2 = Image.load('images/back2.png')
        @font = Font.new(32, 'ＭＳ Ｐゴシック')
        @x = 240
        @y = 150
        @image.set_color_key(C_BLACK)

    end

    def draw
        Window.draw_font(300, 150, "ゲーム1", @font)
        Window.draw_font(300, 200, "ゲーム2", @font)
        Window.draw_font(300, 250, "ゲーム3", @font)
        Window.draw_font(300, 300, "ゲーム4", @font)
        Window.draw_font(300, 350, "ゲーム5", @font)
        Window.draw(@x, @y, @image)
    end

    def set_y(dot)
        @y = dot
        #@menu_select.play
    end
  end
