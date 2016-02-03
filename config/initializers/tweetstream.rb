require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = ENV.fetch('STG_TWITTER_CONSUMER_KEY', nil)
  config.consumer_secret    = ENV.fetch('STG_TWITTER_CONSUMER_SECRET', nil)
  config.oauth_token        = ENV.fetch('STG_TWITTER_ACCESS_TOKEN', nil)
  config.oauth_token_secret = ENV.fetch('STG_TWITTER_ACCESS_TOKEN_SECRET', nil)
  config.auth_method        = :oauth
end
