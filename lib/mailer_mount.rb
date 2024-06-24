require "mailer_mount/version"
require "mailer_mount/engine"
require "mailer_mount/configuration"

module MailerMount
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
