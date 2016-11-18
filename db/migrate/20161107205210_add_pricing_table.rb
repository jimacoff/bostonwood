class AddPricingTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pricings do |t|
      t.belongs_to :product, null: false
      t.jsonb :data
    end
  end
end
