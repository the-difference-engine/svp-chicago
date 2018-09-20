class Api::V1::QuestionsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]

	def index
		@questions = Question.includes(:section).where(is_active: true).order(:id)
		@sections = Section.all
	end

	def show
		@question = Question.find(params[:id])
	end
end