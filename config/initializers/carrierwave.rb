# config/initializers/carrierwave.rb

#CarrierWave.configure do |config|
#  config.fog_credentials = {
#    :provider               => 'AWS',                        # required
#    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
#    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]                         # required
#  }
#  config.fog_directory  = ENV["AWS_BUCKET"]                     # required
#end

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public-read"

if Rails.env.development?
  config.cache_dir = '/home/vagrant/uploads_tmp/tmp/uploads'
  config.root = '/home/vagrant/uploads_tmp/tmp'
end

  config.aws_credentials = {
      access_key_id:     ENV["AWS_ACCESS_KEY"],
      secret_access_key: ENV["AWS_SECRET_KEY"],
      region:            ENV["AWS_REGION"]
  }


 #   config.cache_dir = "#{Rails.root}/tmp/uploads"


end