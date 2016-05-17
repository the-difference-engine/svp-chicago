 class LoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show]

  def index
    @lois = Loi.all
    gon.current_user_id = current_user.id

    respond_to do |format|
      format.html
      format.csv { send_data @lois.to_csv, filename: "lois-#{Date.today}.csv" }
    end
    
  end

  def new
    # @loi  = Loi.new
    # @questions = Question.order(:id).all 
    # @sections = Section.order(:id).all 
  end

  def create
    # @loi = Loi.new({name: params[:name], email: params[:email]})

    # if answers_valid?
    #   if @loi.save

    #     params[:answers].each do |key, value|

    #       answer = Answer.create({loi_id: @loi.id, question_id: key, answer: value})

    #       if value.include?("challenges")
    #         i = 0
    #         (value["challenges"].length / 2).times do
    #           Challenge.create({answer_id: answer.id, challenge: value["challenges"][i], priority: value["challenges"][i+(value["challenges"].length / 2)]})
    #           i += 1
    #         end
    #       end

    #       if value.include?("ftes")
    #         Fte.create({answer_id: answer.id, amount_1: value["ftes"][0], amount_2: value["ftes"][1], amount_3: value["ftes"][2]})
    #       end
    #     end

    #     # NotifierMailer.welcome_email(@loi).deliver_now
    #     flash[:success] = "LOI Created"
    #     redirect_to "/lois/#{@loi.id}"
    #   else
    #     flash[:error] = @loi.errors.full_messages
    #     render :new
    #   end
    # else
    #   #errors presented here
    #   render :new
    # end
  end

  # def answers_valid?
  #   params[:answers].select{|key, value| value.empty?}.empty?
  # end

  def show
    # @sections = Section.order(:id).all
    @loi = Loi.find_by(id: params[:id])
    gon.loi_id = @loi.id
  end

  def edit
    @loi = Loi.find_by(id: params[:id])
    @sections = Section.all
    @questions = Question.all
    @answers = Answer.where(loi_id: @loi.id)
  end

  def update
    @loi = Loi.find_by(id: params[:id])

    @loi.update({name: params[:name], email: params[:email]})

    flash[:success] = "LOI Updated"
    redirect_to "/lois/#{@loi.id}"
  end

  def destroy
    @loi = Loi.find(params[:id])
    @loi.destroy

    flash[:warning] = "LOI Destroyed"
    redirect_to :action => :index, status: 303
  end
end
