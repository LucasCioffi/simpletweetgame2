require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stg
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded

    config.action_mailer.default_url_options = {
        host: ENV.fetch('STG_ACTION_MAILER_URL_HOST', 'localhost'),
        port: ENV.fetch('STG_ACTION_MAILER_URL_PORT', 3000)
    }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        user_name: ENV.fetch('STG_SMTP_USERNAME', nil),
        password: ENV.fetch('STG_SMTP_PASSWORD', nil),
        domain: ENV.fetch('STG_SMTP_HELO_DOMAIN', 'localhost'),
        address: ENV.fetch('STG_SMTP_ADDRESS', nil),
        port: ENV.fetch('STG_SMTP_PORT', 587),
        authentication: :plain, #TODO: update to not be cleartext
        enable_starttls_auto: true
    }

    # config.devise_secret_key = ENV.fetch('RAILS42_DEVISE_SECRET_KEY', '7f007af08e2a2831cd848659c849cdea68b3f92eebe391d3e41bc94f24e1d145e1de9ef5cbfd586a7726bd8f070b438c6d40550887982f6c2931d50f792c7771')
    # config.devise_mailer_sender = ENV.fetch('RAILS42_DEVISE_MAILER_SENDER', 'registration@appistack.com')
    # config.client_app_url = ENV.fetch('RAILS42_CLIENT_APP_URL', 'http://localhost:8000/')
  end
end
