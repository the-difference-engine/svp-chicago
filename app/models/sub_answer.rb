class SubAnswer < ActiveRecord::Base
  belongs_to :rfp_question
  belongs_to :sub_question
  belongs_to :rfp
  belongs_to :user

end
