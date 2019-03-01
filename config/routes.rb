Rails.application.routes.draw do
  get 'tricks/new'
  get 'sessions/new'
  get 'users/new'
  root 'top#index'
  get 'signup'  => 'users#new'
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
