class Pricing < ApplicationRecord
  belongs_to :product

  validates :product, presence: true

  def widths
    object = JSON.parse(self.data)
    export = object["item_pricing"]["dimensions"]["widths"]
    export.join(" ")
  end

  def heights
    object = JSON.parse(self.data)
    export = object["item_pricing"]["dimensions"]["heights"]
    export.join(" ")
  end

  def price(number)
    object = JSON.parse(self.data)
    export = object["item_pricing"]["unfinished_pricing"][number.to_s]
    export.join(" ")
  end
end
