class AttachmentsController < ApplicationController
  def show
    @attachment = Attachment.find_by(id: params[:id])
  end

  def new
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
        url: obj.public_url     
        )

    # Save the upload
    if @attachment.save
      redirect_to "/attachments/#{@attachment.id}", success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

end
