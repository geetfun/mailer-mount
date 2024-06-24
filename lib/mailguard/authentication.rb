module Mailguard
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_user
    end

    def authenticate_user
      if Mailguard.configuration.authentication_method
        instance_exec(&Mailguard.configuration.authentication_method)
      else
        raise NotImplementedError, "You must provide an authentication_method block in the configuration"
      end
    end

    def current_user
      instance_exec(&Mailguard.configuration.current_user_method)
    end
  end
end
