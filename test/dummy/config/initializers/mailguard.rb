MailerMount.configure do |config|
  config.authenticator do
    # Your custom authentication logic here
    unless Current.user
      redirect_to new_session_path, alert: "You must be logged in to access this section"
    end
  end

  config.current_user_method do
    Current.user
  end
end
