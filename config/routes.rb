Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/v1/plants', to: 'plants#index'
  get '/api/v1/plant/:id', to: 'plants#show'
end
