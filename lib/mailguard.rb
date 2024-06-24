require "mailguard/version"
require "mailguard/engine"
require "mailguard/configuration"

module Mailguard
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
