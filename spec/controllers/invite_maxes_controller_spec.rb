require 'rails_helper'

RSpec.describe InviteMaxesController, type: :controller do

  describe "PATCH #update" do
    before :each do
      @invite_max = InviteMax.create(max: 10)
    end

    it "updates the number of invite maximums" do
      @invite_max.update(max: 12)
      expect(@invite_max.max).to eq(12)
    end

    it "does not update when max is nil" do
      @invite_max.update(max: nil)
      @invite_max.reload
      expect(@invite_max.max).to eq(10)
    end
  end

end
