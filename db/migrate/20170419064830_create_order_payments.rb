class CreateOrderPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :order_payments do |t|
      t.integer :order_id
      t.boolean :success
      t.string :description
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
    add_index :order_payments, :order_id
  end
end
