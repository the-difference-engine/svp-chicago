class Api::V1::RfpAnswersController < ApplicationController
  def destroy
    @rfp_answer = RfpAnswer.where(rfp_id: params[:rfp_id], rfp_question_id: params[:rfp_question_id]).last
    @rfp_answer.destroy

    render json: { message: "Answer Destroyed" }
  end
end
