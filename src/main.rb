﻿require_relative 'include'

Window.width = 800
Window.height = 600

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
input = Controller.new(board)
player1 = Player_score.new
player2 = Player_score.new

Scene.add(Title::Director.new(input), :title)
Scene.add(Game::Director.new(input), :game)
Scene.add(Game1::Director.new(input), :game1)
Scene.add(Game2::Director.new(input, player1), :game2)
Scene.add(Game3::Director.new(input, player1), :game3)
Scene.add(Game4::Director.new(input, player1), :game4)
Scene.add(Game5::Director.new(input, player1), :game5)

Scene.move_to(:title)

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end

__END__
ここからコメント
変更点とか今発見された問題を書いてください
f
