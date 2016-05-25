class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @admin_users = User.where(admin: true)
    @users = User.where(admin: false)
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find_by(id: params[:id])

    if params[:super_admin]
      @user.super_admin = !@user.super_admin
    elsif params[:admin]
      @user.admin = !@user.admin
    end
    @user.save

    flash[:success] = "Admin Updated"
    redirect_to "/users"
  end
end
