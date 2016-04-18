Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  #   resources :products
  get '/users/:id', to: 'users#show', as: 'user'

end
