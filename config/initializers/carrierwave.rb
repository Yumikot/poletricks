require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
  # config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'poletricks'
  #config.asset_host = 'https://poletricks.s3.amazonaws.com'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], 
    region: 'ap-northeast-1',
    path_style: true
  }


  # if Rails.env.production?
  #   config.storage :fog
  #   config.fog_provider = 'fog/aws'
  #   config.fog_directory  = 'poletricks'
  #   config.fog_credentials = {
  #     provider: 'AWS',
  #     aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  #     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  #     region: 'ap-northeaset-1',
  #     path_style: true
  #   }
  # else
  #   config.storage :file
  #   config.enable_processing = false if Rails.env.test?
  # end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/