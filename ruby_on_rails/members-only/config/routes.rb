Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :index]
  match 'signin',  to: 'sessions#new',     via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'
  
  resources :posts, only: [:new, :create, :index] 
  root 'posts#index'
end
