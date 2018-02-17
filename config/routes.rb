class DomainConstraints
  def initialize(*domains)
    @domains = Array.wrap(domains)
  end

  def matches?(request)
    request.domain.in?(@domains)
  end
end

Rails.application.routes.draw do
  root to: "home#index"

  resources :avatars
  resources :classrooms
  resources :sessions
  resources :tasks

  get "/login" => "sessions#new", as: :login
  delete "/logout" => "sessions#destroy", as: :logout

  constraints DomainConstraints.new("szukaj.pl", "szkuaj.pl") do
    get "/", to: "search#index"
  end

  constraints DomainConstraints.new("kino.pl", "kyno.pl") do
    get "/", to: "cinema#index"
  end
end
