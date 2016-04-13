class SectionsController < ApplicationController

  def create
    @section = Section.create({name: params[:section]})

    flash[:success] = "Section created!"
    redirect_to "/questions/new"
  end
end
