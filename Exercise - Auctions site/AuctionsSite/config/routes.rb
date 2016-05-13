Rails.application.routes.draw do
  devise_for :users
  # get '/', to: 'users#form_login'
  # post '/', to: 'users#login'

  # get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show', as: :user_show
  # post '/users', to: 'users#create'
  # delete '/users/:id', to: 'users#destroy', as: :users_destroy

  get '/users/:user_id/products', to: 'products#index'
  get '/users/:user_id/products/new', to: 'products#new',
    as: :user_products_new
  get '/users/:user_id/products/:id', to: 'products#show',
    as: :user_products_show
  post '/users/:user_id/products',
    to: 'products#create', as: :user_products
  delete '/users/:user_id/products/:id',
    to: 'products#destroy', as: :user_products_destroy

  post '/products/:product_id/bids', to: 'bids#create'
  post '/products/:product_id/buynow', to: 'products#buynow'

  resources :reviews, only: [:create, :edit, :update, :destroy]

  get '/api/users/:user_id/seller_reviews', to: 'seller_reviews#show'
end
