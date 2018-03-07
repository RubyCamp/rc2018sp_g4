module Game1
	class Score
		@@SCORE = [30, 20, 10]
		@@RANGE = [ 50, 100, 200]

		def self.get_score(position)
			(0..2).each do |i|
				return @@SCORE[i] if (550 - position).abs <= @@RANGE[i]
			end
			return 0
		end
	end
end
