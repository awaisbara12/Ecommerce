class AddRenOrderProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :ren_order, :string, default: "orders"
  end
end
