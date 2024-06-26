class CreateMailerMountMagicTokens < ActiveRecord::Migration[7.2]
  def change
    create_table :mailer_mount_magic_tokens do |t|
      t.references :owner, polymorphic: true, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
