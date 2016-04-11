class LoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]

  def index
    @lois = Loi.all
  end

  def new
    @loi  = Loi.new
    @questions = Question.all
  end

  def create
    @loi = Loi.create({name: params[:name], email: params[:email]})

    Question.all.count.times do |i|
      Answer.create({loi_id: @loi.id, question_id: params[:"q#{i}"], answer: params[:"a#{i}"]})
    end

    flash[:success] = "LOI Created"
    redirect_to "/lois/#{@loi.id}"
  end

  def show
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
