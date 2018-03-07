class Player_score
    def initialize
       @game = [0, 0, 0, 0, 0]
   end

   def get_score(num)
       return @game[num]
   end

   def set_score(num, socre)
       @game[num] = score
   end
end

