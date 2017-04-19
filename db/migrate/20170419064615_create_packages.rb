class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.integer :order_id
      t.timestamps
    end
    add_index :packages, :order_id
  end
end
