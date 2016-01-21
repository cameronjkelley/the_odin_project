Rails.application.routes.draw do
  root               'events#index'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :index]
  resources :events, only: [:new, :create, :show, :index]
end
