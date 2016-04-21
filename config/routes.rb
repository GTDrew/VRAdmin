Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :dashboard
  #   resources :products
  get '/users/:id', to: 'users#show', as: 'user'

end
