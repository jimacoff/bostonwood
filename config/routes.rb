# frozen_string_literal: true
Rails.application.routes.draw do
  root "site#index"

  resources :categories, only: [:index, :show] do
    resources :products, only: [:show, :edit, :update]
  end

  resources :builders, only: [:show]

  resources :site, only: [:index]

  devise_for :admins
end
