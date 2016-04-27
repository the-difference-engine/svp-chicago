class Api::V1::SectionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @contact_section = Section.find_by(name: "Contact Information")
    @overview_section = Section.find_by(name: "Overview and Mission")
    @vision_section = Section.find_by(name: "Vision")
    @concern_section = Section.find_by(name: "Key Concerns")
    @challenge_section = Section.find_by(name: "Organizational Capacity Challenges")
    @referral_section = Section.find_by(name: "Referral Source")
    @demographic_section = Section.find_by(name: "Demographics")
    @geographic_section = Section.find_by(name: "Geographic Focus")

    @sections = Section.order(:id).all 

  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.create({name: params[:section]})

    flash[:success] = "Section created!"
    redirect_to "/questions/new"
  end

  def show
    @section = Section.find(params[:id])
    @questions = Question.where(section_id: @section.id) 
  end

end
