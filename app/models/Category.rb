# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :products
  has_many :builders
  #test
  validates :name, presence: true
end
