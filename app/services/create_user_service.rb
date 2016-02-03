class CreateUserService
  attr_accessor :tweet

  def initialize(tweet)
    @tweet = tweet
  end

  def execute
    tweet_user = tweet['user']
    twitter_name = tweet_user['name']
    twitter_user_id = tweet_user['screen_name']

    User.create!(username: twitter_name,
                 twitter_user_id: twitter_user_id,
                 profile_photo_url: tweet_user['profile_image_url'])
  end

end
