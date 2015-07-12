Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :lists
  resources :items
  resources :kids

root to: 'visitors#index'
end
