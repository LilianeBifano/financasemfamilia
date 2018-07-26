Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :expenses, only: [:show, :new, :create]
  resources :revenues, only: [:show, :new, :create]
  resources :families, only: [:show, :new, :create, :index]

  devise_for :users
  
  root to: 'home#index'
  
  get 'meu_perfil', to: 'profiles#show', as: 'profile'
  
end
