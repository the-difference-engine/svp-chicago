class Loi < ActiveRecord::Base
  has_many :answers
  has_many :ratings
end
