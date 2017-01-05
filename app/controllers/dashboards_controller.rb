class DashboardsController < ApplicationController
  def update
    # Fat Models slim controllers
    @dashboard = Dashboard.find(params[:id])

    @dashboard.update(deadline_open?: params[:deadline_open])
    @dashboard.save

    redirect_to "/"
  end
end
