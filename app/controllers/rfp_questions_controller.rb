class RfpQuestionsController < ApplicationController
  def index
    @rfp_sections = RfpSection.order(:id).all
    @rfp_questions = RfpQuestion.order(:id).all 
  end

  def new
    @rfp_question = RfpQuestion.new 
  end

  def create
    @rfp_question = RfpQuestion.new({question: params[:question], rfp_section_id: params[:rfp_section][:rfp_section_id]})
    if @rfp_question.save
      flash[:success] = "Question created!"
      redirect_to "/rfp_questions"
    else 
      flash[:warning] = "Error"
      render :new
    end 
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def edit
    @rfp_question = RfpQuestion.find_by(id: params[:id])
  end

  def update
    @rfp_question = RfpQuestion.find_by(id: params[:id])

    @rfp_question.update({question: params[:question], rfp_section_id: params[:rfp_section][:rfp_section_id]})

    flash[:success] = "Question updated!"
    redirect_to "/rfp_questions"
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy

    flash[:warning] = "Question deleted"
    redirect_to "/questions"
  end

end
