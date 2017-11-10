CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_APP_KEY'],                        # required
    aws_secret_access_key: ENV['AWS_APP_SECRET'],                        # required
    region:                'ap-southeast-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'bloodstream-next'                          # required
end