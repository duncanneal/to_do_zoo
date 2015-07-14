Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :items, :kids

  get 'lists', :to => 'lists#index'
  get 'lists/list', :to => 'lists#list'
  get 'lists/item', :to => 'lists#item'
  get 'lists/progress', :to => 'lists#progress'

root to: 'visitors#index'
end
