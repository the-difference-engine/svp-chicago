class RfpsController < ApplicationController
  def new
    user_has_loi = Loi.find_by(user_id:current_user.id)

    if user_has_loi
      user_loi_status = user_loi.status
    else
      user_loi_status = false
    end

    unless user_loi_status || current_user.super_admin
      redirect_to '/'
    end
    
  end 
end
