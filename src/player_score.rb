#player score menagement
#Kang
class Player_score
    def initialize
       @game = [0, 0, 0, 0, 0]
   end

   #get score
   #num => game number
   def get_score(num)
       return @game[num]
   end

   #set score
   #num => game number
   def set_score(num, socre)
       @game[num] = score
   end
end

