class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer "user_id"
      # t.integer "product_id" REFERENCES products(id) ON DELETE CASCADE
      # add_reference :products, :id, index: false
      t.integer "product_id"
      t.integer "category_id"
      t.integer "quantity"
      t.integer "total_price"
      t.timestamps
    end
    add_index("carts","product_id")
  end
end
