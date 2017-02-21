class AddOrderNumberToProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :order_num, :integer
  end

  def down
    remove_column :products, :order_num
  end
end
