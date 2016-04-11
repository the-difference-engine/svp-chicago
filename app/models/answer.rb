class Answer < ActiveRecord::Base
  belongs_to :loi
  belongs_to :question
end
