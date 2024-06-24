module MailerMount
  class Configuration
    attr_accessor :authentication_method, :current_user_method

    def initialize
      @authentication_method = nil
      @current_user_method = -> { current_user }
    end

    def authentication_method(&block)
      @authentication_method = block if block_given?
    end

    def current_user_method(&block)
      @current_user_method = block if block_given?
    end
  end
end
