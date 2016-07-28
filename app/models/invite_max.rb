class InviteMax < ActiveRecord::Base
  validates :max, :presence => true
end
