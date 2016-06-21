class RfpQuestion < ActiveRecord::Base
  belongs_to :rfp_section, -> { order "id" }
end
