Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#welcome'

  resources :products do
    resources :reviews
  end

  resources :orders
  resources :order_items

  resource :cart, only: [:show]
  resources :charges
  devise_for :users
end
