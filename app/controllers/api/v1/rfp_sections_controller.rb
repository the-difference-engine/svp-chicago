class Api::V1::RfpSectionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index, :update, :create]

  def index
    @rfp_sections = RfpSection.order(:id).all
    

  end

  def create
   #NOTE: IF USER WANTS TO SAVE - THEN SKIP ERROR CHECK?
   errors = []
   params["rfp_sections"].each do |section|
     section["questions"].each do |question|
       if !question["answer"] || question["answer"] == ""
         errors << question["question"]
       end
     end
   end
   # if errors.empty?
     @rfp = Rfp.new(user_id: current_user.id, attachment_url: attachment_url)
     @rfp.save
     params[:rfp_sections].each do |section|
       section["questions"].each do |question|
         case question["question_type"]
         when "single input"
           if question["answer"]
             RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: question["answer"])
           end
          when "multiple input"
           if question["answers"] != [{}]
             question["answers"].each do |answer|
               RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: answer["answer"])
             end
           end
         when "block"
           if question["sub_questions"]
             question["sub_questions"].each do |sub_question|
               if sub_question["answer"]
                 RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: sub_question["id"], answer: sub_question["answer"])
               end
             end
           end
         when "block with multiple inputs"
           question["sub_questions"].each do |sub_question|
             if sub_question["answers"] != [{}]
               sub_question["answers"].each do |answer|
                 RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: sub_question["id"], answer: sub_question["answer"])
               end
             end
   @rfp = Rfp.new(user_id: current_user.id)
   @rfp.save
   params[:rfp_sections].each do |section|
     section["questions"].each do |question|
       case question["question_type"]
       when "single input"
         if question["answer"]
           RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: question["answer"])
         end
       when "multiple input"
         if question["answers"] != [{}]
           question["answers"].each do |answer|
             RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: answer["answer"])
           end
         end
       when "block"
        @rfp_answer = RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: "See Subs")
        if question["sub_questions"]
         question["sub_questions"].each do |sub_question|
           if sub_question["answer"]
            SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["id"], answer: sub_question["answer"], user_id: current_user.id)
          end
        end
      end
    when "block with multiple inputs"
      @rfp_answer = RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: "See Subs")
      question["sub_questions"].each do |sub_question|
       if sub_question["answers"] != [{}]
         sub_question["answers"].each do |answer|
          SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["id"], answer: answer["answer"], user_id: current_user.id)
        end
      end
    end
  end    
end
end
render json: { message: "RFP Created"}, status: 200
   # else
   #   render json: errors.to_json, status: 400 
   # end
 end

 def show
  @section = Section.find(params[:id])
  @questions = Question.where(section_id: @section.id) 
end

end