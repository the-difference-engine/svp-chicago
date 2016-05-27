require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "is valid with a q1, q2, q3, q4" do
    rating = Rating.new(
      q1: 1,
      q2: 2,
      q3: 3,
      q4: 4,
      )
    expect(rating).to be_valid
  end

  it "returns and average of the four ratings" do
    rating = Rating.new(
      q1: 1,
      q2: 2,
      q3: 3,
      q4: 4,
      )
    expect(rating.weighted_score).to eq(2.5)
  end

end