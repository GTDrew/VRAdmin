Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :dashboard
  resources :apps
  get '/users/:id', to: 'users#show', as: 'user'

end
