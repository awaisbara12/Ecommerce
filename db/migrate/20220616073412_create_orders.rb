class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :address
      t.string :email
      t.integer :price
      t.integer :quantity
      t.boolean :status,:default => false

      t.timestamps
    end
  end
end
