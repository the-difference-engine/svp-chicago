class Api::V1::RfpRatingsController < ApplicationController
  before_action :authenticate_admin!

  def index

    if user_signed_in? && current_user.admin
      @ratings = RfpRating.all
    else
      @ratings = RfpRating.where(user_id: current_user.id)
    end

  end

end
