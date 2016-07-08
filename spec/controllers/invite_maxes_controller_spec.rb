require 'rails_helper'

RSpec.describe InviteMaxesController, type: :controller do

  describe "#update" do
    it "updates the number of invite maximums" do
      @invite_max = InviteMax.create(
        max: 10)
      @invite_max.update(
        max: 12)
      expect(@invite_max.max).to eq(12)
    end
  end

end
