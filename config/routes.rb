Rails.application.routes.draw do
  root to: "home#index"

  resources :avatars
  resources :classrooms
  resources :sessions

  get "/login" => "sessions#new", as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end
