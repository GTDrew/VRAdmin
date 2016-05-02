Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :apps
    resources :videos

    root to: "users#index"
  end

  devise_for :users
  root 'welcome#index'

  resources :apps do
    get 'preview', on: :member
    resources :videos do
      put :sort, on: :collection
    end
  end

  get '/users/:id', to: 'users#show', as: 'user'

end
