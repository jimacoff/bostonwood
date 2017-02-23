# frozen_string_literal: true
class Product < ApplicationRecord
  attr_accessor :image

  belongs_to :category
  belongs_to :builder

  validates :name, presence: true
  validates :build_material, presence: true
  validates :blurb, length: { maximum: 60 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def pricing_object
    if Pricing.find_by(product_id: self.id) != nil
      Pricing.find_by(product_id: self.id)
    end
  end

  def widths
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["dimensions"]["widths"]
    end
  end

  def heights
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["dimensions"]["heights"]
    end
  end

  def colors
    if self.builder.name == "Evergreen"
      [
        'Natural',
        'White Wash',
        'Golden Oak',
        'Distressed Pecan',
        'Country Pine',
        'Meadow Oak',
        'Orange Walnut',
        'Cherry',
        'Traditional Cherry',
        'Classic Redwood',
        'Rich Cherry',
        'Rosewood',
        'Traditional Mahogany',
        'Espresso',
        'Spanish Pecan',
        'Coffee Bean',
        'Toffee',
        'Charcoal',
        'Tobacco',
        'Black'
      ]
    elsif self.builder.name == "Berkshire"
      [
        'Natural',
        'White Wash',
        'Golden Oak',
        'Distressed Pecan',
        'Country Pine',
        'Meadow Oak',
        'Orange Walnut',
        'Cherry',
        'Traditional Cherry',
        'Classic Redwood',
        'Rich Cherry',
        'Rosewood',
        'Traditional Mahogany',
        'Espresso',
        'Spanish Pecan',
        'Coffee Bean',
        'Toffee',
        'Charcoal',
        'Tobacco',
        'Black',
        'White Dove',
        'Bright White',
        'Parsley Snips',
        'Big Sky Blue',
        'Chili Pepper Red'
      ]
    elsif self.builder.name == "Archbold"
      [
        'Natural',
        'Honey',
        'Golden Pecan',
        'Antique Cherry',
        'Washington Cherry',
        'Rich Cherry',
        'Tuscan Brown',
        'Brown Mahogany',
        'Coffee',
        'Driftwood',
        'Snow White',
        'Black'
      ]
    elsif self.builder.name == "Penns Creek"
      [
        'Natural',
        'Sunrise',
        'Harvest',
        'Sealy',
        'Royal',
        'New Carrington',
        'Heritage',
        'Asbury',
        'Acres',
        'Charleston',
        'American Traditional',
        'White',
        'Pearl',
        'Buttermilk',
        'Hearthside Red',
        'Williamsburg Blue',
        'Sage',
        'Chelsea Gray',
        'Eclipse Black'
      ]
    end
  end

  def unfinished_prices
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["unfinished_pricing"]
    end
  end

  def finished_prices
    if Pricing.find_by(product_id: self.id) != nil
      data = self.unfinished_prices
      data.each do |key, value|
        value.each_with_index do |price, index|
          fin_price = price.to_i
          fin_price = (fin_price * 1.5).to_i
          value[index] = fin_price.to_s
        end
      end
    end
  end
end
