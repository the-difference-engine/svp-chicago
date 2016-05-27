class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :section

  validates :question, :section_id, presence: true
  
end
