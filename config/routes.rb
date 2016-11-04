Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:index]
  resources :builders, only: [:show]

end
