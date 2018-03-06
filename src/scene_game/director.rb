require_relative 'player'
require 'smalrubot'

module Game
  class Director
    def initialize(input)
      @input = input
      @frm = 1
      @scene_flag = 0;
    end

    def play
      p @input.get_mic
      @frm += 1
      @frm = 0 if @frm > 30
      #この間にセレクト画面作る
      #
     end

    def change_scene        
       return @scene_flag
    end

  end

end
