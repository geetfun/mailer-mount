module MailerMount
  module Owner
    extend ActiveSupport::Concern

    included do
      has_one(
        :mailer_mount_magic_token,
        dependent: :destroy,
        class_name: 'MailerMount::MagicToken',
        as: :owner
      )
      has_many(
        :mailer_mount_email_preferences,
        dependent: :destroy,
        class_name: 'MailerMount::EmailPreference',
        as: :owner
      )
    end

    def mailer_mount_url
      begin
        Rails.application.routes.url_helpers.mailer_mount_url(token: get_or_create_mailer_mount_token)
      rescue ArgumentError
        Rails.application.routes.url_helpers.mailer_mount_url(token: get_or_create_mailer_mount_token, only_path: true)
      end
    end

    def mailer_mount_path
      Rails.application.routes.url_helpers.mailer_mount_path(token: get_or_create_mailer_mount_token)
    end

    private

    def get_or_create_mailer_mount_token
      if mailer_mount_magic_token.present?
        mailer_mount_magic_token.token
      else
        create_mailer_mount_token.token
      end
    end

    def create_mailer_mount_token
      # Create a new MagicToken for this owner
      new_token = MailerMount::MagicToken.create!(owner: self)
      new_token.token
    end
  end
end
