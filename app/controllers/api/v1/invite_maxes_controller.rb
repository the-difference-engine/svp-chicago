class Api::V1::InviteMaxesController < ApplicationController
  def index
    @invite_maxes = InviteMax.all
    render 'index.json.jbuilder'
  end

  def show
    @invite_max = InviteMax.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end
end
