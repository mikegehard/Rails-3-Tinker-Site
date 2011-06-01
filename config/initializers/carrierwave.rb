require 'carrierwave/orm/activerecord'

unless Kernel.const_defined?("FOG_CONFIG")
  FOG_CONFIG = YAML.load_file("#{Rails.root}/config/fog_credentials.yml")["default"]
end

# Might be interesting to figure out if you could just set a credentials_path
# and pass that through to fog so you didn't need to pull out the info
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => FOG_CONFIG['aws_access_key_id'],
      :aws_secret_access_key => FOG_CONFIG['aws_secret_access_key'],
      :region => FOG_CONFIG['region']
  }
  config.fog_directory = "mikeg-bucket-test" # required
end