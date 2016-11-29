class Api::V1::SubAnswersController < ApplicationController
  def destroy
    @sub_answer = SubAnswer.where(rfp_id: params[:rfp_id], sub_question_id: params[:sub_question_id]).last
    @sub_answer.destroy

    render json: { message: "Sub-Answer Destroyed" }
  end
end