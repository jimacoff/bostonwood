# frozen_string_literal: true
require 'factory_girl_rails'

FactoryGirl.define do
  factory :builder do
    sequence(:name) { |n| "test builder #{n}" }
  end
end
