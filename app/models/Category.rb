# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :products
  has_many :builders

  validates :name, presence: true
end
