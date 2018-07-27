Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :expenses, only: [:new, :create]
  resources :revenues, only: [:new, :create]
  resources :families, only: [:new, :create, :index]
=======
  resources :expenses, only: [:show, :new, :create]
  resources :revenues, only: [:show, :new, :create]
>>>>>>> closing_month

  get 'cash_flow', to: 'cash_flows#index'
  devise_for :users

  root to: 'home#index'

  get 'meu_perfil', to: 'profiles#show', as: 'profile'
  get 'minha_familia', to: 'families#show', as: 'my_family'

end
