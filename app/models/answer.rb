class Answer < ActiveRecord::Base
  belongs_to :loi
  belongs_to :question
  has_one :fte
  has_many :challenges

  # validates :answer, presence: true



end
