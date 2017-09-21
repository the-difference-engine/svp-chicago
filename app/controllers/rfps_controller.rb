class RfpsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show, :new]
  before_action :authenticate_admin!, only: [:index, :destroy]

  def new
    # get user id for attachments api controller create method
    $attachment_user_id = current_user.id

    user_has_loi = Loi.find_by(user_id:current_user.id)
    gon.user_id = current_user.id
    gon.loi_id = user_has_loi.id

    if user_has_loi && user_has_loi.invited_lois
      user_loi_status = true
    else
      user_loi_status = false
    end

    user_has_rfps = Rfp.where(user_id: current_user.id)

    if user_has_rfps.length > 0  && !current_user.admin
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
    @attachments = Attachment.where(rfp_id: @rfp.id)
    gon.id = @rfp.id
    @admins_ratings = RfpRating.find_by(user_id: current_user.id, rfp_id: @rfp.id)
    @doc_type_array = [ "IRS Determination Letter", 
                        "Organization Chart",
                        "Financial Statement: Recent Fiscal Year-End"]
    if current_user.rfp_ratings.find_by(rfp_id: @rfp.id) == nil
      @rating = RfpRating.new
    else
      @rating = current_user.rfp_ratings.find_by(rfp_id: params[:id])
    end
 end

  def index
    @rfps = Rfp.all
    gon.current_user_id = current_user.id

    respond_to do |format|
      format.html
      format.csv { send_data @rfps.to_csv, filename: "rfps-#{Date.today}.csv" }
    end
  end

  def edit
    @rfp = Rfp.find(params[:id])
    @attachments = Attachment.where(rfp_id: @rfp.id)
    @opt_attachment1 = @attachments.where(doc_type: "Current Strategic Plan")
    @opt_attachment2 = @attachments.where(doc_type: "Most Recent Annual Report")
    gon.id = @rfp.id
    gon.user_id = current_user.id
    if @attachments.length >= 5
      gon.req = true
    else
      gon.req = false
    end
  end

  def update
    @rfp = Rfp.find_by(id: params[:id])

    @rfp.update()
  end

end
