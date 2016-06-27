class AttachmentsController < ApplicationController
  def show
    @attachment = Attachment.find_by(id: params[:id])
  end

  def new
  end

  def create
    @attachment = Attachment.create( attachment_params )
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
