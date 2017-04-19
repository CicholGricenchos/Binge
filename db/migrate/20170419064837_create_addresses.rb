class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :street
      t.string :country
      t.string :province
      t.string :city
      t.string :postal_code
      t.string :phone
      t.timestamps
    end
    add_index :addresses, :customer_id
  end
end
