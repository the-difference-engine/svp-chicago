class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :loi

	def weighted_score
		total = q1 + q2 + q3 + q4 
		total/4.to_f
	end

  def self.to_csv
    attributes = %w{id q1 q2 q3 q4 q5 weighted_score}
   
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |rating|
        csv << rating.attributes.values_at(*attributes)
      end
    end
  end
end
