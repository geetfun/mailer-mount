# lib/mailer_mount/authentication.rb
module MailerMount
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_owner
    end

    def authenticate_owner
      if cookies[:mailer_mount].present?
        # User is already logged in via cookie
        token = cookies[:mailer_mount]
        magic_token = MailerMount::MagicToken.find_by(token: token)

        @current_owner = magic_token.owner if magic_token
      elsif params[:token].present?
        # Token is present in params, attempt to authenticate using token
        token = params[:token]
        magic_token = MailerMount::MagicToken.find_by(token: token)

        if magic_token
          # Set cookie for logged in user
          cookies[:mailer_mount] = { value: token, expires: 10.minutes.from_now }
          @current_owner = magic_token.owner
        else
          head :unauthorized
        end
      else
        # No mailer_mount cookie and no token in params
        head :unauthorized
      end
    end

    def current_owner
      @current_owner
    end
  end
end
