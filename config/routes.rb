Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :books, only: [:index, :show] do
    resources :summaries, only: [:create]
    resources :comments, only: [:create]
  end
  resources :authors, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
