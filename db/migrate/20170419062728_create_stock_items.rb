class CreateStockItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_items do |t|
      t.integer :warehouse_id
      t.integer :stock_keeping_unit_id
      t.integer :on_hand
      t.timestamps
    end

    add_index :stock_items, [:stock_keeping_unit_id, :warehouse_id]
  end
end
