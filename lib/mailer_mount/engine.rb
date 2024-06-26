module MailerMount
  class Engine < ::Rails::Engine
    isolate_namespace MailerMount

    config.generators do |g|
      g.orm :active_record, migration: true
    end

    initializer "mailer_mount.assets.precompile" do |app|
      app.config.assets.precompile += %w( mailer_mount/application.css )
    end
  end
end
