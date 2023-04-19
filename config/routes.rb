Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :clients, only: [:index, :show]
  resources :gyms, only: [:index, :show, :destroy]
  resources :memberships, only: [:index, :create]
end
