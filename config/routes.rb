Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/v1/plants', to: 'plants#index'
  get '/api/v1/plant/:id', to: 'plants#show'

  post '/api/v1/users', to: 'users#create'
  get '/api/v1/users/:user_id', to: 'users#show'
  get '/api/v1/users', to: 'users#index'

  post '/api/v1/login', to: 'sessions#create'
  delete '/api/v1/logout', to: 'sessions#destroy'
  get '/api/v1/logged_in', to: 'sessions#is_logged_in?'
end
