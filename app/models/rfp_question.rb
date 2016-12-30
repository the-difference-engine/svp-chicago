class RfpQuestion < ActiveRecord::Base
  belongs_to :rfp_section, -> { order "id" }
  has_many :sub_questions, -> { where(is_active: true).order(:id) }

  has_many :sub_answers
  has_many :rfp_answers

  validates :question, presence: true
  validates :rfp_section_id, presence: true
  validates :question_type, presence: true

end
