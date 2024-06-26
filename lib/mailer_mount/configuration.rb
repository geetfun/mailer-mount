# lib/mailer_mount/configuration.rb
module MailerMount
  class Configuration
    @config_loaded = false

    class << self
      def load_config
        return if @config_loaded

        if defined?(Rails) && Rails.application && Rails.application.respond_to?(:config_for)
          begin
            config = Rails.application.config_for(:mailer_mount)
            config.each do |key, value|
              instance_variable_set("@#{key}", value)
              define_singleton_method(key) do
                instance_variable_get("@#{key}")
              end
            end
            @config_loaded = true
          rescue => e
            raise "Failed to load mailer_mount configuration: #{e.message}"
          end
        else
          raise "Rails application not found or config_for method not available"
        end
      end

      def method_missing(name, *args, &block)
        load_config unless @config_loaded
        if respond_to?(name)
          send(name, *args, &block)
        else
          super
        end
      end

      def respond_to_missing?(name, include_private = false)
        load_config unless @config_loaded
        instance_variables.include?("@#{name}".to_sym) || super
      end
    end
  end
end
