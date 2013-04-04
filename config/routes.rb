ZapplyLite::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :api do
    resource :session
    resources :documents
  end
end
