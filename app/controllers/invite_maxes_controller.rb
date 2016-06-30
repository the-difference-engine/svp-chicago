class InviteMaxesController < ApplicationController
  def update
    @invite_max.update(
      max: params[:max]
    )
    if @rating.save 
      redirect_to '/lois'
      flash[:success] = "Rating Updated!"
    else
      redirect_to :back
      flash[:warning] = "Missing elements in rating!"

    end
  end
end
