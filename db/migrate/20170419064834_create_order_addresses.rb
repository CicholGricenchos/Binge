class CreateOrderAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :order_addresses do |t|
      t.integer :order_id
      t.string :name
      t.string :street
      t.string :country
      t.string :province
      t.string :city
      t.string :postal_code
      t.string :phone
      t.timestamps
    end
    add_index :order_addresses, :order_id
  end
end
