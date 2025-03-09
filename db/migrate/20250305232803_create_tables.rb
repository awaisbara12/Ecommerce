class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :number
      t.string :status, :default => "unoccupied"
      t.integer :user_id
      t.integer :table_no

      t.timestamps
    end
  end
end
