# frozen_string_literal: true
require 'factory_girl_rails'

FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| 'test product #{n}' }
    build_material 'test material'
    category Category.create(name: 'test category')
  end
end
