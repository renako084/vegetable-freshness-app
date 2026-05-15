Rails.application.routes.draw do
  root "stocks#index"

  get    "/signup", to: "users#new"
  post   "/signup", to: "users#create"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :stocks, only: [:index, :new, :create, :destroy]
end