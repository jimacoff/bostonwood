class Product < ApplicationRecord
  belongs_to :category
  belongs_to :builder

  validates :name, presence: true
  validates :build_material, presence: true
end
