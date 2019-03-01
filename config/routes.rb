Rails.application.routes.draw do
  get 'usertricks/create'
  get 'usertricks/destroy'
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
  post 'likes/:trick_id/create' =>'likes#create'
  post 'likes/:trick_id/destroy' =>'likes#destroy'
  resources :users
  resources :tricks do
  resources :usertricks, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
   
  end
 end
