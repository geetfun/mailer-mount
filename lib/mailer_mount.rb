# lib/mailer_mount.rb
require "mailer_mount/version"
require "mailer_mount/engine"
require "mailer_mount/configuration"
require "mailer_mount/owner"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/generators")
loader.setup

module MailerMount
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      railtie_name :mailer_mount

      generators do
        load "generators/mailer_mount/install/install_generator.rb"
      end
    end
  end
end
