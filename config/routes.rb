Rails.application.routes.draw do

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :sessions, only: [:home, :new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :rides, only: :create

  root to: 'sessions#home'

  get '/signin', to: 'sessions#new', as: 'signin'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
