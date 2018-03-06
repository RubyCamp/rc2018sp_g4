require_relative 'player'

module Game
  class Director
    def initialize(input)
      @image = Image.load('images/player.png')
      @image.set_color_key(C_BLACK)
      @x = 240
      @y = 150  

      @font = Font.new(32, 'ＭＳ Ｐゴシック')
      @input = input
      @frm = 1
      @scene_flag = 0;
    end

    def play
      @frm += 1
      @frm = 0 if @frm > 15

      Window.draw_font(300, 150, "ゲーム1", @font)
      Window.draw_font(300, 200, "ゲーム2", @font)
      Window.draw_font(300, 250, "ゲーム3", @font)
      Window.draw_font(300, 300, "ゲーム4", @font)
      Window.draw_font(300, 350, "ゲーム5", @font)
      Window.draw(@x, @y, @image)

      @scene_flag += @input.get_sw1 if @frm == 1
      @scene_flag %= 5
      @y = 150 if @scene_flag == 0
      @y = 200 if @scene_flag == 1
      @y = 250 if @scene_flag == 2
      @y = 300 if @scene_flag == 3
      @y = 350 if @scene_flag == 4
      
    end

    def change_scene        
       return @scene_flag
    end

  end

end
