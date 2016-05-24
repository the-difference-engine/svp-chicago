class Api::V1::LoisController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index, :update, :create]

  def index
  	@lois = Loi.where(submitted: true)
  end

  def create
    errors = []

    @loi = Loi.new({name: params[:name], email: params[:email], submitted: params[:submitted], user_id: current_user.id})

    if @loi.save 

      params[:contact_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?

      end

      params[:organization_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:overview_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:vision_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:concern_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:challenge_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: "CHALLENGE")

        Fte.create(answer_id: answer.id, amount_1: answer_hash[:fte_1], amount_2: answer_hash[:fte_2], amount_3: answer_hash[:fte_3])

        answer_hash[:challenges].each do |challenge|
          Challenge.create(answer_id: answer.id, challenge: challenge[:challenge], priority: challenge[:priority])
        end
      end

      params[:referral_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:demographic_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      params[:geographic_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer]) 
        errors << answer.question.question if !answer.valid?
      end

      # Mail.defaults do
      #   delivery_method :smtp, {
      #   :address => 'smtp.gmail.com',
      #   :port => '587',
      #   :user_name => ENV['GMAILUSER'],
      #   :password => ENV['GMAILPASSWORD'],
      #   :authentication => :plain,
      #   :enable_starttls_auto => true
      #   }
      # end

      # Mail.new( :to => @loi.email, :from => 'me@mail.com', :subject => 'boomtown', :body => File.read('app/views/submission_email.html.erb')).deliver!

      if errors.empty?
        render json: { message: "Loi Created", loi_id: @loi.id }, status: 200
      else
        render json: {errors: errors}, status: 422
      end
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end

  end
  
  def show
  	@loi = Loi.find(params[:id])

    @contact_answers = []
    @organization_answers = []
    @overview_answers = []
    @vision_answers = []
    @concern_answers = []
    @challenge_answers = []
    @referral_answers = []
    @demographic_answers = []
    @geographic_answers = []


    @loi.answers.each do |answer|
      if answer.question.section.name == "Contact Information"
        @contact_answers << answer
      elsif answer.question.section.name == "Organization"
        @organization_answers << answer
      elsif answer.question.section.name == "Overview and Mission"
        @overview_answers << answer
      elsif answer.question.section.name == "Vision"
        @vision_answers << answer
      elsif answer.question.section.name == "Key Concerns"
        @concern_answers << answer
      elsif answer.question.section.name == "Organizational Capacity Challenges"
        @challenge_answers << answer
      elsif answer.question.section.name == "Referral Source"
        @referral_answers << answer
      elsif answer.question.section.name == "Demographics"
        @demographic_answers << answer
      elsif answer.question.section.name == "Geographic Focus"
        @geographic_answers << answer
      end
    end

  end

  def update
    @loi = Loi.find(params[:id])

    if @loi.update(name: params[:name], email: params[:email], submitted: params[:submitted])

      params[:contact_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:organization_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:overview_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:vision_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:concern_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:challenge_answers].each do |answer_hash|

        answer = Answer.find(answer_hash[:id])

        answer.fte.update(amount_1: answer_hash[:fte_1], amount_2: answer_hash[:fte_2], amount_3: answer_hash[:fte_3])

        answer_hash[:challenges].each do |challenge|
          new_challenge = Challenge.find(challenge[:id])
          new_challenge.update(challenge: challenge[:challenge], priority: challenge[:priority]) 
        end
      end

      params[:referral_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer]) 
      end

      params[:demographic_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])  
      end

      params[:geographic_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])  
      end

      # Mail.defaults do
      #   delivery_method :smtp, {
      #   :address => 'smtp.gmail.com',
      #   :port => '587',
      #   :user_name => ENV['GMAILUSER'],
      #   :password => ENV['GMAILPASSWORD'],
      #   :authentication => :plain,
      #   :enable_starttls_auto => true
      #   }
      # end
      
      # if @loi.submitted
      #   Mail.new( :to => @loi.email, :from => 'me@mail.com', :subject => 'boomtown', :body => File.read('app/views/submission_email.html.erb')).deliver!
      # end

      render json: { message: "Loi Updated", loi_id: @loi.id }, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
   
  end
end
