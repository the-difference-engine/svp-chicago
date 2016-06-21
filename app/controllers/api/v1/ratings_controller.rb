class Api::V1::RatingsController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:index]

  def index
  	if user_signed_in? && current_user.super_admin
  	  @ratings = Rating.all
  	else
  	  @ratings = Rating.where(user_id: current_user.id)
  	end
  end

  def show
  	@rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])

    if @rating.update(q5: params[:q5])
      render json: { message: "Rating Updated"}, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end
end
