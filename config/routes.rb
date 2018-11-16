Rails.application.routes.draw do

  devise_for :users

  get 'pages' => 'pages#search'
  get 'pages/test' => 'pages#test'

  root to: 'pages#home'



  resources :users, only: [:show, :index] do
    resources :user_technologies, only: [:new, :create, :destroy]
    resources :user_follows, only: [:new, :create, :destroy]
  end


  resources :projects, only: [:show, :destroy] do
    resources :project_technologies, only: [:new, :create, :destroy]
    resources :project_follows, only: [:new, :create, :destroy]
  end

  resources :profiles, only: [:show]

end
