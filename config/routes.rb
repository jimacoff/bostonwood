# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :admins

  root "site#index"

  resources :categories, only: [:index, :show, :edit, :update, :new, :create] do
    resources :products, only: [:show, :edit, :update, :new, :create]
  end

  resources :pricings, only: [:edit, :update, :new, :create]

  resources :builders, only: [:show, :new, :create]

  resources :site, only: [:index] do
    resources :locations, only: [:index]
  end
end
