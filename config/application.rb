# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'action_controller/railtie'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
# require 'action_mailer/railtie'
# require 'action_mailbox/engine'
# require 'action_text/engine'
# require 'action_cable/engine'
# require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module SlimlineRails
  class Application < Rails::Application
    config.load_defaults 6.0
  end
end
