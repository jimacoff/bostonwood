# frozen_string_literal: true
require 'factory_girl_rails'

FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "test category" }
  end
end
