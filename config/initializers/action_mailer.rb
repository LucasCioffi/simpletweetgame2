
Rails.application.config.action_mailer.default_url_options = {
    host: ENV.fetch('STG_ACTION_MAILER_URL_HOST', 'localhost'),
    port: ENV.fetch('STG_ACTION_MAILER_URL_PORT', 3000)
}

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
    user_name: ENV.fetch('STG_SMTP_USERNAME', nil),
    password: ENV.fetch('STG_SMTP_PASSWORD', nil),
    domain: ENV.fetch('STG_SMTP_HELO_DOMAIN', 'localhost'),
    address: ENV.fetch('STG_SMTP_ADDRESS', nil),
    port: ENV.fetch('STG_SMTP_PORT', 587),
    authentication: :plain, #TODO: update to not be cleartext
    enable_starttls_auto: true
}
