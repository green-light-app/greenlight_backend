Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create]
  get "/auto_login", to: "auth#auto_login"
  post "/login", to: "auth#create"

end
