Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :books, only: [:index, :show]
  resources :authors, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
