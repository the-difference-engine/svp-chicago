class RfpSection < ActiveRecord::Base
  has_many :rfp_questions, -> { where(is_active: true).order(:id) }
  belongs_to :rfp
end


