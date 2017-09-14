Rails.application.routes.draw do
  root 'users#new'
  get 'users', to: 'users#new'
  resources:users
end
