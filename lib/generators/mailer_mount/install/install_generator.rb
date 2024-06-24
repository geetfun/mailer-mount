# frozen_string_literal: true

class MailerMount::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def create_migrations
    rails_command "railties:install:migrations FROM=mailer_mount", inline: true
  end

  def add_routes
    route 'mount MailerMount::Engine => "/mailer_mount"'
  end

  def create_initializer_file
    template "mailer_mount_initializer.rb", "config/initializers/mailer_mount.rb"
  end
end
