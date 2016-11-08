# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :admins

  root "site#index"

  resources :categories, only: [:index, :show, :edit, :update, :new, :create] do
    resources :products, only: [:show, :edit, :update, :new, :create] do
      resources :pricing, only: [:edit, :update, :new, :create]
    end
  end

  resources :builders, only: [:show, :new, :create]

  resources :site, only: [:index]
end
