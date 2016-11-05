class Product < ApplicationRecord
  attr_accessor :image

  belongs_to :category
  belongs_to :builder

  validates :name, presence: true
  validates :build_material, presence: true

  mount_uploader :image, ImageUploader

end
