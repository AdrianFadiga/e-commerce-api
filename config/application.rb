require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ECommerceApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Permite a validação da session
    config.middleware.use ActionDispatch::Session::CookieStore

    # As ids das migrations virão como uuid
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # Permite acessos CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head],
                 expose: %w[access-token expiry token-type uid client]
      end
    end
    config.api_only = true
  end
end
