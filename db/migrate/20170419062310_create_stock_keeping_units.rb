class CreateStockKeepingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_keeping_units do |t|
      t.string :name
      t.string :model
      t.timestamps
    end

    create_table :listing_items_stock_keeping_units do |t|
      t.integer :listing_item_id
      t.integer :stock_keeping_unit_id
    end

    add_index :listing_items_stock_keeping_units, :listing_item_id, name: :listing_item_id
    add_index :listing_items_stock_keeping_units, :stock_keeping_unit_id, name: :stock_keeping_unit_id
  end
end
