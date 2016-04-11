class LoisController < ApplicationController
  def index
    @lois = Loi.all
  end

  def new
    @loi  = Loi.new
  end

  def create
    @loi = Loi.create({name: params[:name], email: params[:email]})

    flash[:success] = "LOI Updated"
    redirect_to "/lois/#{@loi.id}"
  end

  def show
    @loi = Loi.find_by(id: params[:id])
  end

  def edit
    @loi = Loi.find_by(id: params[:id])
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
