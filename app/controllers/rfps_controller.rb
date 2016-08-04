class RfpsController < ApplicationController

  def index
    @rfps = Rfp.all
  end 
  
  def new
  end 

  def show
    @rfp = Rfp.find_by(id: params[:id])
  end
end
