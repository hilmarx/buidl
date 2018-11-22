Rails.application.routes.draw do

  #devise_for :users
  # Github OAutch connection
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Github Auth Stuff
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_github_user_session
    # get 'sign_in', :to => 'devise/sessions#new', :as => :new_github_user_session
    #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_github_user_session
  end

  get 'pages' => 'pages#search'

  root to: 'pages#home'


  resources :profiles, only: [:show, :create, :update] do
    resources :profile_technologies, only: [:new, :create, :destroy]
    resources :user_follows, only: [:create, :update]
    resources :projects, only: [ :update] do
      resources :contributions, only: [:destroy]
    end
  end

  resources :projects, only: [:show, :destroy] do
    resources :project_technologies, only: [:new, :create, :destroy]
    resources :project_follows, only: [:new, :create, :destroy]
  end



end
