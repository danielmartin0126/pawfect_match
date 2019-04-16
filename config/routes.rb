Rails.application.routes.draw do
  resources :users
  resources :relationships
  resources :posts
  resources :comments
  resources :seekings
  resources :messages
  # get '/users/filtered', to: 'users#filtered', as: 'matches'
  get '/results', to: 'users#results'
  # post 'users/results', to: 'users#search_results'
  # post 'users/search', to: 'users#search_users', as: 'search_users'
end
