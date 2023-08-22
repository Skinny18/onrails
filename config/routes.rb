Rails.application.routes.draw do
  resources :enderecos
  resources :profiles
  resources :users
  get 'user/new'

  get 'login', to: 'users#login'
  
  
  resources :users, only: [:new, :create, :login] do
    member do
      get :qrcode
    end
  end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
