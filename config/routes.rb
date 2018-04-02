Rails.application.routes.draw do
  get 'schools', to: 'schools#index'

  get 'teachers', to: 'teachers#index'

  resources :orders

  root 'teachers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
