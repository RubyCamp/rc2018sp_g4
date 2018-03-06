require_relative 'player'
require 'smalrubot'

module Game4
  class Director
    def initialize(input)
      @input = input
      @player = Player.new
      @frm = 1
      @dx = 0
    end

    def play
      p @input.get_sw1
      @frm += 1
      @frm = 0 if @frm > 30

      @player.x += @dx
      @player.draw
    end
  end
end
