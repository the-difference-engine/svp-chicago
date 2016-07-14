# for aws version 2:
# Aws.config.update({
#   region: 'us-east-1',
#   credentials: Aws::Credentials.new(ENV.fetch('AWS_ACCESS_KEY_ID'), ENV.fetch('AWS_SECRET_ACCESS_KEY'))
# })

# for version 1:
  AWS.config({
    region: 'us-east-1',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] 
  })

  S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET_NAME']]

