class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :product_name
      t.integer :Price
      t.string :Discription

      t.timestamps
    end
    add_index("products","category_id")
  end
end
