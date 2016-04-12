class LoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show]

  def index
    @lois = Loi.all
  end

  def new
    @loi  = Loi.new
    @questions = Question.order(:id).all 
    @sections = Section.all
  end

  def create
    @loi = Loi.new({name: params[:name], email: params[:email]})

    if answers_valid?
      if @loi.save
        params[:answers].each do |key, value|
          Answer.create({loi_id: @loi.id, question_id: key, answer: value})
        end
        flash[:success] = "LOI Created"
        redirect_to "/thanks/#{@loi.id}"
      else
        flash[:error] = @loi.errors.full_messages
        render :new
      end
    else
      #errors presented here
      render :new
    end
  end

  def answers_valid?
    params[:answers].select{|key, value| value.empty?}.empty?
  end

  def show
    @sections = Section.all
    @loi = Loi.find_by(id: params[:id])
  end

  def edit
    @loi = Loi.find_by(id: params[:id])
    @questions = Question.all
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
