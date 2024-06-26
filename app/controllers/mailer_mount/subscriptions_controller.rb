module MailerMount
  class SubscriptionsController < BaseController
    layout 'mailer_mount/application'
    helper_method :current_owner

    before_action :sync_email_list, only: :index

    def index
      respond_to do |format|
        format.html
      end
    end

    def create
      if params[:id].downcase == 'all'
        subscribe_all
      else
        toggle_subscription(params[:id], true)
      end
      redirect_to mailer_mount.opt_ins_path(token: cookies[:mailer_mount]), notice: I18n.t('mailer_mount.subscription_updated')
    end

    def destroy
      if params[:id].downcase == 'all'
        unsubscribe_all
      else
        toggle_subscription(params[:id], false)
      end
      redirect_to mailer_mount.opt_ins_path(token: cookies[:mailer_mount]), notice: I18n.t('mailer_mount.subscription_updated')
    end

    private

    def subscribe_all
      MailerMount::Configuration.email_lists.keys.each do |list_key|
        toggle_subscription(list_key, true)
      end
    end

    def unsubscribe_all
      MailerMount::Configuration.email_lists.keys.each do |list_key|
        toggle_subscription(list_key, false) unless MailerMount::Configuration.email_lists[list_key]['required']
      end
    end

    def sync_email_list
      @preferences = MailerMount::SyncEmailList.new(owner: current_owner).call
    end

    def toggle_subscription(list_key, opt_in)
      MailerMount::ToggleEmailList.new(owner: current_owner, list_key: list_key, opt_in: opt_in).call
    end
  end
end
