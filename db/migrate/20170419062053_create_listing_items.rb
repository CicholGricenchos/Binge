class CreateListingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_items do |t|
      t.string :name
      t.integer :listing_id
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
    add_index :listing_items, :listing_id
  end
end
