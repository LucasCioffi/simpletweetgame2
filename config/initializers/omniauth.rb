OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['STG_TWITTER_CONSUMER_KEY'], ENV['STG_TWITTER_CONSUMER_SECRET']
end
