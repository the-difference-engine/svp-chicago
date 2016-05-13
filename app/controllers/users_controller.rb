class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]
  
  def index
    @users = User.all
  end

  # def show
  #   @user = User.find(current_user.id)
  # end

  def update
    @user = User.find_by(id: params[:id])
    @user.admin = !@user.admin
    @user.save

    flash[:success] = "Admin Updated"
    redirect_to "/users"
  end
end
