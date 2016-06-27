class AttachmentsController < ApplicationController
  def show
    @attachment = Attachment.find_by(id: params[:id])
  end

  def new
  end
end
