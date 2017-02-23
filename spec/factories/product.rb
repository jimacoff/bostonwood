# frozen_string_literal: true
require 'factory_girl_rails'

FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "test product #{n}" }
    builder { FactoryGirl.create(:builder) }
    category { FactoryGirl.create(:category) }
    build_material "test material"

    after(:build) do |x|
      allow(x).to receive(:image).and_return(true)
    end
  end
end
