class Api::V1::InvitedLoisController < ApplicationController
  def index
    @invited_lois = InvitedLoi.all
    render 'index.json.jbuilder'
  end

  def show
    @invited_loi = InvitedLoi.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @invited_loi = InvitedLoi.create(
      status: params[:status],
      loi_id: params[:loi_id]

    )

    #CREATE LOI ACCEPTANCE EMAIL TEMPLATE
    loi = Loi.find(params[:loi_id])

    user = User.find(loi.user_id)

    UserNotifier.send_rfp_acceptance(user).deliver

    render 'show.json.jbuilder'
  end
end
