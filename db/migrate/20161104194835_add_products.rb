class AddProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :blurb
      t.text :description
      t.string :build_material, null: false
      t.belongs_to :category, null: false
      t.belongs_to :builder, null: false
    end
  end
end
