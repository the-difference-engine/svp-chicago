class Api::V1::RatingsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]
  def index
  	if user_signed_in? && current_user.admin
  	  @ratings = Rating.all
  	else
  	  @ratings = Rating.where(user_id: current_user.id)
  	end

  end

  def show
  	@rating = Rating.find(params[:id])
  end
end
