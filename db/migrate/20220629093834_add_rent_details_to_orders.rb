class AddRentDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :rentstarted, :datetime
    add_column :orders, :rentended, :datetime
    add_column :orders, :Totalrent, :integer
  end
end
