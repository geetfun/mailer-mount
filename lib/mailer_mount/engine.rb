module MailerMount
  class Engine < ::Rails::Engine
    isolate_namespace MailerMount

    config.generators do |g|
      g.orm :active_record, migration: true
    end
  end
end
