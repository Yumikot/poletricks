Rails.application.routes.draw do
  devise_for :users
  get 'tricks/new'
  root 'top#index'
  get 'mytricks_pages/index'
  get 'videos/index'
   
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
  resources :tricks do
     resources :user_tricks, only: [:create, :destroy]  
  end
 end
