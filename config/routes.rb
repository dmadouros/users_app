Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/users')
  get "/healthcheck", to: "health#show"

  resources :users

  namespace :api do
    resources :users
  end
end
