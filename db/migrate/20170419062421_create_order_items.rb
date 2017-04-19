class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :listing_item_id
      t.integer :quantity
      t.decimal :unit_price, precision: 8, scale: 2
      t.timestamps
    end
    add_index :order_items, :order_id
  end
end
