class Api::V1::AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
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
    attachment = Attachment.create(
        url: obj.public_url,
        name: obj.key  
        )

    # Save the upload
    if attachment.save  
      render json: { message: "File Uploaded"}, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

end