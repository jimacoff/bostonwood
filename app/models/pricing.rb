class Pricing < ApplicationRecord
  belongs_to :product

  validates :product, presence: true

  def widths
    if Pricing.find_by(product_id: self.id) != nil
      var = data["item_pricing"]["dimensions"]["widths"]
      export = JSON.parse(var)
      export.join(", ")
    end
  end

  def heights
    if Pricing.find_by(product_id: self.id) != nil
      data["item_pricing"]["dimensions"]["heights"].join(", ")
    end
  end

  def price(number)
    if Pricing.find_by(product_id: self.id) != nil
      self.data["item_pricing"]["unfinished_pricing"][number.to_s].join(", ")
    end
  end
end
