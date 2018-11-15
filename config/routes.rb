Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :user_technologies, only: [:new, :create, :destroy]
    resources :user_follows, only: [:new, :create, :destroy]
  end

  root to: 'pages#home'

  resources :pages, only: [:home]

  resources :projects, only: [:index, :show, :destroy] do
    resources :project_technologies, only: [:new, :create, :destroy]
    resources :project_follows, only: [:new, :create, :destroy]
  end




end
