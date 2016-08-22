class RfpSectionsController < ApplicationController
  def new
  end

  def create
    @rfp_section = RfpSection.create(name: params[:name])

    flash[:success] = "Section created!"
    redirect_to "/rfp_questions"
  end

  def edit
    @rfp_section = RfpSection.find(params[:id])
  end

  def update
    rfp_section = RfpSection.find(params[:id])
    rfp_section.update(name: params[:section_name])

    flash[:success] = "Section updated!"
    redirect_to "/rfp_questions"
  end

  def destroy
    rfp_section = RfpSection.find(params[:id])
    rfp_section.destroy

    flash[:success] = "Section deleted!"
    redirect_to "/rfp_questions"
  end
end
