Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'splash#index'
  end

  resources :categories do
    resources :items
  end

  resources :payments
  resources :users
end
