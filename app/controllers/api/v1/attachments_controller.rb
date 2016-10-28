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
    p params[:current_user]

    # Create an object for the upload
    attachment = Attachment.create(
        url: obj.public_url,
        name: obj.key,
        user_id: params[:current_user],
        doc_type: params[:doc_type]
        )


    # Save the upload
    if attachment.save  
      # attachment.update(user_id: params[:current_user])
      render json: { message: "File Uploaded"}, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

end