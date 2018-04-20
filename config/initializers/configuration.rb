# Be sure to restart your server when you modify this file.

Rails.configuration.app = Rails.application.config_for(:config).with_indifferent_access
CONF = Rails.configuration.app
