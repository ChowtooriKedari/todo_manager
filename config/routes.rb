Rails.application.routes.draw do
  get "/" => "home#index"
  resources :todos
  resources :users
  get "/new" => "users#new", as: :user_sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
