#Kang
require_relative 'output.rb'

#メニュー
#ここには入力と入力によって画面の制御を行う
#画面出力はoutputの方で行う
module Game
  class Director
    def initialize(input)
      @input = input
      @output = Out.new

      @menu_hash = {0=>150, 1=>200, 2=>250, 3=>300, 4=>350}
      @s_hash = {0=>:game1, 1=>:game2, 2=>:game4, 3=>:game5, 4=>:game3}
      @frm = 1
      @scene_flag = 0;
      @menu_bgm = Sound.new("menu_music/menu_bgm.wav")
      @menu_bgm.set_volume(190,0)
      @menu_select = Sound.new("menu_music/select.wav")
      @menu_define = Sound.new("menu_music/menu_define.wav")
      @bgm_on = false

    end

    def play
      @frm += 1
      @frm = 0 if @frm > 7
      @output.set_y(@menu_hash[@scene_flag])
      @output.draw
      if @bgm_on == false
        @menu_bgm.play
        @bgm_on = true
      end

      @scene_flag += @input.get_sw1 if @frm == 1
      @scene_flag %= 5

      @menu_select.play if @input.get_sw1 == 1 && @frm == 1



      if @input.get_sw2 == 1 && @frm == 1 then
        @menu_bgm.stop
        @bgm_on = false
        @menu_define.play
        sleep(0.5)
        Scene.move_to(@s_hash[@scene_flag])
        self.clear
      end
    end

    def clear
      @scene_flag = 0;
      @frm = 0;
      @bgm_on = false

    end
  end
end
