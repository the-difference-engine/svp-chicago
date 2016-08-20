class Section < ActiveRecord::Base
  has_many :questions, -> { where(is_active: true).order(:id) }
end
