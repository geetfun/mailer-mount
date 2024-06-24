require "mailer_mount/version"
require "mailer_mount/engine"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/generators")
loader.setup

module MailerMount
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
