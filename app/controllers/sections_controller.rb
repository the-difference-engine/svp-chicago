class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @section = Section.create({name: params[:section]})

    flash[:success] = "Section created!"
    redirect_to "/questions/new"
  end

  def show
    @section = Section.find(params[:id])
    @questions = Question.where(section_id: @section.id) 
  end

end
