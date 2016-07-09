class Api::V1::RfpSectionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index, :update, :create]

  def index
    @rfp_sections = RfpSection.order(:id).all
    

  end

  def create
    #NOTE: IF USER WANTS TO SAVE - THEN SKIP ERROR CHECK?
    errors = []
    params["rfp_sections"].each do |section|
      section["questions"].each do |question|
        if !question["answer"] || question["answer"] == ""
          errors << question["question"]
        end
      end
    end
    if errors.empty?
      @rfp = Rfp.new(user_id: current_user.id)
      @rfp.save
      params[:rfp_sections].each do |section|
        section["questions"].each do |question|
          if question["answer"]
            answer = RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: question["answer"])
          end
        end
      end
      render json: { message: "RFP Created"}, status: 200
    else
      render json: errors.to_json, status: 400 
    end
  end

  def show
    @section = Section.find(params[:id])
    @questions = Question.where(section_id: @section.id) 
  end

end