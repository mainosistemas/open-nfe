Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :emissores, except: [:show, :destroy]
  resources :clientes, except: [:show, :destroy]
end