Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  # get 'sessions/new'
  # get 'users/new'
  root 'static_pages#home'
  get '/help',to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'
  # get '/microposts', to: 'static_pages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  post 'microposts/share', to: 'microposts#share'
  post 'mlikes/show', to: 'mlikes#show'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :mlikes, only: [:create, :destroy, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
