Rails.application.routes.draw do
  get 'resources/index'

  get 'resources/check_status'

  get 'resources/show'

  resources :institutions
  resources :grants
  resources :resources
  resources :statuses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
end
