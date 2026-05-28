Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :template
      resources :websites, param: :uuid, only: [:show]
    end
  end
end
