module Game1
	class Score
		@@SCORE = [30, 20, 10]
		@@RANGE = [20, 100, 200]

		def self.get_score(lance_position, circle_position)
			(0..2).each do |i|
				return @@SCORE[i] if (circle_position + 150 - lance_position).abs <= @@RANGE[i]
			end
			return 0
		end

		def clear
			@@SCORE = [30, 20, 10]
			@@RANGE = [ 50, 100, 200]	
		end

	end
end
