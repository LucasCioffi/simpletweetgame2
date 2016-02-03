require 'mono_logger'

# TODO: remove references to Rails.root and Rails.env,
# - so this file can boot resque outside of rails (when resque-web is booted within sinatra)

$redis = if ENV["STG_REDISCLOUD_URL"]
           Redis.new(:url => ENV["STG_REDISCLOUD_URL"])
         else
           resque_config = YAML.load(File.join(Rails.root, '/config/redis.yml'))
           resque_config[Rails.env]
         end

Dir["app/jobs/*.rb"].each { |file| require File.join(Rails.root, file) }
Resque.redis = $redis
Resque.logger = MonoLogger.new(File.open("#{Rails.root}/log/resque.log", "w+"))
