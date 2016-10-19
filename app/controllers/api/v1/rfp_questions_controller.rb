class Api::V1::RfpQuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @rfp_questions = RfpQuestion.all.order(:id)
    # @sections = Section.all
  end
end