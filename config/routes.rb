# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :admins

  root "site#index"

  resources :categories, only: [:index, :show, :edit, :update] do
    resources :products, only: [:show, :edit, :update]
  end

  resources :builders, only: [:show]

  resources :site, only: [:index]
end
