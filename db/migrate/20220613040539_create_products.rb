class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.text :description
      t.integer :price
      t.integer :qty
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
