class Api::V1::AnswersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @answers = Answer.all
  end

  def create
    @answer = Answer.new(question_id: params[:question_id], answer: params[:answer])

    if @answer.save
      render json: { message: "Answer Created" }, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.update(question_id: params[:question_id], answer: params[:answer])

    render :show    
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    render json: { message: "Answer Destroyed" }
  end
  

end
