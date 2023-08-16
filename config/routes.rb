Rails.application.routes.draw do
  get 'steam/index'
  get 'pser/new'

  resources :psers, only: [:new, :create]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
