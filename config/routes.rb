Rails.application.routes.draw do
  resources :users
  resources :relationships
  resources :posts
  resources :comments
  # resources :logins
  resources :messages

  root  "sessions#new"
  get "/login", to: "sessions#new", as: 'login'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: 'logout'



end
