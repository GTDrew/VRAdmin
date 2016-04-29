Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :dashboard

  resources :apps do
    get 'preview', on: :member
    resources :videos do
      put :sort, on: :collection
    end
  end

  get '/users/:id', to: 'users#show', as: 'user'

end
