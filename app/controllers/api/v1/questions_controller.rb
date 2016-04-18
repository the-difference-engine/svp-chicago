class Api::V1::QuestionsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]

	def index 
		@questions = Question.all
		@sections = Section.all
	end

	def show
		@question = Question.find(params[:id])
	end
end