class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :introduction
      t.integer :catalog_id
      t.timestamps
    end
    add_index :listings, :catalog_id
  end
end
