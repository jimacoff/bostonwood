# frozen_string_literal: true
class Builder < ApplicationRecord
  has_many :products

  validates :name, presence: true
end
