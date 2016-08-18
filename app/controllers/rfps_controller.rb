class RfpsController < ApplicationController
  def new
    # get user id for attachments api controller create method
    $attachment_user_id = current_user.id

    user_has_loi = Loi.find_by(user_id:current_user.id)

    if user_has_loi
      user_loi_status = user_has_loi.status
    else
      user_loi_status = false
    end

    unless user_loi_status || current_user.super_admin
      redirect_to '/'
    end
  
  end 


 def show
  @rfp = Rfp.find(params[:id])
  gon.id = @rfp.id
 end 

  def index
    @rfps = Rfp.all
  end
  
end
