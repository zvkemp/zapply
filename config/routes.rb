ZapplyLite::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :api do
    resources :sessions
    resources :documents

    namespace :admin do
      resources :applicants
    end
  end

  # resources :documents, only: [:new, :create]
  resources :downloads, only: [:show]
end
