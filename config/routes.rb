Rails.application.routes.draw do
  get 'schools', to: 'schools#index', as: :schools
	get 'schools/:id', to: 'schools#show', as: :school

  get 'teachers', to: 'teachers#index', as: :teachers
  get 'teachers/:id', to: 'teachers#show', as: :teacher

  resources :orders
  resources :items
  resources :users
  resources :order_items
  resources :sessions

  get 'users/new', to: 'users#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  root 'home#index', as: 'home'

  # custom paths
  get 'sync', to: 'orders#sync', as: 'sync'
  patch 'upload', to: 'orders#upload', as: 'upload'
  delete 'destroy_all', to: 'orders#destroy_all', as: 'destroy_all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
