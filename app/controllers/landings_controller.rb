class LandingsController < ApplicationController
  def home
    @landing = Landing.find_by(id: 1)
  end

  def edit
    @landing = Landing.find_by(id: 1)
  end

  def update
    @landing = Landing.find_by(id: 1)
    @landing.update(
      year: params[:year],
      sector_focus: params[:sector_focus],
      main_points: params[:main_points],
      gray_section: params[:gray_section],
      last_point: params[:last_point]
      )
    redirect_to '/home'
  end

  def thanks
    @loi = Loi.find(params[:id]) 
  end
end
