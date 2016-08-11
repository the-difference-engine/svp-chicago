class Api::V1::AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end

  def create
    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:file].original_filename]

    # Upload the file
    obj.write(
      file: params[:attachment],
      acl: :public_read
    )

    # Create an object for the upload
    Attachment.create(
        url: 'obj.public_url',
        name: 'obj.key'  
        )

    # # Save the upload
    # if @attachment.save
    #   # happy path
    # else
    #   # sad path
    # end
  end

end