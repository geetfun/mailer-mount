class CreateMailguardEmailPreferences < ActiveRecord::Migration[7.2]
  def change
    create_table :mailguard_email_preferences do |t|
      t.references :owner, polymorphic: true, null: false
      t.string :channel, null: false
      t.datetime :unsubscribed_at
      t.datetime :optin_at

      t.timestamps
    end
  end
end
