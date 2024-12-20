Rails.application.routes.draw do
  # Ensure `devise_for` is defined only once
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  
  devise_for :users

  root "tasks#index"
  
  resources :tasks

  # Custom routes for sessions (if needed)
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
end
