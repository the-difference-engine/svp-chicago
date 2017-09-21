class Api::V1::RfpSectionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index, :update, :create]
  before_action :authenticate_user!, only: [:new, :show]

  def index
    @rfp_sections = RfpSection.order(:id).all
    @loi = Loi.find_by(user_id:current_user.id, submitted: true)
    # loi.answers.find_by(question_id: Question.find_by(question: "Organization").id)
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
    @rfp = Rfp.new(user_id: current_user.id, submitted: params[:submitted])
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
          else
            question["answers"].each do |answer|
              RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: "")
            end
          end
          when "block"
          @rfp_answer = RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["id"], answer: "See Subs")
          if question["sub_questions"]
            question["sub_questions"].each do |sub_question|
              if sub_question["answer"]
                SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["id"], answer: sub_question["answer"], user_id: current_user.id)
              else
                SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["id"], answer: "", user_id: current_user.id)
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
            else
              sub_question["answers"].each do |answer|
                SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["id"], answer: "", user_id: current_user.id)
              end
            end
          end
        end
      end
    end
    # This is to ensure two forms created by the same user are not assigned the same rfp_id:
    # Only the most recent attachments (within the last minute) are updated.
    @attachments = Attachment.where(user_id: current_user.id).where("created_at > ?", Time.now - 1800)
    @attachments.each do |attachment|
      attachment.update(rfp_id: @rfp.id)
    end

    if @rfp.submitted

      UserNotifier.send_rfp_notification(current_user).deliver

      User.where(super_admin: true).each do |admin|
        UserNotifier.send_rfp_notification_admin(admin).deliver
      end

    end

    render json: { message: "RFP Created"}, status: 200
    p @rfp
    # else
    #   render json: errors.to_json, status: 400
    # end
  end

  def show
    @section = Section.find(params[:id])
    @questions = Question.where(section_id: @section.id)
  end

  #WILL REFACTOR
  def update
    #NOTE: IF USER WANTS TO SAVE - THEN SKIP ERROR CHECK?
    # errors = []
    # params["rfp_sections"].each do |section|
    #   section["questions"].each do |question|
    #     if !question["answer"] || question["answer"] == ""
    #       errors << question["question"]
    #     end
    #   end
    # end
    # if errors.empty?

    @rfp = Rfp.find_by(id: params[:id])


    @rfp.update(submitted: params[:submitted])
    # @rfp.save

    #Begin loop through rfp_sections
    params[:rfp_sections].each do |section|
      #Begin loop through rfp_questions  in rfp_sections
      section["rfp_questions"].each do |question|

        case question["question_type"]

          when "single input"

            if RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"])

              RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"]).update(answer: question["rfp_answer"])

            else
              if question["rfp_answer"]
                RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["question_id"], answer: question["rfp_answer"])
              end
            end

          when "multiple input"

            if RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"])

              previous_answers = RfpAnswer.where(rfp_id: @rfp.id, rfp_question_id: question["question_id"])

              previous_answers_length = previous_answers.length
              new_answers_length = question["rfp_answers"].length

              previous_answers.each_with_index do |answer, index|
                answer.update(answer: question["rfp_answers"][index]["rfp_answer"])
              end

              count = previous_answers_length
              (new_answers_length - previous_answers_length).times do 
                RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["question_id"], answer: question["rfp_answers"][count]["rfp_answer"])
                count = count + 1
              end

            else

              #Need to CONFIRM 
              if question["rfp_answers"] != nil && question["rfp_answers"] != [{}]
                question["rfp_answers"].each do |answer|
                  RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["question_id"], answer: answer["rfp_answer"])
                end
              end

            end

          when "block"

            if RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"])

              # sub_answers = SubAnswer.where(rfp_id: @rfp.id, rfp_answer_id: RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"]).id)

              

              # sub_answers.each do |sub_answer|
              #   p sub_answer
              #   # sub_answer.update(answer: sub_question["sub_answer"])

              # end

              question["sub_questions"].each do |sub_question|
                sub_answer = SubAnswer.find_by(sub_question_id: sub_question['sub_question_id'], rfp_id: @rfp.id)

                sub_answer.update(answer: sub_question["sub_answer"])

                p sub_question["sub_answer"]
              end

            else

              #May not need if new page saves empty input fields as empty string
              @rfp_answer = RfpAnswer.create(rfp_id: @rfp.id, rfp_question_id: question["question_id"], answer: "See Subs")
              if question["sub_questions"]
                question["sub_questions"].each do |sub_question|
                  if sub_question["sub_answer"]
                    SubAnswer.create(rfp_answer_id: @rfp_answer.id, rfp_id: @rfp.id, sub_question_id: sub_question["question_id"], answer: sub_question["sub_answer"], user_id: current_user.id)
                  end
                end
              end

            end

          when "block with multiple inputs"

            if RfpAnswer.find_by(rfp_id: @rfp.id, rfp_question_id: question["question_id"])

              question["sub_questions"].each do |sub_question|

                sub_question['sub_answers'].each do |sub_answer|

                  if sub_answer['sub_answer_id']
                    sub_answer_update = SubAnswer.find_by(id: sub_answer['sub_answer_id'], rfp_id: @rfp.id)

                    sub_answer_update.update(answer: sub_answer['sub_answer'])
                  else
                    SubAnswer.create(answer: sub_answer['sub_answer'], rfp_id: @rfp.id, user_id: current_user.id, sub_question_id: sub_question['sub_question_id'], rfp_answer_id: RfpAnswer.find_by(rfp_question_id: question['question_id'], rfp_id: @rfp.id).id)
                  end
                end
              end
            end
        end
      end
    end

    @newattachments = Attachment.where(user_id: current_user.id).where("created_at > ?", Time.now - 1800)
    
    if @newattachments.length != 7
      @newattachments.each do |attachment|
        attachment.update(rfp_id: @rfp.id)
      end
    end

    if @rfp.submitted

      UserNotifier.send_rfp_notification(current_user).deliver

      User.where(super_admin: true).each do |admin|
        UserNotifier.send_rfp_notification_admin(admin).deliver
      end

    end

    render json: { message: "RFP Created" }, status: 200
    p @rfp
    # else
    #   render json: errors.to_json, status: 400
    # end


  end

end