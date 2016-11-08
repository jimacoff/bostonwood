class Pricing < ApplicationRecord
  belongs_to :product

  validates :product, presence: true

  def widths
     data["item_pricing"]["dimensions"]["widths"].join(", ")
  end

  def heights
     data["item_pricing"]["dimensions"]["heights"].join(", ")
  end

  def price(number)
    self.data["item_pricing"]["unfinished_pricing"][number.to_s].join(", ")
  end
end
