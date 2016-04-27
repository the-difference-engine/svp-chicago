class QuestionsController < ApplicationController

  def index
    @sections = Section.order(:id).all
    @questions = Question.order(:id).all 
  end

  def new
      @question = Question.new 
  end

  def create
      @question = Question.create({question: params[:question], section_id: params[:section][:section_id]})

      flash[:success] = "Question created!"
      redirect_to "/questions"
  end

  def show
      @question = Question.find_by(id: params[:id])
  end

  def edit
      @question = Question.find_by(id: params[:id])
  end

  def update
      @question = Question.find_by(id: params[:id])

      @question.update({question: params[:question], section_id: params[:section][:section_id]})
      
      flash[:success] = "Question updated!"
      redirect_to "/questions"
  end

  def destroy
      @question = Question.find_by(id: params[:id])
      @question.destroy

      flash[:warning] = "Question deleted"
      redirect_to "/questions"
  end


end
