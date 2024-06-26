MailerMount::Engine.routes.draw do
  post '/:id/opt_in', to: 'subscriptions#create', as: :opt_in
  match '/:id/opt_out', to: 'subscriptions#destroy', via: [:get, :delete], as: :opt_out
  get '/', to: 'subscriptions#index', as: :opt_ins
end
