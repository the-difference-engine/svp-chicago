class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_super_admin!, only: [:index, :update]

  def index
    @admin_users = User.where(admin: true)
    @users = User.where(admin: false)
  end

  def create
    # Create the user from params
    @user = User.new(params[:user])
    if @user.save
      # Deliver the signup email
      UserNotifier.send_notification(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end

  def show
    @dashboard = Dashboard.first
    @user = User.find(current_user.id)
    user_has_submitted_loi = Loi.find_by(user_id: current_user.id, submitted: true)

    if user_has_submitted_loi
      has_invited_loi = InvitedLoi.find_by(loi_id: user_has_submitted_loi.id)
      if has_invited_loi
        @user_loi_status = has_invited_loi.status
      else
        @user_loi_status = false
      end
    else
      @user_loi_status = false
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if params[:super_admin]
      @user.super_admin = !@user.super_admin
    elsif params[:admin]
      @user.admin = !@user.admin
    end

    if params[:active]
      @user.active_account = !@user.active_account
      @user.save
    end

    # Rails.logger @user

    @user.save
    flash[:success] = "Account Updated"

    redirect_to "/users"
  end

end
