class CreatePackageItems < ActiveRecord::Migration[5.0]
  def change
    create_table :package_items do |t|
      t.integer :stock_keeping_unit_id
      t.integer :package_id
      t.timestamps
    end
    add_index :package_items, :package_id
  end
end
