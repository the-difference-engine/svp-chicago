class InviteMaxesController < ApplicationController
  
  def edit
    @invite_max = InviteMax.find_by(id: params[:id])
  end

  def update
    @invite_max = InviteMax.find_by(id: params[:id])
    
    
    @invite_max.update(
      max: params[:max]
    )
    if @invite_max.save 
      render :edit
      flash[:success] = "Number updated!"
    else
      redirect_to :edit
      flash[:warning] = "Missing elements in rating!"

    end
  end
end
