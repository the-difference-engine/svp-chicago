class RfpRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :rfp

  def weighted_score
    # Attempted automated method, calculates q# scores, adds them and divides by the count of scores
    # sum = 0
    # count = 0
    # attributes.each do |k, v|
    #   if v.is_a? Integer && k != 'id'
    #     sum = sum + v
    #     count = count + 1
    #   end
    # end
    # return sum / count

    # Below is weighted_score counted by hand
    sum = [q1, q2, q3, q4, q5, q6, q7, q9, q11]
    (sum.sum / sum.length.to_f).round(2)
  end




  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |ratings|
        csv << ratings.attributes.values_at(*column_names)
      end
    end


  end
end
