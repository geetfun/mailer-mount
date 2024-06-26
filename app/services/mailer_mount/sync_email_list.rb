module MailerMount
  class SyncEmailList
    def initialize(owner:)
      @owner = owner
      @email_lists = MailerMount::Configuration.email_lists
    end

    def call
      preferences = {}

      @owner.transaction do
        email_lists.each_pair do |list_key, list_attributes|
          email_preference = @owner.mailer_mount_email_preferences.find_or_initialize_by(list_key:)
          if email_preference.new_record?
            if list_attributes[:required]
            else
              email_preference.optin_at = list_attributes[:default_value] ? Time.current : nil
            end
            email_preference.save!
          else
            if list_attributes[:required]
              email_preference.optin_at = Time.current
            end
            email_preference.save!
          end

          unless list_attributes[:required]
            preferences[list_key.to_sym] = email_preference.optin_at.present? && email_preference.unsubscribed_at.nil?
          end
        end
      end

      preferences
    end

    private

    attr_reader :email_lists
  end
end
