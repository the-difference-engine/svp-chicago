class InviteMaxesController < ApplicationController
  before_action :authenticate_super_admin!

  def edit
    @invite_max = InviteMax.find_by(id: params[:id])
  end

  def update
    @invite_max = InviteMax.find_by(id: params[:id])

    if !@invite_max.blank?
      @invite_max.update(
        max: params[:max]
      )
    end

    if @invite_max.save
      redirect_to "/invite_maxes/1/edit"
      flash[:success] = "Number updated!"
    else
      redirect_to '/invite_maxes/1/edit'
      flash[:danger] = "Maximum number cannot be empty"
    end
  end
end
