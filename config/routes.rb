Rails.application.routes.draw do
  # got rid of :new below to create user signup with an alias
  resources :users, only: [:create, :show, :edit, :update]
  get '/signup', to: 'users#new', as: 'signup'
  resources :books, only: [:index, :show, :new, :create] do
    resources :summaries, only: [:create, :edit, :update, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :authors, only: [:show, :index, :new, :create]
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#delete', as: :logout
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
