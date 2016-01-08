require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Access
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.i18n.fallbacks = true
    config.i18n.available_locales = config_for(:access)['available_locales'].map { |locale| locale.to_sym }
    # [:en, :el] # this should be configured by ansible
    config.i18n.default_locale = config_for(:access)['available_locales'][0].to_sym

    # Look for nested dictionaries for translation
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # How many snapshots PaperTrails to retain
    PaperTrail.config.version_limit = config_for(:access)['snapshot_limit']

    config.active_job.queue_adapter = :sidekiq

    # Enforce SSL in production
    config.force_ssl = true if Rails.env == 'production'
  end
end
