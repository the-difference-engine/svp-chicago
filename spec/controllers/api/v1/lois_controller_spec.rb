require 'rails_helper'



RSpec.describe Api::V1::LoisController, type: :controller do

def login_user
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in FactoryGirl.create(:user)
end

Mail.defaults do
  delivery_method :test # in practice you'd do this in spec_helper.rb
end

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "create loi" do
  #   it "sends email" do
  #     expect(Mail::TestMailer.deliveries).to be_empty
  #   end
  # end

  describe "save loi" do

    before :each do
      login_user
    end

    it "sends email" do

        answer = FactoryGirl.build(:answer)
        allow(Answer).to receive(:create).and_return answer
        allow(Challenge).to receive(:create).and_return nil
        
        post :create, name: "paul", email: "email@email.com", submitted: true, user_id: 1, 
                      demographic_answers: [], 
                      contact_answers: [],
                      organization_answers: [],
                      overview_answers: [],
                      vision_answers: [],
                      concern_answers: [],
                      challenge_answers: [],
                      referral_answers: [],
                      geographic_answers: []
        
        expect(Mail::TestMailer.deliveries.length).to eq(1)
    end
  end
end
