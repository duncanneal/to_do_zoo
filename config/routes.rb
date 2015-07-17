Rails.application.routes.draw do
  devise_for :users
  resources :users

  get 'lists/progress', :to => 'lists#progress'

  resources :kids
  
  resources :lists do
    resources :items
  end
  
  root to: 'visitors#index'
end
