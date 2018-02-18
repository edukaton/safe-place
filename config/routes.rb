class DomainConstraints
  def initialize(*domains)
    @domains = Array.wrap(domains)
  end

  def matches?(request)
    full_domain = [
      request.subdomain,
      request.domain
    ].select(&:present?).join(".")
    full_domain.in?(@domains)
  end
end

Rails.application.routes.draw do
  constraints DomainConstraints.new(Domain.credible(:search), Domain.malicious(:search)) do
    get "/", to: "search#index"
  end

  constraints DomainConstraints.new(Domain.credible(:cinema), Domain.malicious(:cinema)) do
    get "/", to: "cinema#index"
    get "/movies/:movie_id/showtimes/:showtime", to: "cinema#showtime"
    post "/buy_ticket", to: "cinema#buy_ticket"
    get "/confirm_ticket/:id", to: "cinema#confirm_ticket"
  end

  constraints DomainConstraints.new(Domain.credible(:payments), Domain.malicious(:payments)) do
    get "/payment", to: "payments/gateway#payment"
    post "/payment", to: "payments/gateway#payment"
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
