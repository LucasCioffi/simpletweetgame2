## Simple Twitter Game

### Getting Started

The project is configured so that developers can start all services with
one command:

```shell
foreman start -f Procfile.dev -e .env.dev
```

You can find example configurations in `Procfile.dev.example` and `.env.dev.example`

#### Service Dependencies

STG requires `postgresql` and `redis-server`.  Use your package manager to get
these installed.  Unless you want these services always on, then configure
a line in the `Procfile.dev` to start the service on `foreman start`.

#### Configuring Environment

There are several versions of the `Procfile` and `.env` files that can
be used to start the project.  Heroku requires `Procfile` to list
services.  `Procfile.dev` and `.env.dev` are both ignored from the
project, so it's safe to place tokens here for your development environment.

#### Database Setup

Ensure `STG_DATABASE_USERNAME` and `STG_DATABASE_PASSWORD` are configured in
`.env.dev` and postgres is running.  Create a new role in postgres, if necessary.
Then, run the following:

```shell
rake db:create
rake db:migrate
rake db:seed
```

#### Running Rails

Run the web server under puma with `bundle exec puma -C config/puma.rb`. There
seemed to be some problems running with `rails s`, where the server blew
up because of a race condition with `LoggerSilence`

#### Tweetstream Service

This service establishes a HTTP2 streaming connection with the Twitter API.
When it receives new tweets, it creates the appropriate jobs in Resque.  This
service is based on EventMachine, but the code is included with the Rails project.

To run the Tweetstream service with foreman, add the following line to `Procfile.dev`

```
tweetstream_server: bundle exec rake tweetstream:start
```

You'll need to ensure the `STG_TWITTER_*` environment variables are set in `.env.dev`.

#### Configuring Heroku

All `STG_*` environment variables need to be set in Heroku via `heroku config:set`

`resque-pool` allows you to more dynamically control resque worker processes on heroku
similar to how unicorn manages web servers

Run `heroku config:set TERM_CHILD=1 WORKER_CONCURRENCY=5` to set up the right signal handling and configure the
default number of workers.

### Misc

You can create new `ProcessTweet` jobs without sending a tweet by enqueuing the jobs
via the rails console:

```ruby
Resque.enqueue(ProcessTweet, {user: {screen_name: 'simpletest10'}, text: "go left @simpleTwitterGame"})
```



### Resources

http://blog.bigbinary.com/2015/07/19/using-reactjs-with-rails-actioncable.html
https://github.com/websocket-rails/websocket-rails/wiki/Multiple-Servers-and-Background-Jobs
