Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :listings
      resources :reservations
      resources :parkmeusers
      resources :users do
        collection do
          post '/login', to: 'users#login'
          get '/login', to: 'users#login'
        end
      end
    end
  end
end
