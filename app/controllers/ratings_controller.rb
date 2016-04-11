class RatingsController < ApplicationController
  def index
  	@ratings = Rating.all
  end

  def show
  	@rating = Rating.find(params[:id])
  end
end
