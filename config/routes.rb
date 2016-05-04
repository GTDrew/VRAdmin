Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :apps
    resources :videos

    root to: "users#index"
  end

  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }

  root 'welcome#index'

  resources :apps do

    member do
      get 'preview', to: 'apps#preview_iphone'
      get 'preview/android', to: 'apps#preview_android'
    end

    resources :videos do
      put :sort, on: :collection
    end
  end

  get '/users/:id', to: 'users#show', as: 'user'

end
