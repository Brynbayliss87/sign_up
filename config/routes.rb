Rails.application.routes.draw do
  root 'users#new'
  get  'users', to: 'users#new'
  patch 'users/:id', to: 'users#new', :as => :user
  resources :users, only: [:new, :create]
end
