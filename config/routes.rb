Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :expenses, only: [:show, :new, :create]
  resources :revenues, only: [:show, :new, :create]
  get 'cash_flow', to: 'cash_flows#index'
  devise_for :users
  root to: 'home#index'
end
