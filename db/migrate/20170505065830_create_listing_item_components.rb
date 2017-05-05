class CreateListingItemComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_item_components do |t|
      t.integer :listing_item_id
      t.integer :stock_keeping_unit_id
      t.integer :quantity
    end

    add_index :listing_item_components, :listing_item_id
    add_index :listing_item_components, :stock_keeping_unit_id
  end
end
