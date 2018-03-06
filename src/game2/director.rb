require_relative 'player'
require 'smalrubot'

module Game2
  class Director
    def initialize(input)
      @input = input
      @player = Player.new
      @frm = 1
      @dx = 0
    end

    def play
      p @input.get_sw2
      @frm += 1
      @frm = 0 if @frm > 30

      @player.x += @dx
      @player.draw
    end

    def clear
      @frm = 1
      @dx = 0
    end
  end
end
