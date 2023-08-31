# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :vendors

  resources :products, only: %i[index show]

  namespace :vendors do
    resources :products
    resources :categories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  get 'cart', to: 'carts#show'
  post 'carts/add'
  post 'carts/remove'
end
