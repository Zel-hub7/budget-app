Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :payments
  resources :items
  resources :categories
  resources :users



end
