class DashboardsController < ApplicationController
  def update
    # Fat Models slim controllers
    @dashboard = Dashboard.find(params[:id])
    date = params[:loi_closing_date] + ' 23:59:59'
    @dashboard.update(loi_closing_date: date)
    if @dashboard.save
        redirect_to "/"
        flash[:success] = "Deadline Updated"
    else
        redirect_to "/"
        flash[:error] = "Error updating the LOI Deadline."
    end
  end
end
