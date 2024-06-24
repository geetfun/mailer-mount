class MailerMount::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def create_migrations
    rails_command "railties:install:migrations FROM=mailer_mount", inline: true
  end
end