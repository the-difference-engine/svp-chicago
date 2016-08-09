class RfpAnswer < ActiveRecord::Base
  belongs_to :rfp
  belongs_to :rfp_question
  belongs_to :sub_question

  has_many :sub_answers
end
