 class LoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show]
  before_action :authenticate_admin!, only: [:index, :destroy]

  def index
    @lois = Loi.all
    gon.current_user_id = current_user.id

    respond_to do |format|
      format.html
      format.csv { send_data @lois.to_csv, filename: "lois-#{Date.today}.csv" }
    end
    
  end

  def new
    
  end

  def create

  end

  def show
    # @sections = Section.order(:id).all
    @loi = Loi.find_by(id: params[:id])
    gon.loi_id = @loi.id
  end

  def edit
    @loi = Loi.find_by(id: params[:id])
    gon.loi_id = @loi.id
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
