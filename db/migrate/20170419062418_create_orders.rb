class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :item_total, precision: 8, scale: 2
      t.decimal :shipping_cost, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.integer :customer_id
      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
