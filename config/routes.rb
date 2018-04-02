Rails.application.routes.draw do
  get 'schools', to: 'schools#index', as: :schools

  get 'teachers', to: 'teachers#index', as: :teachers

  resources :orders

  root 'teachers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
