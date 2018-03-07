module Game1
	class Score
		@@SCORE = [30, 20, 10]
		@@RANGE = [ 5, 10, 20]

		def get_score(position)
			(0..2).each do |i|
				return @@SCORE[i] if (500 - position).abs <= @@RANGE
			end
			return 0
		end
	end
end
