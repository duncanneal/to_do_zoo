Rails.application.routes.draw do
  devise_for :users
  resources :users

  get 'lists/progress', :to => 'lists#progress'

  resources :kids

  get 'kids/todo', :to => 'kids#todo'
  
  resources :lists do
    resources :items
  end
  
  root to: 'visitors#index'
end
