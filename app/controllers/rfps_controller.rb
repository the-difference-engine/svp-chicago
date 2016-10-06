class RfpsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show, :new]
  before_action :authenticate_admin!, only: [:index, :destroy]

  def new
    # get user id for attachments api controller create method
    $attachment_user_id = current_user.id

    user_has_loi = Loi.find_by(user_id:current_user.id)

    if user_has_loi
      user_loi_status = user_has_loi.status
    else
      user_loi_status = false
    end

    user_has_rfps = Rfp.where(user_id: current_user.id)

    if user_has_rfps
      user_has_rfps.each do |rfp|
        if rfp.submitted
          flash[:warning] = "You already submitted an RFP on #{rfp.updated_at}. Only one RFP Submission is permitted."
          redirect_to "/"
          break
        end
      end
    else
      unless user_loi_status || current_user.super_admin
        flash[:warning] = "Restricted Access"
        redirect_to "/"
      end
    end

  end


 def show
    @rfp = Rfp.find(params[:id])
    @rfp_sections = RfpSection.order('id ASC').all
    gon.id = @rfp.id
 end

  def index
    @rfps = Rfp.all
  end

end
