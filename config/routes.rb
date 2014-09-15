ZapplyLite::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :reactivations, only: [:new, :create]
  namespace :api do
    resources :sessions
    resources :documents

    # admin only
    resources :applicants
    resources :ratings
    resources :job_openings, only: [:show]
  end

  # resources :documents, only: [:new, :create]
  resources :downloads, only: [:show]
  resources :images, only: [:show]

end
