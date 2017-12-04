Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#welcome'

  resources :products
  resources :order_items
  resource :cart, only: [:show]

  devise_for :users
end
