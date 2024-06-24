module MailerMount
  class EmailPreference < ApplicationRecord
    # Associations
    belongs_to :owner, polymorphic: true

    # Validations
    validates :channel, presence: true, uniqueness: { scope: [:owner_type, :owner_id] }
  end
end
