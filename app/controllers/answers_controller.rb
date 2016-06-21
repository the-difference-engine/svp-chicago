class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def create
    
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.update(loi_id: params[:loi_id], question_id: params[:question_id], answer: params[:answer])

    redirect_to "/lois/#{params[:loi_id]}"   
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    render json: { message: "Answer Destroyed" }
  end
end
