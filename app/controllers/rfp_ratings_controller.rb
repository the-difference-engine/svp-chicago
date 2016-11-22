class RfpRatingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @invite_max = InviteMax.first.max
    @yes_ratings = RfpRating.where(user_id: current_user.id).where(q5: 'Yes')
    gon.current_user_id = current_user.id

    if user_signed_in? && current_user.admin
      @ratings = RfpRating.all

      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    else
      @ratings = RfpRating.where(user_id: current_user.id)

      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    end

  end

  def show
    @rfp_rating = RfpRating.find(params[:id])
  end

  def new
    @rating = RfpRating.new
    @loi_id = params[:loi]
    @rfp_id = params[:rfp_id]
  end

  def create
    @rating = RfpRating.new(
      user_id: current_user.id,
      rfp_id: params[:rfp_id],
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q4: params[:q4],
      q5: params[:q5],
      q6: params[:q6],
      q7: params[:q7],
      q8: params[:q8],
      q9: params[:q9],
      q10: params[:q10],
      q11: params[:q11],
      q12: params[:q12],
      q13: params[:q13],
      follow_up: params[:follow_up],
      comments: params[:comments]
      # weighted_score: :q1 + :q2 + :q3 + :q4 + :q5 + :q6 + :q7 + :q9 + :q11
    )
    @rating.update(weighted_score: @rating.weighted_score)
    if @rating.save
      redirect_to '/rfp_ratings'
      flash[:success] = "Rating Submitted!"
    else
      redirect_to :back
      flash[:warning] = "Missing elements in rating!"
    end
  end

  def edit
    @rating = RfpRating.find(params[:id])
    @rfp_id = @rating.rfp_id
  end

  def update
    @rating = RfpRating.find(params[:id])
    @rating.update(
      user_id: current_user.id,
      rfp_id: params[:rfp_id],
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q4: params[:q4],
      q5: params[:q5],
      q6: params[:q6],
      q7: params[:q7],
      q8: params[:q8],
      q8_notes: params[:q8_notes],
      q9: params[:q9],
      q10_notes: params[:q10_notes],
      q10: params[:q10],
      q11: params[:q11],
      q12: params[:q12],
      q13: params[:q13],
      weighted_score: @rating.weighted_score,
      comments: params[:comments]
    )
    if @rating.save
      redirect_to '/rfps'
      flash[:success] = "Rating Updated!"
    else
      redirect_to :back
      flash[:warning] = "Missing elements in rating!"

    end
  end
end
