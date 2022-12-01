Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/v1/plants', to: 'plants#index'

  post '/api/v1/users', to: 'users#create'
  post '/api/v1/login', to: 'sessions#create'
  delete '/api/v1/logout', to: 'sessions#destroy'
  get '/api/v1/logged_in', to: 'sessions#logged_in?'

  post '/api/v1/wishlist', to: 'wishlists#create'
  delete '/api/v1/wishlist/:user_id/:plant_id', to: 'wishlists#destroy'
end
