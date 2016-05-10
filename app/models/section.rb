class Section < ActiveRecord::Base
	has_many :questions, -> { order "id" }
end
