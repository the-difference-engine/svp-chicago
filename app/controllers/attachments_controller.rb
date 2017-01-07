class AttachmentsController < ApplicationController

  before_action :authenticate_admin!, only: [:new]

  def index
    @attachments = Attachment.all
  end
  def show
    @attachment = Attachment.find_by(id: params[:id])
  end

  def new
    @rfps = Rfp.all
    @attachment = Attachment.new
  end

  def create

    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:file].original_filename]

    # Upload the file
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    # Create an object for the upload
    @attachment = Attachment.new(
        url: obj.public_url,
        name: obj.key     
        )

    @attachment.rfp_id = params[:rfp_id]
    @attachment.user_id = Rfp.find(@attachment.rfp_id).user_id
    @attachment.doc_type = params[:doc_type]

    # Save the upload
    if @attachment.save
      redirect_to "/attachments/#{@attachment.id}", success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def destroy
    @attachment = Attachment.find_by(id: params[:id])
    rfp_id = @attachment.rfp_id
    @attachment.destroy

    flash[:warning] = "Attachment deleted"
    redirect_to "/rfps/#{rfp_id}"
  end

end
