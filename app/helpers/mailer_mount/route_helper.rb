module MailerMount
  module RouteHelper
    extend ActiveSupport::Concern

    included do
      delegate :url_helpers, to: 'Rails.application.routes'
    end

    def method_missing(method, *args, &block)
      if url_helpers.respond_to?(method)
        url_helpers.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      url_helpers.respond_to?(method) || super
    end
  end
end
