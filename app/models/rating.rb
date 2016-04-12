class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :loi

	def weighted_score
		total = q1 + q2 + q3 + q4 
		total/4.to_f
	end
end
