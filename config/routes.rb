Rails.application.routes.draw do
  resources :users
  resources :relationships
  resources :posts
  resources :comments
  resources :seekings
end
