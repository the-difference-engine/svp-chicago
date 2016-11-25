class RatingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @invite_max = InviteMax.first.max
    @yes_ratings = Rating.where(user_id: current_user.id).where(q5: 'Yes')
    gon.current_user_id = current_user.id

    if user_signed_in? && current_user.super_admin
      @ratings = Rating.all
      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    else
      @ratings = Rating.where(user_id: current_user.id)
      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    end

  end

  def show
  	@rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  	@loi_id = params[:loi]
  end

  def create
  	@rating = Rating.new(
  		user_id: current_user.id,
  		loi_id: params[:loi_id],
  		q1: params[:q1],
  		q2: params[:q2],
  		q3: params[:q3],
  		q5: params[:q5],
  		weighted_score: 5,
      comment: params[:comment]
  	)
  	if @rating.save
  		redirect_to '/ratings'
  		flash[:success] = "Rating Submitted!"
  	else
      error_message = "Error! "
      @rating.errors.full_messages.each_with_index do |message, index|
        error_message += (message.to_s)
        if index < @rating.errors.full_messages.length - 1
          error_message += " | "
        end
      end 
  		redirect_to :back
      flash[:warning] = error_message
  	end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(
      user_id: current_user.id,
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q5: params[:q5],
      weighted_score: 5,
      comment: params[:comment]
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
