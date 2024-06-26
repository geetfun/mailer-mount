module MailerMount
  class BaseController < ::ActionController::Base
    include MailerMount::Authentication
  end
end
