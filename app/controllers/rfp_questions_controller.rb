class RfpQuestionsController < ApplicationController
  before_action :authenticate_super_admin!

  def index
    @rfp_sections = RfpSection.order(:id).all
    @rfp_questions = RfpQuestion.order(:id).all
  end

  def new
    @rfp_question = RfpQuestion.new
    @sub_question = SubQuestion.new
  end

  def create
    ActiveRecord::Base.transaction do
      @rfp_question = RfpQuestion.new({question: params[:question], rfp_section_id: params[:rfp_section][:rfp_section_id], question_type: params[:question_type]})
      if @rfp_question.save!

        if params[:question_type] == "block" || params[:question_type] == "block with multiple inputs"
          params[:sub_question].each do |key, question|
            SubQuestion.create!(question: question, rfp_question_id: @rfp_question.id)
          end
        end
      end
      flash[:success] = "Question created!"
      redirect_to "/rfp_questions"
    end
  rescue ActiveRecord::RecordInvalid => exception
    flash[:warning] = exception.message
    @sub_question = SubQuestion.new
    render :new
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
