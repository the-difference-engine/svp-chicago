class Api::V1::RfpsController < ApplicationController
  def index
    @rfps = Rfp.all
  end 

  def new
  end 

  def show
    @rfp = Rfp.find(params[:id])
    @rfp_section = RfpSection.find(params[:id])
    @rfp_questions = RfpQuestion.where(rfp_section_id: @rfp_section.id) 
  end 
end

