module MailerMount
  class ToggleEmailList
    def initialize(owner:, list_key:, opt_in:)
      @owner = owner
      @list_key = list_key
      @opt_in = ActiveModel::Type::Boolean.new.cast(opt_in)
      @email_list_attributes = MailerMount::Configuration.email_lists[list_key.to_sym]
    end

    def call
      email_preference = @owner.mailer_mount_email_preferences.find_or_initialize_by(list_key: @list_key)

      if @opt_in
        email_preference.optin_at = Time.current
        email_preference.unsubscribed_at = nil
      elsif !@email_list_attributes[:required]
        email_preference.unsubscribed_at = Time.current
      end

      email_preference.save!
    end
  end
end
