Rails.application.routes.draw do
  # Ensure `devise_for` is defined only once
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users

  root "tasks#index"
  resources :users, only: [:new, :create]
  resources :tasks
  
end

