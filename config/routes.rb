Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:index, :show] do
    resources :products, only: [:show]
  end
  resources :builders, only: [:show]

end
