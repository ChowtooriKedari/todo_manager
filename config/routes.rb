Rails.application.routes.draw do
  #post "users/login", to: "users#login"
  #resources :users
  get "/" => "todos#index"
  resources :todos
end
