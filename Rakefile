# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task "tweetstream:start" => :environment do
  tweetclient = TweetStream::Client.new
  puts "Tweetstream: starting"

  tweetclient.userstream do |status|
    puts '@' + status.user.screen_name + ': ' + status.text
    Resque.enqueue(ProcessTweet, status)
  end
end

require 'rake/testtask'

# unit tests
Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

task :default => :spec