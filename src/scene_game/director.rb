require_relative 'player'
require_relative 'output.rb'
module Game
  class Director
    def initialize(input)
      @output = Out.new
      @menu_hash = {0=>150, 1=>200, 2=>250, 3=>300, 4=>350}
      @s_hash = {0=>:game1, 1=>:game2, 2=>:game3, 3=>:game4, 4=>:game5}
      @input = input
      @frm = 1
      @scene_flag = 0;
    end

    def play
      @frm += 1
      @frm = 0 if @frm > 7
      @output.set_y(@menu_hash[@scene_flag])      
      @output.draw

      @scene_flag += @input.get_sw1 if @frm == 1
      @scene_flag %= 5

      if @input.get_sw2 == 1 && @frm == 1 then
        Scene.move_to(@s_hash[@scene_flag]) 
        self.clear        
      end
    end

    def clear
      @scene_flag = 0;      
      @frm = 0;
    end
  end
end
