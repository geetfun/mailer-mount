module MailerMount
  class MagicToken < ApplicationRecord
    belongs_to :owner, polymorphic: true
    validates :token, presence: true, uniqueness: true

    before_validation :generate_unique_token, on: :create

    private

    def generate_unique_token
      return if token.present?

      begin
        self.token = SecureRandom.urlsafe_base64(24)
      end while self.class.exists?(token: token)
    end
  end
end
