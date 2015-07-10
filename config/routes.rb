Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :lists
  resources :items

root to: 'visitors#index'
end
