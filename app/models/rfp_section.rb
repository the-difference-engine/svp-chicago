class RfpSection < ActiveRecord::Base
  has_many :rfp_questions, -> { order "id" }
end
