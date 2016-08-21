class Api::V1::RfpsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :authenticate_admin!, only: [:index]
  def index
    @rfps = Rfp.all
  end

  def new
  end

  def show
    @rfp = Rfp.find(params[:id])
    @rfp_sections = RfpSection.order('id ASC').all
    # @rfp_questions = RfpQuestion.where(rfp_section_id: @rfp_section.id)
  end
end

