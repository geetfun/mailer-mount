Rails.application.routes.draw do
  mount Mailguard::Engine => "/mailguard"
end
