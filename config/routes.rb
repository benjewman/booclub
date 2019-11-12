Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :books, only: [:index, :show]
  resources :authors, only: [:show, :index]
  resources :sessions, only: [:create]

  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#delete', as: :logout
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
