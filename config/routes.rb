Rails.application.routes.draw do

  
  root to: 'tasks#index'
  
  resources :tasks
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  #resources :users, only: [:index, :show, :create]
  
end
