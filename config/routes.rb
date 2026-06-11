Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :template
      resources :websites, param: :uuid, only: [ :show ]
    end
  end
  post "/login", to: "auth#login"
  post "/register", to: "auth#register"
  delete "/logout", to: "auth#logout"
end
