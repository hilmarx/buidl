Rails.application.routes.draw do
  get 'project_follows/new'
  get 'project_follows/create'
  get 'project_follows/destroy'
  get 'project_technologies/new'
  get 'project_technologies/create'
  get 'project_technologies/destroy'
  get 'projects/index'
  get 'projects/show'
  get 'projects/destroy'
  get 'user_follows/new'
  get 'user_follows/create'
  get 'user_follows/destroy'
  get 'user_technologies/new'
  get 'user_technologies/create'
  get 'user_technologies/destroy'
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
