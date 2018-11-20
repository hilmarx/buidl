Rails.application.routes.draw do

  devise_for :users

  get 'pages' => 'pages#search'
  get 'pages/test' => 'pages#test'

  root to: 'pages#home'

  resources :profile_technologies, only: [:new, :create, :destroy]
  resources :user_follows, only: [:new, :create, :destroy]
  resources :profiles, only: [:show, :create, :update] do
    resources :projects, only: [ :update]
  end






  resources :projects, only: [:show, :destroy] do
    resources :project_technologies, only: [:new, :create, :destroy]
    resources :project_follows, only: [:new, :create, :destroy]
  end



end
