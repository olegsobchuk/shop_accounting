Rails.application.configure do
  config.active_record.belongs_to_required_by_default = false
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  #   address: 'smtp.sendgrid.net',
  #   port: 587,
  #   authentication: :plain,
  #   enable_starttls_auto: true,
  #   user_name: SECRETS[:sendgrid_username],
  #   password: SECRETS[:sendgrid_password]
  # }

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
