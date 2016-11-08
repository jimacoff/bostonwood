class AddPricingToProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :pricing, :belongs_to, null: false
  end

  def down
    remove_column :products, :pricing, :belongs_to
  end
end
