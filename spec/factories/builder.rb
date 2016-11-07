# frozen_string_literal: true
require 'factory_girl_rails'
require 'spec_helper'
require 'rails_helper'

FactoryGirl.define do
  factory :builder do
    sequence(:name) { |n| "builder #{n}" }
    sequence(:blurb) { |n| "#{n} blurb" }
    sequence(:description) { |n| "#{n} description" }
    sequence(:city) { |n| "#{n}City" }
    sequence(:state) { |n| "M#{n}" }
  end
end
