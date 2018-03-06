module Title
  class Director
    def initialize(input)
      @font = Font.new(32, 'ＭＳ Ｐゴシック')
      @input = input
    end

    #実行するゲームを選択して分岐するゲームはgame1, game2, game3, game4, game5
    def play
      Window.draw_font(300, 280, "ミニゲーム集", @font)
      Window.draw_line(230, 330, 460, 330, C_WHITE)
      Scene.move_to(:game) if @input.get_input
    end
  end
end
