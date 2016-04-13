class LandingsController < ApplicationController
  def home
  end

  def thanks
    @loi = Loi.find(params[:id])
  end
end
