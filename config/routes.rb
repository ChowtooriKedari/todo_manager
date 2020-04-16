Rails.application.routes.draw do
  #post "users/login", to: "users#login"
  #resources :users
  get "/" => "home#index"
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/isgnout" => "sessions#destroy", as: :destroy_session
end
