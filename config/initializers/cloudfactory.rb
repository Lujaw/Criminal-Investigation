# CloudFactory Initializer
require 'cf'
CF.configure do |config|
  config.api_key = ENV["CF_API_KEY"] ||"bba24e4bdbddd98ddb8f49319508521ee63fef09"
  config.account_name = ENV["CF_ACCOUNT_NAME"] || "lujaw"
  config.api_version = "v1"
  config.api_url = "http://sandbox.cloudfactory.com/api/"
end

