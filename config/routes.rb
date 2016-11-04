Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:index, :show]
  resources :builders, only: [:show]

end
