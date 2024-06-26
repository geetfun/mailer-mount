class CreateMailerMountEmailPreferences < ActiveRecord::Migration[7.2]
  def change
    create_table :mailer_mount_email_preferences do |t|
      t.references :owner, polymorphic: true, null: false
      t.string :list_key, null: false
      t.datetime :unsubscribed_at
      t.datetime :optin_at

      t.timestamps
    end

    add_index :mailer_mount_email_preferences, [:owner_type, :owner_id, :list_key], unique: true
  end
end
