class RfpSection < ActiveRecord::Base
  has_many :rfp_questions, -> { order "id" }
  belongs_to :rfp
end


