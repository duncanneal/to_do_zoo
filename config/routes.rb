Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :items, :kids

  get 'lists', :to => 'lists#index'
  get 'lists/progress', :to => 'lists#progress'

root to: 'visitors#index'
end
