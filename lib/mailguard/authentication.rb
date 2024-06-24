module MailerMount
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_user
    end

    def authenticate_user
      if MailerMount.configuration.authentication_method
        instance_exec(&MailerMount.configuration.authentication_method)
      else
        raise NotImplementedError, "You must provide an authentication_method block in the configuration"
      end
    end

    def current_user
      instance_exec(&MailerMount.configuration.current_user_method)
    end
  end
end
