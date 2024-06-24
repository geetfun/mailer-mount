module MailerMount
  class ApplicationController < ActionController::Base
    include MailerMount::Authentication
  end
end
