module Mailguard
  class ApplicationController < ActionController::Base
    include Mailguard::Authentication
  end
end
