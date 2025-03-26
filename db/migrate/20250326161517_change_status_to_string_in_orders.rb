class ChangeStatusToStringInOrders < ActiveRecord::Migration[6.0]
  def up
    change_column :orders, :status, :string, default: 'pending'
  end

  def down
    change_column :orders, :status, :boolean, default: false
  end
end
