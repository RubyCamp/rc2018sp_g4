require_relative 'player'

module Game
  class Director
    def initialize(input)
      @image = Image.load('images/player.png')
      @image.set_color_key(C_BLACK)
      @x = 240
      @y = 150  
      @back1 = Image.load('images/back1.png')
      @back2 = Image.load('images/back2.png')

      @font = Font.new(32, 'ＭＳ Ｐゴシック')
      @input = input
      @frm = 1
      @scene_flag = 0;
      @menu_hash = {0=>150, 1=>200, 2=>250, 3=>300, 4=>350}
      @s_hash = {0=>:game1, 1=>:game2, 2=>:game3, 3=>:game4, 4=>:game5}
    end

    def play
      if @frm < 3 then
        Window.draw(0, 0, @back1)
      else 
        Window.draw(0, 0, @back2) 
      end

      @frm += 1
      @frm = 0 if @frm > 15
      @y = @menu_hash[@scene_flag]      

      Window.draw_font(300, 150, "ゲーム1", @font)
      Window.draw_font(300, 200, "ゲーム2", @font)
      Window.draw_font(300, 250, "ゲーム3", @font)
      Window.draw_font(300, 300, "ゲーム4", @font)
      Window.draw_font(300, 350, "ゲーム5", @font)
      Window.draw(@x, @y, @image)

      @scene_flag += @input.get_sw1 if @frm == 1
      @scene_flag %= 5
      Scene.move_to(@s_hash[@scene_flag]) if @input.get_sw2 == 1 && @frm == 1
    end
  end
end
