Rails.application.routes.draw do
  get 'transactions/index'

  get 'transactions/edit'

  get 'transactions/new'

  get 'transactions/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
