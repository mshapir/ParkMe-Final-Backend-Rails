Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "users/social_login", to: "users#social_create"
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
