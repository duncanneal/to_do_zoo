Rails.application.routes.draw do
  devise_for :users
  resources :users

  get 'lists/progress', :to => 'lists#progress'

  resources :kids, :lists, :items

root to: 'visitors#index'
end
