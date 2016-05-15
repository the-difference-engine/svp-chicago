class RatingsController < ApplicationController

  
  def index
    
    # @rating_questions = ["Organization Name", "Fits SVP Criteria", "Potention SVP Impact", "Level of Excitement", "Benefit to SVP", "Invite to Submit RFP?", "Weighted Score", "Rated By"]

    if user_signed_in? && current_user.admin
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
  		q4: params[:q4],
  		q5: params[:q5],
  		weighted_score: 5
  	)
  	if @rating.save 
  		redirect_to '/ratings'
  		flash[:success] = "Rating Submitted!"
  	else
  		render :new
  	end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.new(
      user_id: current_user.id,
      loi_id: params[:loi_id],
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q4: params[:q4],
      q5: params[:q5],
      weighted_score: 5
    )
    if @rating.save 
      redirect_to '/ratings'
      flash[:success] = "Rating Submitted!"
    else
      render :new
    end
  end


end
