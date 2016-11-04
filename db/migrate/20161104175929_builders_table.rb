class BuildersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :builders do |t|
      t.string :name, null: false
      t.string :blurb
      t.text :description
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
