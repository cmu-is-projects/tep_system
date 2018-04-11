Rails.application.routes.draw do
  get 'schools', to: 'schools#index', as: :schools
	get '/schools/:id', to: 'schools#show'

  get 'teachers', to: 'teachers#index', as: :teachers
  get '/teachers/:id', to: 'teachers#show'

  resources :orders
  resources :items
  resources :users
  resources :order_items

  root 'teachers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
