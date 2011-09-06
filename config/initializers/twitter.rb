twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]

Twitter.configure do |config|
  config.consumer_key = twitter_config['consumer_key']
  config.consumer_secret = twitter_config['consumer_secret']
  config.oauth_token = twitter_config['oauth_token']
  config.oauth_token_secret = twitter_config['oauth_token_secret']
end
#  config.oauth_token = "6HQpyQ4cdCc5Fs8ew7aIcA"
#  config.oauth_token_secret = "llv01PKP3OuBOF5Usb5FSey099q6zMepGtSzIiGhw"
#end