class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_super_admin!, only: [:index, :update]

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
    
    @user.save

    flash[:success] = "Admin Updated"
    end

    if params[:active]
      @user.active_account = !@user.active_account

    @user.save

    flash[:success] = "Account Updated"
    end

    redirect_to "/users"   
  end

end