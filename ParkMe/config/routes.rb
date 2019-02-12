Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get "users/:user_id/reservations", to: "reservations#show"
      resources :reviews
      resources :listings do
        resources :reviews
      end
      resources :reservations
      resources :users do
        resources :reservations
        resources :listings
        collection do
          post '/login', to: 'users#login'
          post '/current_user', to: 'users#show'
        end
      end
    end
  end
end
