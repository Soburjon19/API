Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dota
  post "/sign_in", to: "auth#login"
  post "/sign_up", to: "users#create"

    end
  end
end
