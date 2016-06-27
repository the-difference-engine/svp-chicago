class AttachmentsController < ApplicationController
  def show
    @attachment = Attachment.find_by(id: params[:id])
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.create( attachment_params )

    if @attachment.save
      redirect_to '/attachments/new', notice: 'Attachment has been uploaded'
     else
       render action: 'new'
    end
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def attachment_params
    params.require(:attachment).permit(:attachment_file)
  end
end
