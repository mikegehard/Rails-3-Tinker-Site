require 'carrierwave/orm/activerecord'

# The Carrierwave docs show this way to set up Fog but see
# below for a more concise way.

#unless Kernel.const_defined?("FOG_CONFIG")
#  FOG_CONFIG = YAML.load_file("#{Rails.root}/config/fog_credentials.yml")["default"]
#end
#
#CarrierWave.configure do |config|
#  config.fog_credentials = {
#      :provider => 'AWS',
#      :aws_access_key_id => FOG_CONFIG['aws_access_key_id'],
#      :aws_secret_access_key => FOG_CONFIG['aws_secret_access_key'],
#      :region => FOG_CONFIG['region']
#  }
#  config.fog_directory = "mikeg-bucket-test" # required
#end

#A cleaner way to set up carrierwave/fog would be to do this:.
# By default Fog will use the default credentials
# You can use Fog.credential = 'foo' to use a different set.
Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS'
  }
  config.fog_directory = "mikeg-bucket-test" # required
end