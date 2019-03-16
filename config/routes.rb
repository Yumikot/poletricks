Rails.application.routes.draw do
  devise_for :users
  get 'tricks/new'
  root 'top#index'
  get 'mytricks_pages/index'
  get 'videos/index'
   
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users do
    resources :comments
  end
  resources :tricks do
     resources :user_tricks, only: [:create, :destroy]  
  end
  resources :tricks do
    resources :comments, only: [:create, :destroy] 
  end
 end
