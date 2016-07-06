require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "should create a new rating" do
      @rating = Rating.create(
        q1: 1,
        q2: 2,
        q3: 3,
        q4: 4,
        q5: "yes"
        )
      
      expect(@rating.q1).to eq(1)
      expect(@rating.q5).to be_truthy

    end
  end

  describe "#update" do
    it "should create a new rating" do
      @rating = Rating.create(
        q1: 1,
        q2: 2,
        q3: 3,
        q4: 4,
        q5: "yes"
        )
      
      expect(@rating.q1).to eq(1)
      expect(@rating.q5).to be_truthy
      
    end
  end
end
