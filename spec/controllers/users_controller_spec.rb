require 'rails_helper'

def login_user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end
end

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

def login_super_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:super_admin]
    sign_in FactoryGirl.create(:super_admin)
  end
end

RSpec.describe UsersController, type: :controller do

  describe "update" do
    context "user is logged in" do
      login_user

      it 'user should not toggle admin status' do
        patch :update, id: User.last.id, admin: true
        expect(response).to redirect_to("/")
        
      end

      # it 'should not toggle account status' do 
      #   expect{
      #     update :update, {active_account: true}
      #   }.to change(User.last.admin, :count).by(0)
      # end


      # it 'should redirect to root path if email is provided' do
      #   post :create, {email: "test@example.com"}
      #   expect(response).to redirect_to(root_path)
      # end

      # it 'should render new if admin is not valid' do
      #   post :create
      #   expect(response).to render_template(:new)
      # end
    end 

    context "admin is logged in" do
      login_admin

      it 'admin should not toggle admin status' do
        patch :update, id: User.last.id, admin: true
        expect(response).to redirect_to("/")
        
      end
    end

    context "superadmin is logged in" do
      login_super_admin

      it 'superadmin should toggle an account to admin' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        FactoryGirl.create(:user)

        patch :update, id: User.last.id, admin: true
        # binding.pry
        expect(User.last.admin).to be(true)
      end

    end
  end

end
