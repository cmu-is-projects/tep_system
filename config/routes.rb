Rails.application.routes.draw do
  get 'schools', to: 'schools#index', as: :schools

  get 'teachers', to: 'teachers#index', as: :teachers

  resources :orders
  resources :items
  resources :users
  resources :order_items

  root 'teachers#index'

  # custom paths
  get '/sync/', to: 'orders#sync', as: 'sync'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
