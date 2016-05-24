class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.where(admin: true)
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.super_admin = !@user.super_admin
    @user.save

    flash[:success] = "Admin Updated"
    redirect_to "/users"
  end
end
