require 'factory_girl_rails'

FactoryGirl.define do
  factory :admin do
    email "admin_email@bostonwood.com"
    password "test_pass"
  end
end
