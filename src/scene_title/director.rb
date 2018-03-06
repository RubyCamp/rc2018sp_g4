module Title
  class Director
    def initialize
      @font = Font.new(32, 'ＭＳ Ｐゴシック')
    end

    #実行するゲームを選択して分岐するゲームはgame1, game2, game3, game4, game5
    def play
      Window.draw_font(250, 280, "タイトル画面", @font)
      Scene.move_to(:game) if Input.key_push?(K_SPACE)
    end
  end
end
