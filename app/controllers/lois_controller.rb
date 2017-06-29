class LoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :edit, :show, :new]
  before_action :authenticate_admin!, only: [:index, :destroy]

  def index
    if params[:alert]
      flash.now[:success] = params[:alert]
    end
    @lois = Loi.where(submitted: true).where(reject: [false, nil])
    @admins_ratings = Rating.where(user_id: current_user.id)
    gon.current_user_id = current_user.id

    respond_to do |format|
      format.html
      format.csv { send_data @lois.to_csv, filename: "lois-#{Date.today}.csv" }
      format.pdf do
        pdf = Prawn::Document.new
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end

  end

  def new
    @dashboard = Dashboard.first
    if @dashboard.loi_closing_date < Time.now
      date = @dashboard.loi_closing_date.strftime('%m-%e-%y, %H:%M')
      flash[:warning] = "The deadline to Submit a Letter of Interest was #{date}"
      redirect_to '/'
    end
  end

  def create

  end

  def show
    # @sections = Section.order(:id).all
    @ratings = Rating.where(user_id: current_user.id).where(q5: "Yes")
    @invite_max = InviteMax.first.max
    @loi = Loi.find_by(id: params[:id])
    if @loi.user_id == current_user.id || current_user.admin
      gon.loi_id = @loi.id
      if current_user.ratings.find_by(loi_id: @loi.id) == nil
        @rating = Rating.new
      else
        @rating = Rating.find_by(loi_id: params[:id])
      end
    else
      flash[:warning] = "Restricted Access"
      redirect_to "/"
    end
  end

  def edit
    # @dashboard = Dashboard.find(params[:id])
    # # bolean something like deadline_passed? = true/false
    # if !@dashboard.deadline_open?
    #   flash[:warning] = "Deadline has passed"
    #   redirect_to '/'
    # end
    @loi = Loi.find_by(id: params[:id])
    if @loi.submitted && current_user.super_admin
      gon.loi_id = @loi.id
      @sections = Section.all
      @questions = Question.all
      @answers = Answer.where(loi_id: @loi.id)
      flash.now[:danger] = "Warning, this form has already been submitted."
    elsif @loi.submitted
      flash[:warning] = "Submitted Applications can not be altered."
      redirect_to '/'
    else
      gon.loi_id = @loi.id
      @sections = Section.all
      @questions = Question.all
      @answers = Answer.where(loi_id: @loi.id)
    end
  end

  def update
    @loi = Loi.find_by(id: params[:id])

    p "*********************"
    if params[:reject]
      p '666666666'
      @loi.reject = true
      @loi.save
      render json: @loi
    else

      @loi.update({name: params[:name], email: params[:email]})

      flash[:success] = "LOI Updated"
      redirect_to "/lois/#{@loi.id}"
    end
  end

  def destroy
    @loi = Loi.find(params[:id])
    @loi.destroy

    flash[:warning] = "LOI Destroyed"
    redirect_to :action => :index, status: 303
  end
end
