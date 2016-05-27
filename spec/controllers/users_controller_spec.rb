require 'rails_helper'

def login_user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end
end

RSpec.describe UsersController, type: :controller do

  describe "update" do
    context "user is logged in" do
      login_user

      it 'should not toggle admin status' do 
        expect{
          update :update, {admin: true}
        }.to change(User.admin, :count).by(1)
      end

      it 'should redirect to root path if email is provided' do
        post :create, {email: "test@example.com"}
        expect(response).to redirect_to(root_path)
      end

      it 'should render new if admin is not valid' do
        post :create
        expect(response).to render_template(:new)
      end
    end 

    context "admin is NOT logged in" do
      it 'should not create a new admin' do
        expect{
          post :create, {email: "test@example.com"}
        }.to change(Admin, :count).by(0)
      end

    end
  end

end
