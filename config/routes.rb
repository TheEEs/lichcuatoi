Rails.application.routes.draw do
  get 'login', to: "login#index", as: :login
  get 'omniauth_callbacks/facebook'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
end
