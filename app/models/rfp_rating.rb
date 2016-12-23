class RfpRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :rfp
  validates :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12, presence: true
  validates :rfp_id, uniqueness: {scope: :user_id, message: "You've already submitted a rating this Request for Proposal. Please refresh the page to 'Edit' your rating."}

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
    sum = [q1, q2, q3, q4, q5, q8, q9, q10, q11, q12]
    (sum.sum / sum.length.to_f).round(2)
  end

  def self.to_csv
    attributes = %w{id q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 weighted_score comments follow_up invited rated_by}
   
    CSV.generate(headers: true) do |csv|

      csv << attributes
      all.each do |rating|
        csv.add_row([
          rating.id,
          rating.q1,
          rating.q2,
          rating.q3,
          rating.q4,
          rating.q5,
          rating.q6,
          rating.q7,
          rating.q8,
          rating.q9,
          rating.q10,
          rating.q11,
          rating.q12,
          rating.weighted_score,
          rating.comments,
          rating.follow_up,
          rating.invited,
          rating.user.email
          ])
      end
    end
  end

end
