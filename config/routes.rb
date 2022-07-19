Rails.application.routes.draw do
  get 'home/index'
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create' OR
  resources :users, except: [:new]

  root "home#index"
end
