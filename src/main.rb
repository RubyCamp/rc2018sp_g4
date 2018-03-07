require 'dxruby'
require 'smalrubot'
require_relative 'scene'
require_relative 'scene_title/director'
require_relative 'scene_game/director'
require_relative 'game1/director'
require_relative 'game2/director'
require_relative 'game3/director'
require_relative 'game4/director'
require_relative 'game5/director'
require_relative 'sensor_input'

Window.width = 800
Window.height = 600

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
input = Controller.new(board)

Scene.add(Title::Director.new(input), :title)
Scene.add(Game::Director.new(input), :game)
Scene.add(Game1::Director.new(input), :game1)
Scene.add(Game2::Director.new(input), :game2)
Scene.add(Game3::Director.new(input), :game3)
Scene.add(Game4::Director.new(input), :game4)
Scene.add(Game5::Director.new(input), :game5)

Scene.move_to(:title)

Window.loop do
  break if Input.key_push?(K_ESCAPE)

  Scene.play
end

__END__
ここからコメント
変更点とか今発見された問題を書いてください

sada