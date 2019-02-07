Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get "users/:user_id/reservations", to: "reservations#show"
      resources :listings
      resources :users do
        resources :reservations
        collection do
          post '/login', to: 'users#login'
          post '/current_user', to: 'users#show'
        end
      end
    end
  end
end
