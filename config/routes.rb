Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'videos/index'
  get  'index' =>'messages#index'
  post 'confirm' => 'messages#confirm'
  get 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done'
  
  
  # get    'login'   => 'sessions#new'
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'
  
  resources :users do
    resources :comments, :bookmarks
  end
  
  resources :tricks do
    resources :user_tricks, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :tricks do
    resources :comments, only: [:create, :destroy] 
  end
  namespace :admin do
    resources :users
    resources :tricks
    resources :articles
  end
 
  resources :bookmarks, only: [:index]
  resources :articles
 
 end
