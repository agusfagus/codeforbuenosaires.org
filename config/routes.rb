Codeforbuenosaires::Application.routes.draw do
  root to: 'landing#index'
  resources :landing, only: [:index]
  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
end
