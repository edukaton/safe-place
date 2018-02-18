class DomainConstraints
  def initialize(*domains)
    @domains = Array.wrap(domains)
  end

  def matches?(request)
    request.domain.in?(@domains)
  end
end

Rails.application.routes.draw do
  constraints DomainConstraints.new("szukaj.pl", "szkuaj.pl") do
    get "/", to: "search#index"
  end

  constraints DomainConstraints.new("kino.pl", "kyno.pl") do
    get "/", to: "cinema#index"
    get "/movies/:movie_id/showtimes/:showtime", to: "cinema#showtime"
  end

  constraints DomainConstraints.new("gateway.com") do
    get "/payment", to: "payments/gateway#payment"
    get "/failure", to: "payments/gateway#failure"
    post "/process_payment", to: "payments/gateway#process_payment"
  end

  root to: "home#index"

  resources :avatars
  resources :classrooms
  resources :sessions
  resources :tasks

  namespace :admin do
    resources :tasks
  end

  get "/login" => "sessions#new", as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end
