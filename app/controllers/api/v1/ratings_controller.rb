class Api::V1::RatingsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]
  def index
  	@ratings = Rating.all
  end

  def show
  	@rating = Rating.find(params[:id])
  end
end
