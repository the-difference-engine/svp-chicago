class RfpsController < ApplicationController
  def new
    user_loi_status = Loi.find_by(user_id:current_user.id).status
    
    if !user_loi_status
      redirect_to '/'
    end
    
  end 
end
