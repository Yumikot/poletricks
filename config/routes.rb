Rails.application.routes.draw do
  get 'users/new'
  root 'top#index'
  get 'signup'  => 'users#new'
   resources :users

 end
