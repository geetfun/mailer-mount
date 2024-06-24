module MailerMount
  class SubscriptionsController < ApplicationController
    def index
      respond_to do |format|
        format.html
      end
    end
  end
end
