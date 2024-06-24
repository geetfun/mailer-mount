Rails.application.routes.draw do
  mount MailerMount::Engine => "/mailer_mount"
end
