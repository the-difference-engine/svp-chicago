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
    render 'show.json.jbuilder'
  end
end
